<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
   <link rel="stylesheet" type="text/css" href="resources/css/HS.css">
   <style>
   
   #con_memberDe{width: 1200px;}
   #sujung_txt{
      position: relative;
      top :100px;
      right:0px;
      float:right;
      width:900px;
      
      
   }
   
   #sujung_txt p{
   display: inline;
   }
   

   
   .formSt{
      padding:5px;
      margin:5px;
      margin-bottom: 5px;
   }
   .pw{
      padding:5px;
      margin:5px;
      margin-bottom: 5px;
   }

	#headTxt{
	  font-size: 28px;
 	 font-style: bold;
	}
	
   
   
   </style>

<body>
<%@ include file="headerShs_login.jsp"%>
<%@ include file="MyPageShs.jsp"%>

<div id="con_memberDe">

<div id="sujung_txt">
<p id="headTxt">개인정보 수정</p>
<input type="button" value="회원 탈퇴하기" style="float: right;" id="userOut_btn">
<hr>

   <div id="formCs">
   
     	 <form action="userUp" method="POST">
     	 
     	 	<table style ="width:420px;">
     	 		<tr>
	            	<th>ID</th>
	            		<td  style="border-bottom:1px solid #dedede;"><input type="text" name="id"  value="${loginId}" class="formSt" readonly="readonly" /></td>
	            </tr>
	            <tr>
	            	<th>비밀번호</th>
	           		<td  style="border-bottom:1px solid #dedede;"><input type="password" name="pw" placeholder="새로운 비밀번호" class="pw" value="${info.mem_pw}"  style="border:1px solid #ccc;"/></td>
	           	</tr>
	            	<th>확인</th>
	            	<td  style="border-bottom:1px solid #dedede;"><input type="password" name="repw" placeholder="비밀번호 확인"  class="pw" value="${info.mem_pw}" style="border:1px solid #ccc;"/></td>
	            </tr>
	        		<div class="successPw" id="successPw" style="color:#2cba00;">비밀번호가 일치합니다.</div>
					<div class="dangerPw" id="dangerPw" style="color:#ce0000;">비밀번호가 일치하지 않습니다.</div>
	      		</tr>
	            <tr>
	            	<th>이름</th>
	            	<td  style="border-bottom:1px solid #dedede;"><input type="text" value="${info.mem_name}" name="name" class="formSt" readonly="readonly"></td>
	            </tr>
	           <tr>
	           		<th>E-MAIL</th>
	           		<td  style="border-bottom:1px solid #dedede;"><input type="text" value="${info.mem_email}" name="email"  class="formSt"   style="border:1px solid #ccc;"></td>
	           		</tr>
	           <tr>
	           		<th>전화번호</th>
	           		<td  style="border-bottom:1px solid #dedede;"><input type="text" value="${info.mem_phone}" name="phone" class="formSt"  style="border:1px solid #ccc;"></td>
	           	</tr>
	           	<tr>
	           		<th>블로그이름</th>
	           		<td  style="border-bottom:1px solid #dedede;"><input type="text" value="${info.mem_blog}" name="blog" class="formSt"  style="border:1px solid #ccc;"></td>
	           	</tr>
	            <tr><td colspan="2" style="border:0px; text-align: center; border-bottom:1px solid #dedede;"><button id="btn-join"  style="border:1px solid #fff; font-size: 15px; font-weight: bold; border-radius: 10px; cursor: pointer;" >저장</button></td></tr>
			</table>
	      </form>
	   </div>
	</div>

</div>
</body>
<script>
$("#successPw").hide();
$("#dangerPw").hide();


var checkPw = false;
var finalPw = null;

var pw =$("input[name='pw']").val();
var repw = $("input[name='repw']").val();


$("#btn-join").click(function() {
	
	alert('저장이 완료되었습니다.');
	$("form").submit();
});	
	


$("#userOut_btn").click(function() {
    console.log('userOut_btn 확인');     
	
    var inputOut1 = prompt(" '탈퇴' 를 입력해주세요' ");
    
    if(inputOut1 != null){
    	var trimOut1 = inputOut1.trim();
    	
    	if(trimOut1 != "" && trimOut1 != '탈퇴'){
    		console.log('탈퇴불가'); 
    		alert('탈퇴가 불가합니다. 다시 시도해 주세요.');
    	}else if(trimOut1 == '탈퇴'){
    		console.log('탈퇴가능');
    		alert('탈퇴 되었습니다. 이용해 주셔서 감사합니다.');
    		location.href="./memberOut";
    	}
    	
    	
    	

    	
    	
    	
    	
    }
    
 });









$("#btn-join").on("click", function(e) {
	   e.preventDefault();
	   pw = $("input[name='pw']").val();
	   var phone = $("input[name='phone']").val();
	   var email = $("input[name='email']").val();
	   

	   
	   
	    console.log('서버전송 시작');
	    console.log("수정_pw: "+pw);
		console.log("수정_email: "+email);
		console.log("수정_전화번호: "+phone);
		
		
	   
	   $("form").submit();
	});
	
	

	 $('.pw').keyup(function () {
	        pw =$("input[name='pw']").val();
	        repw = $("input[name='repw']").val();
	  
	        if (pw != "" || repw != "") {
				if (pw == repw) {
					$("#successPw").show();
					$("#dangerPw").hide();
					finalPw = repw;
					checkPw = true;
				} else {
					$("#successPw").hide();
					$("#dangerPw").show();
					checkPw = false;
				}
			}
	    });


</script>
</html>