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
	}

	.Follow:hover {
		border-bottom:3px solid #CCC; 
	}
  
  .Following{
  	float: right;
  	cursor: pointer;
  	border-bottom:3px solid #CCC; 
	font-weight: bold;
  }
  
  .Following:hover {
	border-bottom:3px solid #CCC; 
	
	}
	
  .followCnt{
   position: relative;
    top :7px;
     left:0px;
     margin-bottom: 30px;
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
		background-color: #eb3c3c;
	}
   
   
   </style>

<body>
<%@ include file="headerShs_login.jsp"%>
<%@ include file="MyPageShs.jsp"%>
<div id="con_gooDock">

	<div id="gooDock">
		<span id="headTxt">구독관리 목록</span>
		<span class="Following">내가 구독하는 블로거</span>
		<span class="Follow">나를 구독하는 블로거</span>
		<hr>

		<p class="followCnt">현재 내가 구독하는 블로거는 ${list.size()} 명 입니다.</p>
		<table>
			<c:forEach var="item" items="${list}">
				<tr>
					<!--  <td>${item.mem_blog}</td> -->
					<td>${item.sub_id}</td>
					<td>
						
						
						<input class="followBtn" id="${item.sub_num}" type="button" value="구독해제" /> 
						

						

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



var goodock = $('.followBtn').val(); 
$('.followBtn').click(function(){
	console.log('팔로잉 클릭 확인');
	console.log(goodock);
/* 	if(goodock == '구독중'){
		$(this).val('구독하기'); 

	} */

	
});


var BtnVal = '';
$('.followBtn').click(function followCall(){
	console.log($(this).parent().prev().text());
	BtnVal = $(this).val();
	console.log('스크립트 테스트'+BtnVal);
	

	var $sub_id = $(this).parent().prev().text();
	console.log($sub_id);
	   if (confirm("구독을 해제 하시겠습니까?")) {
           alert("구독이 해제 되었습니다.");


	
		$.ajax({
			type:'post',
			url:'followDelShs',
			data:{'mem_id':$sub_id},
			dataType:'JSON',
			success: function(data) {
				console.log(data.result);
				if(data.result>0){

					location.href="./followingShs";
				}
				
				//$(BtnVal).html('<input class="UnfollowBtn" id="${item.sub_num}" type="button" value="구독중" />');
				//location.href="/share/followShs";

			
				
			},
			error: function(e) {
				console.log(e);
			}
			
		}); 
	
       } else {
           // 취소 버튼 클릭 시 동작
       }
		
		
	
});








</script>
</html>