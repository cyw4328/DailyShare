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
      padding:60px 50px   ;
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
<p id="headTxt">비밀번호 확인</p>
<hr>
<p class="followCnt">개인정보 수정을 위해 비밀번호 확인 부탁드립니다.</p>
		
   <div id="formCs">
     	 <form action="/share/PassCk" method="POST">
            ID : <input type="text" name="id"  value="${loginId}" class="formSt" readonly="readonly" /></br>
            비밀번호 : <input type="password" name="pw" placeholder="비밀번호" class="pw" /></br>
 			<p id="msg">${msg}</p>
            <button id="btn-join">확인</button>
	      </form>
	   </div>
	   
	</div>

</div>
</body>
<script>

var pw = $("input[name='pw']").val();

$("#btn-join").on("click", function(e) {
		
		
	   
		$("form").submit();
	});








</script>
</html>