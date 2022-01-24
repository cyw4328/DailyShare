<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>Daily Share</title>
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
   
   .followCnt{
   position: relative;
    top :7px;
     left:0px;
     margin-bottom: 20px;
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
	border-collapse: collapse;
	}

	td{
	border-collapse: collapse;
	padding: 5px 10px;
	}

	.Follow {
	float: right;
	margin-right: 14px;
	cursor: pointer;
	border-bottom:3px solid #CCC;
	font-weight: bold; 
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
  
	.followBtn{
		float:right; 
	   margin-right:10px; 
	   color:#7b7b7b; 
	   font-weight:bold; 
	   border:0px;
	   padding:3px 10px;
	   border:1px solid #b0b0b0;
	   border-radius: 20px;
	   cursor: pointer;
	   background-color: #fff;
	}
	
	.followBtn:hover{
		color:#fff; 
		border:1px solid #f79304;
		background-color: #f79304;
	}
   
   
   </style>

<body>
<%@ include file="headerShs_login.jsp"%>
<%@ include file="MyPageShs.jsp"%>

<div id="con_gooDock">

	<div id="gooDock">
		<span class="Following">내가 구독하는 블로거</span>
		<span class="Follow">나를 구독하는 블로거</span>

		<span id="headTxt">구독관리 목록</span>
		<hr>
		<p class="followCnt">현재 나를 구독하는 블로거는 ${list.size()} 명 입니다.</p>
		<table>
			<c:forEach var="item" items="${list}">
				<tr>
					<%-- <td>${item.mem_blog}</td>  --%>
					<td class="subId">${item.mem_id} 블로거</td>
					<td>

						<a href="./csj_blogMain?mem_id=${item.mem_id}"><input class="followBtn" id="${item.sub_num}" type="button" value="블로그이동" /></a>
						<%-- <button class="followBtn" id="${item.sub_num}">구독하기</button> --%>
						<script>
						var id ='#'+${item.sub_num};
						
						
						var $mem_id = '${item.mem_id}';

						
						


						

							
						
						
					

					</script>


					</td>
				</tr>
			</c:forEach>
			
			
		
			
			
		</table>
	</div>

</div>



					
					
</body>
<script>


 $('.Follow').click(function(){
	 location.href = "./followShs";
});

$('.Following').click(function(){
	console.log('팔로잉 클릭 확인');
	location.href = "./followingShs";
});		 



	














		

	

</script>
</html>