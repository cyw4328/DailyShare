package com.daily.share.controller;

import java.util.HashMap;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daily.share.dto.ShsDTO;
import com.daily.share.service.ShsService;

@Controller

public class ShsController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ShsService service;
	@Autowired private JavaMailSender mailSender;
	@Autowired HttpSession session;
	
	@RequestMapping(value = "/shs", method = RequestMethod.GET)
	public String home(Model model) {
			
		return "joinForm";
	}
	
	
	
	
	
	@RequestMapping(value = "/joinShs", method = RequestMethod.POST)
	public String join(Model model,@RequestParam HashMap<String, String> params) {
		logger.info("회원가입 요청");	
		logger.info("params : {}",params);
	
		service.join(params);
		
		return "login";
	}
	
	
	
	
	
	
	
	
	@GetMapping(value="/mailCheck",consumes = {MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public String mailCheck(String email) throws Exception{
		logger.info("이메일 데이터 전송확인");
		logger.info("인증 메일 : "+email);
		
		Random random = new Random();
		int checkNum = random.nextInt(888888)+111111; // 111111 - 999999
		logger.info("인증번호 : "+checkNum);
		
		//이메일 보내기
		String setFrom = "gustjsdldi2016@gmail.com";
		String toEmail = email;
		String title = "Daily Share 회원가입 인증 이메일 입니다.";
		String content = "Daily Share 가입해주셔서 감사합니다."+ "<br/><br/>"+"인증 번호는 "+checkNum+" 입니다.<br/>"+
							"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toEmail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String num = Integer.toString(checkNum);
        return num;
	}
	
	
	
	
	
	
	//ajax 통신 - 중복 아이디 확인
		@RequestMapping(value = "/overlay", method = RequestMethod.GET)
		@ResponseBody
		public HashMap<String, Object> overlay(@RequestParam String id) {		
			logger.info("중복 아이디 체크 : {}",id);		
			return service.overlay(id);
		}
		
		
// 여기까지가 회원가입 기능 		
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		

//개인정보 수정페이지
@RequestMapping(value = "/memberDe", method = RequestMethod.GET)
	public String memberDe(Model model,HttpSession session) {
	
		String id = (String) session.getAttribute("loginId");
		logger.info("세션아이디 값 : {}",id);
		
		ShsDTO dto = service.memberDe(id);
		model.addAttribute("info", dto);
		
	return "memberDe";
}

		

		
		
@RequestMapping(value = "/userUp", method = RequestMethod.POST)
public String userUp(Model model, @RequestParam String id,@RequestParam String pw, @RequestParam String email, @RequestParam String phone) {
	logger.info("수정 요청 : {}",id+pw+email+phone);	//null 값은 받지 않는것으로 확인
	
	service.userUp(id,pw,email,phone);
	
	return "memberDe";
}
		
	

	
	
	
	
	
	
	
}




