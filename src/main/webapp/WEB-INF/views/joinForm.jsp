<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
   <link rel="stylesheet" type="text/css" href="resources/css/HS.css">
   <style>
   
  
   
   </style>
<body>
<%@ include file="headerShs_login.jsp"%>




<div class="container">
<div class="formDiv">
        <form action="joinShs" method="post">
            <h2>Daily Share</h2>
                <table>
                    <tr>
                        <th>ID</th>
                        <td><input type="text" name="id" class = "joinCL" placeholder="6~20글자를 입력하세요" style="border-bottom: 1px solid #ccc;"/>
                        <input type="button" id="overlay" value="중복체크"/></td>
                        
                    </tr>
                    <tr>
                        <th>PW</th>
                        <td><input type="password" name="pw" class = "joinCL" placeholder="6~20글자를 입력하세요" style="border-bottom: 1px solid #ccc;"/></td>
                    </tr>
                    <tr>
                        <th>PW 확인</th>
                        <td><input type="password" name="repw" class = "joinCL"  style="border-bottom: 1px solid #ccc;"/></td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td><input type="text" name="name" class = "joinCL"  style="border-bottom: 1px solid #ccc;"/></td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td><input type="text" name="phone" class = "joinCL"  placeholder=" '-' 를 입력해 주세요 "  style="border-bottom: 1px solid #ccc;"/></td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td><input type="text" name="email" class = "joinCL" style="border-bottom: 1px solid #ccc; "/>
                        <input type="button" id="mailCheck" value="메일발송"/></td>
                        </td>
                    </tr>
                    <tr id="enumber">
                        <th>인증번호</th>
                        <td><input type="text" name="ecode" class = "joinCL"  style="border-bottom: 1px solid #ccc;" />
                        <!-- 인증번호 확인 -->
      					<div class="alert alert-success" id="alert-success-email">인증번호가 일치합니다.</div>
      					<div class="alert alert-danger" id="alert-danger-email">인증번호가 일치하지 않습니다.</div>
                        </td>
                    </tr>
                    <tr>
                        <th>블로그이름</th>
                        <td><input type="text" name="bname" class = "joinCL"  style="border-bottom: 1px solid #ccc;"/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="checkbox" checked>개인정보동의(필수)</td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="회원가입" id="btn-join"></td>
                    </tr>
            </table>
        </form>
        </div>
        
    </div>
    </div>

</body>
<script>
$("#alert-success-email").hide();
$("#alert-danger-email").hide();
$("#enumber").hide();



var check = false;
var checkId = false;


//회원가입 버튼 클릭
$("#btn-join").on("click", function(e) {
   e.preventDefault();
   var id = $("input[name='id']").val();
   var pw = $("input[name='pw']").val();
   var repw = $("input[name='repw']").val();
   var name = $("input[name='name']").val();
   var phone = $("input[name='phone']").val();
   var bname = $("input[name='bname']").val();
   var email = $("input[name='email']").val();


   
   
   //아이디,비밀번호 유효성 검사
   if (id == null || id == "") { 
      alert("아이디를 입력해주세요");
      return false;
   } 
   if (pw == null || pw == "") { 
      alert("비밀번호를 입력해주세요");
      return false;
   } 
   if (repw == null || repw == "") { 
      alert("비밀번호 확인을 입력해주세요");
      return false;
   } 
   if (name == null || name == "") { 
      alert("이름을 입력해주세요");
      return false;
   } 
   if (phone == null || phone == "") { 
      alert("전화번호를 입력해주세요");
      return false;
   } 

   if (check == false) { 
      alert("인증번호를 확인 해주세요");
      return false;
   } 
   
   if (checkId == false) { 
	      alert("중복체크 확인 해주세요");
	      return false;
	   }
   

   if (bname == null || bname == "") { 
      alert("블로그 이름을 입력해주세요");
      return false;
   } 
   
  
   
   var param = {'id':id};
   param.pw = pw;
   param.name = name;
   param.phone = phone;
   param.email = email;
   param.bname = bname;
   param.pw = pw;
   
   console.log(param);
   console.log('서버전송 시작');
   $("form").submit();

   
   
   
});


//인증번호를 저장할 변수
var code = "";

//인증번호 이메일 전송
$("#mailCheck").on("click",function(e){
   console.log('버튼확인');
   $("#enumber").show();
   e.preventDefault();
   email = $("input[name='email']").val();
   var ecode = $("input[name='ecode']");
   
   $.ajax({
      type:"GET",
      url : "mailCheck",
      data : {email : email},
      contentType :"text/plain;charset=UTF-8",
      success : function(data){ //인증번호를 가져옴
         
         //checkBox.val(''); // 기존에 값이 있었으면 지워줌
         $("#alert-success-email").hide();
         $("#alert-danger-email").hide();
         check = false;
         code = data; // 인증번호를 변수에 저장
      }
   });
});
      

      
      
      
      
      

//인증코드 입력 시 동일성 확인
$("input[name='ecode']").keyup(function() {
	
	var inputCode = $("input[name='ecode']").val();
	if (inputCode != "" || code != "") {
		if (inputCode == code) {
			$("#alert-success-email").show();
			$("#alert-danger-email").hide();
			//$("input[name='ecode']").attr("disabled",true); //인증번호 입력 멈춤
			check = true;
		} else {
			$("#alert-success-email").hide();
			$("#alert-danger-email").show();
			check = false;
		}
	}
});      
      
      
      
      





//아이디 중복 체크
$('#overlay').click(function(){
	console.log('중복 체크 시작!');
	
	var id = $('input[name="id"]').val();
	console.log('check id : ',id);
			
	$.ajax({
		type:'get',
		url:'overlay',
		data:{'id':id},
		dataType:'json',
		success:function(data){
			console.log(data);
			
			if(data.overlay){
				alert('이미 사용중인 아이디 입니다.');
				$('input[name="id"]').val('');
			}else{
				alert('사용 가능한 아이디 입니다.');
				checkId = true;
			}	
			
		},
		error:function(e){
			console.log(e);
		}
	});			
	
	
	
	
	
	
	
	
	
	
			
});
      
      
      
      
      
      

</script>
</html>