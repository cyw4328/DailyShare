<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
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
   
   #formCs{
	   border:1px solid #ccc;
	   width:300px;
	   margin-top:70px;
	   padding:60px 50px	;
   }
   
   .formSt{
   	padding:5px;
   	margin:5px;
   	margin-bottom: 5px;
   }

   
   
   </style>

<body>
<%@ include file="headerShs_login.jsp"%>

<div id="con_memberDe">

<div id="sujung_txt">
<p>개인정보 수정</p>
<input type="button" value="회원 탈퇴하기" style="float: right;">
<hr>

	<div id="formCs">
	
		<form action="#">
				ID : <input type="text" value="${loginId}" class="formSt" /></br>
				비밀번호 : <input type="password" placeholder="새로운 비밀번호" class="formSt" "/></br>
				비밀번호 : <input type="password" placeholder="새로운 비밀번호"  class="formSt"  "/></br>
				이름 : <input type="text" value="이름"  class="formSt" ></br>
				E-MAIL : <input type="text" value="이메일 "  class="formSt" ></br>
				전화번호 : <input type="text" value="전화번호"  class="formSt" ></br>
				<input type="submit" value="저장">

		</form>
	</div>
</div>


	
</div>










</body>
<script>


</script>
</html>