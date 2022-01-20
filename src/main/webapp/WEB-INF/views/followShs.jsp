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
   
   .followCnt{
   position: relative;
    top :50px;
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
	}

	table,td{
	border-bottom: 1px solid black;
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
					<!--  <td>${item.mem_blog}</td> -->
					<td class="subId">${item.mem_id}</td>
					<td>

						<input class="followBtn" id="${item.sub_num}" type="button" value="구독하기" /> 
						<%-- <button class="followBtn" id="${item.sub_num}">구독하기</button> --%>
						<script>
						var id ='#'+${item.sub_num};
						
						
						var $mem_id = '${item.mem_id}';

						
						
						
						console.log('스크립트 테스트');
						$.ajax({
							type:'get',
							url:'followBtnShs',
							data:{'sub_id':$mem_id},
							dataType:'JSON',
							success: function(data) {
								if (data.result>0) {
									console.log('data.result');
									$(id).val('구독중');
									//$(id).html('<button class="un-followBtn" id="${item.sub_num}">구독중</button>');
									
								}
							},
							error: function(e) {
								console.log(e);
							}
							
						});
						
						
							
							
						
						
						
						

						

							
						
						
					

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




var BtnVal = '';
$('.followBtn').click(function followCall(){
	console.log($(this).parent().prev().text());
	BtnVal = $(this).val();
	console.log('스크립트 테스트'+BtnVal);
	
	var $mem_id = $(this).parent().prev().text();
	if((BtnVal) == '구독하기'){	
		console.log('구독 테스트');
		console.log(BtnVal);
		
		$.ajax({
			type:'post',
			url:'followPlusShs',
			data:{'mem_id':$mem_id},
			dataType:'JSON',
			success: function(data) {
				if(data.result > 0){
				console.log(data.result);
				location.href="./followShs";
				//$(id).html('<button class="un-followBtn" id="${item.sub_num}">구독중</button>');
				}	
				
			},
			error: function(e) {
				console.log(e);
			}
			
		}); 
	}
		
		
		
	
});



	














		

	

</script>
</html>