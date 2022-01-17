<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
   <style>
   
   #con_gooDock{width: 1200px;}
   #gooDock{
      position: relative;
      top :100px;
      right:0px;
      float:right;
      width:900px;   
   }
  
  #headTxt{
  font-size: 28px;
  font-style: bold;
 	 } 
   
   table {
	width: 500px;
	position: relative;
	right: 0px;
	top:50px;
	float: left;
	}

	table,td{
	border-bottom: 1px solid black;
	border-collapse: collapse;
	padding: 5px 10px;
	}

	.Follow {
	float: right;
	margin-right: 14px;
	border-bottom:3px solid #FFF; 
	cursor: pointer;
	border-bottom:3px solid #CCC; 
	}

	.Follow:hover {
		border-bottom:3px solid #CCC; 
	}
  
  .Following{
  	float: right;
  	border-bottom:3px solid #FFF; 
  	cursor: pointer;
  }
  
  .Following:hover {
	border-bottom:3px solid #CCC; 
	
	}
  

   
   
   </style>

<body>
<%@ include file="headerShs_login.jsp"%>

<div id="con_gooDock">

	<div id="gooDock">
		<span id="headTxt">구독 블로거 관리</span> 
		<span class="Following">내가 구독하는 블로거</span>
		<span class="Follow">나를 구독하는 블로거</span>
		
		<hr>
		
		<p class="followCnt">현재 나를 구독하는 블로거는 ${list.size()} 명 입니다.</p>
		<table>
			<c:forEach var="item" items="${list}">
				<tr>
					<!--  <td>${item.mem_blog}</td> -->
					<td class="subId">${item.sub_id}</td>
					<td>
						<button type = "submit" class="followBtn">구독중</button>

					</td>
				</tr>
			</c:forEach>
			
		
			
			
		</table>
	</div>

</div>



					
					
</body>
<script>

 $('.Follow').click(function(){
	 location.href = "/share/followShs";
});

$('.Following').click(function(){
	console.log('팔로잉 클릭 확인');
	location.href = "/share/followingShs";
});		 






$('.followBtn').click(function(){
	console.log('팔로우 버튼 클릭 확인');
	var followBtnList = [];
	followBtnList = $(".subId").text();
	console.log(followBtnList);
	location.href = "/share/followBtnShs";
	

	
	
});		














		

	

</script>
</html>