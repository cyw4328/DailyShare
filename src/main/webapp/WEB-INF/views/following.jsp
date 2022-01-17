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
    top :50px;
     left:0px;
     margin-bottom: 30px;
   }

   
   
   </style>

<body>
<%@ include file="headerShs_login.jsp"%>
<%@ include file="MyPageShs.jsp"%>
<div id="con_gooDock">

	<div id="gooDock">

		<span class="Following">내가 구독하는 블로거</span>
		<span class="Follow">나를 구독하는 블로거</span>
		

		<p class="followCnt">현재 내가 구독하는 블로거는 ${list.size()} 명 입니다.</p>
		<table>
			<c:forEach var="item" items="${list}">
				<tr>
					<!--  <td>${item.mem_blog}</td> -->
					<td> ${item.mem_id} 블로거</td>
					<td>
						
						
						
						<input class="followBtn" name = "followBtn"  id="${item.mem_id}" type="button" value="구독하기" />
						<script>
						var $sub_id = '${item.sub_id}';
						var id ='#'+${item.sub_num};

						
						
						console.log('스크립트 테스트');
						$.ajax({
							type:'get',
							url:'followBtnShs',
							data:{'sub_id':$sub_id},
							dataType:'JSON',
							success: function(data) {
								if (data.result>0) {
									$(id).val('구독중');
								}
							},
							error: function(e) {
								console.log(e);
							}
							
						})
						

						

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
	 location.href = "/share/followShs";
});



$('.Following').click(function(){
	console.log('팔로잉 클릭 확인');
	location.href = "/share/followingShs";
	
});



var goodock = $('.followBtn').val(); 
$('.followBtn').click(function(){
	console.log('팔로잉 클릭 확인');
	console.log(goodock);
	if(goodock == '구독중'){
		$(this).val('구독중'); 
	}else{
		$(this).val('구독하기'); 
	}

	
});








</script>
</html>