package com.daily.share.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daily.share.dto.ShsDTO;
import com.daily.share.dto.ShsFollowDTO;
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
//		logger.info("회원가입 요청");	
//		logger.info("params : {}",params);
	
		service.join(params);
		
		return "login";
	}
	
	
	
	
	
	
	
	
	@GetMapping(value="/mailCheck",consumes = {MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public String mailCheck(String email) throws Exception{
//		logger.info("이메일 데이터 전송확인");
//		logger.info("인증 메일 : "+email);
		
		Random random = new Random();
		int checkNum = random.nextInt(888888)+111111; // 111111 - 999999
//		logger.info("인증번호 : "+checkNum);
		
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
//			logger.info("중복 아이디 체크 : {}",id);		
			return service.overlay(id);
		}
		
		
// 여기까지가 회원가입 기능 		
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
				

//개인정보 수정페이지
@RequestMapping(value = "/memberDe", method = RequestMethod.GET)
	public String memberDe(Model model,HttpSession session) {
	
		String id = (String) session.getAttribute("loginId");
//		logger.info("세션아이디 값 : {}",id);
		
		ShsDTO dto = service.memberDe(id);
		model.addAttribute("info", dto);
		
	return "memberDe";
}

		

		
// 회원정보 수정 요청
@RequestMapping(value = "/userUp", method = RequestMethod.POST)
public String userUp(Model model, @RequestParam String id,@RequestParam String pw, @RequestParam String email, @RequestParam String phone, @RequestParam String blog) {
//	logger.info("수정 요청 : {}",id+pw+email+phone);	//null 값은 받지 않는것으로 확인
	
	service.userUp(id,pw,email,phone,blog);
	
	return "redirect:/memberPassCk";
}


//로그아웃
@RequestMapping(value = "/logoutShs", method = RequestMethod.GET)
public String logoutShs(HttpSession session) {
//	logger.info("로그아웃 컨트롤러");
	
	Object object = session.getAttribute("loginId");
	
	if(object != null) {
		session.removeAttribute("loginId");
		session.invalidate();
	}
	
	
	return "redirect:/";
}



//회원탈퇴
@RequestMapping(value = "/memberOut", method = RequestMethod.GET)
public String memberOut(HttpSession session) {
//	logger.info("회원탈퇴 컨트롤러");
	
	Object object = session.getAttribute("loginId");
	
	if(object != null) {
		session.getAttribute("loginId");
//		logger.info("회원탈퇴 컨트롤러 : {}",object);
		
		service.memberOut(object);
		session.invalidate();
	}
	
	return "redirect:/";
}


///////////////////////////////////////////////////////////////////////////////////////////////////
	
//구독 페이지 - 나를 구독하는 블로거
@RequestMapping(value = "/followShs", method = RequestMethod.GET)
public String followShs(Model model,HttpSession session) {
//	logger.info("구독관리 컨트롤러 - 나를 구독");
	
	String loginId = (String) session.getAttribute("loginId");
	String page ="redirect:/MainPageShs";
	if(loginId != null) {
		page = "followShs";
		ArrayList<ShsFollowDTO> list = service.FollowerList(loginId);
		model.addAttribute("list",list);	
	}	
	
	return page;
}


//구독 페이지 - 내가 구독하는 블로거
@RequestMapping(value = "/followingShs", method = RequestMethod.GET)
public String followingShs(Model model,HttpSession session) {
//	logger.info("구독관리 컨트롤러 - 내가 구독");
	
	String loginId = (String) session.getAttribute("loginId");
	String page ="redirect:/MainPageShs";
	if(loginId != null) {
		page = "following";
		ArrayList<ShsFollowDTO> list = service.followingShs(loginId);
		model.addAttribute("list",list);	
	}	
	
	return page;
}




  //구독 여부 확인
@RequestMapping(value = "/followBtnShs", method = RequestMethod.GET)
@ResponseBody
public HashMap<String, Object>  followBtnShs(Model model,HttpSession session,@RequestParam String mem_id) {
	String sub_id = (String) session.getAttribute("loginId");
//	logger.info("팔로우 여부 컨트롤러 : {}",mem_id+sub_id);
	return service.followBtnShs(mem_id,sub_id);
}

// 구독 추가
//구독 버튼
@RequestMapping(value = "/followPlusShs", method = RequestMethod.POST)
@ResponseBody
public HashMap<String, Object>  followPlusShs(Model model,HttpSession session,@RequestParam String mem_id) {
	String sub_id = (String) session.getAttribute("loginId");
//	logger.info("팔로우 버튼 컨트롤러");
	
//	logger.info("{}",mem_id+sub_id);
	return service.followPlusShs(mem_id,sub_id);
}





//구독삭제
@RequestMapping(value = "/followDelShs", method = RequestMethod.POST)
@ResponseBody
public HashMap<String, Object>  followDelShs(Model model,HttpSession session,@RequestParam String mem_id) {
	String sub_id = (String) session.getAttribute("loginId");
//	logger.info("언팔 컨트롤러");
	
//	logger.info("{}",mem_id+sub_id);
	return service.followDelShs(mem_id,sub_id);
}






@RequestMapping(value = "/followBtnPage", method = RequestMethod.GET)
public String  followBtnPage(Model model,HttpSession session) {
	String mem_id = (String) session.getAttribute("loginId");
//	logger.info("followBtnPage 컨트롤러");
	return "followBtnPage";
}










@RequestMapping(value = "/MainPageShs", method = RequestMethod.GET)
public String MainPageShs(Model model) {
//	logger.info("메인페이지 요청");	

	
	return "MainPageShs";
		}




@RequestMapping(value = "/memberPassCk", method = RequestMethod.GET)
public String memberPassCk(Model model,HttpSession session) {
//	logger.info("비밀번호체크 페이지 컨트롤러");	
	String object = (String) session.getAttribute("loginId");

	String Page ="redirect:/loginPage";
	if(object != null) {
		session.getAttribute("loginId");
		Page ="memberPassCk";
	}	

	return Page;
	}



@RequestMapping(value = "/PassCk", method = RequestMethod.POST)
	public String PassCk(Model model,HttpSession session, @RequestParam String pw,@RequestParam String id) {
//		logger.info("비밀번호체크 컨트롤러{}",pw+id);	
		Object object = session.getAttribute("loginId");
	
		String Page ="redirect:/loginPage";
		if(object != null) {
			session.getAttribute("loginId");
			String msg ="비밀번호가 일치하지 않습니다.";
			String Ck = service.PassCk(id,pw);
			
			if(Ck != null) {
				Page ="redirect:/memberDe";
			}else {
				Page ="redirect:/memberPassCk";

			}
			
			
		}	
	
		return Page;
	}





//관리자 마이페이지
@RequestMapping(value = "/adminCk", method = RequestMethod.GET)
@ResponseBody
public HashMap<String, Object>  adminCk(Model model,@RequestParam String adminLogin) {
	
//	logger.info("어드민 여부 확인 컨트롤러{} : ",adminLogin);
	return service.adminCk(adminLogin);



	}


}









