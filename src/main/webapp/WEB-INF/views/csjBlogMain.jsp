<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="resources/js/jquery.twbsPagination.js"></script>
	
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>  
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<!-- <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script> -->
	
	
	<style>

		#container_wrap{
			position:relative;
			width: 1400px;
			height: 1500px;
			border:2px solid red; 
			margin: 0 auto;
		}
	
		#headline_wrap{
			width: 906px;
			height: 300px;
			border:1px solid black;
			margin: 0 auto;
		}
		.headLine{
			float:left;
			border:1px solid black;
			width: 200px;
			height: 300px;
			font-size: 14px;
			margin: 0px 50px auto;
		}
		.headIMG{
			text-align: center;
			border:2px solid blue;
			width: 200px;
			height: 150px;
			
		}
		#body_wrap{
			width: 906px;
			height: 1000px;
			border:1px solid black;
			margin: 0 auto;
		}
		.body{
			border-bottom:1px solid red;
			width: 100%;
			height:180px;
			margin: 20px 0px;
		}
		.bodyIMG{
			text-align: center;
			border:1px solid black;
			width: 230px;
			height: 160px;
			float: left;
			margin-right: 30px;
		}
		.bodySub{
			display: block;
			font-size: 24px;
			font-weight: 600;
			padding: 15px 0px;
		}
		.bodyCont{
			display: block;
		}
		
		#pagingBox{
		margin:0 auto;
			
		}
	</style>
</head>
<body>
	<div id="container_wrap">
		<%@ include file="csjBlogHead.jsp" %>
	
		<div id="headline_wrap">
			<c:forEach items="${boardList}" var="boardList" begin="0" end="2">
				<!-- 서버에서 path 설정해줘야 함 -->
				<div class='headLine'>
					<div class='headIMG'>
						<c:if test="${not empty boardList.board_thumFileName }">
							<img src="/postImageFolder/${boardList.board_thumFileName}" style="max-width:200px;max-height:150px;z-index:none;"/>
						</c:if>
						<c:if test="${empty boardList.board_thumFileName }">
							<img src="/postImageFolder/noimage.png"  style="max-width:200px;max-height:150px; z-index:none;"/>
						</c:if>
					</div>
					${boardList.board_subject}<br/>
					${boardList.menu_name}<br/>
					<fmt:formatDate value="${boardList.board_date}" pattern="yyyy-MM-dd HH:mm"/>
				</div>		
			</c:forEach>
		</div>
		
		<div id="body_wrap">	
		</div>	
	
		<table id="pagingBox">
			<tr>
				<td colspan="5" id="paging">
		            <div class="container">                           
		               <nav aria-label="Page navigation" style="text-align:center">
		                  <ul class="pagination" id="pagination"></ul>
		               </nav>               
		            </div>
				</td>
			</tr>
		</table>

		
		
		
		
		
		
		
		
		
		
		
		
		
	
	</div>
</body>
<script>
	var currPage = 1;
	var totalPage = 2;
	var $mem_id = '${mem_id}';
	
	listCall(currPage,5);
	
	
	function more(){ //다음 페이지로 넘겼을 때
		currPage++;
		console.log('currPage',currPage);
		if(currPage>totalPage){
			$('button').attr('disabled',true);
		}else{
			listCall(currPage, 5);			
		}
	}

	
	function listCall(page, cnt) {
		
		$.ajax({
			type:'get',
			url: 'csj_pagingList',
			data: {'page':page,'cnt':cnt,'mem_id':$mem_id},
			dataType: 'JSON',
			success: function(data) {
				console.log(data);
				totalPage = data.pages;
				listDraw(data.list);
				
				$('#pagination').twbsPagination({
					startPage: currPage,//현재 페이지
					totalPages: totalPage,//만들수 있는 총 페이지 수
					visiblePages:5, //[1][2][3]... 이걸 몇개 까지 보여줄 것인지
					onPageClick:function(evt,page){//해당 페이지 번호를 클릭했을때 일어날 일들
						console.log(evt); //현재 일어나는 클릭 이벤트 관련 정보들
						console.log(page);//몇 페이지를 클릭 했는지에 대한 정보
						listCall(page, 5);
					}
				});
			},
			error: function(e) {
				console.log(e);
			}
		});
	}

	function listDraw(list) {
		var content = '';
		list.forEach(function(item,board_num) {
			content += '<div class="body" onclick="boardDetail('+item.board_num+');">';
			content += '<div class="bodyIMG"><img src="/postImageFolder'+item.board_thumFileName+'" style="max-width:230px;max-height:160px;z-index:none;"></div>';
			content += '<spam class="bodySub">'+item.board_subject+'</spam>'
			content += '<spam class="bodyCont">'+item.board_cont+'</spam>'
			content += '<spam class="bodyMenu">'+item.menu_name+'</spam>'
			content += '<spam class="bodyDate">'+item.board_date+'</spam>'
			content += '</div>'
		});
	 	$('#body_wrap').empty();
		$('#body_wrap').append(content);
	}



</script>
</html>