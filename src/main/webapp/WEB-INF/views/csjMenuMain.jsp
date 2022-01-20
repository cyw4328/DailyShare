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
	
		a:link { color: black; text-decoration: none;}
		a:visited { color: black; text-decoration: none;}
		a:hover { color: black; text-decoration: none;}

		
		
		#container_wrap{
			position:relative;
/* 			width: 1400px;
			height: 1500px; */
			/* border:2px solid red; */ 
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
			position:relative;
			width: 906px;
			/* border:1px solid black; */
			margin: 0 auto;
		}
		.body{
			position:relative;
			border-bottom:2px solid lightgray;
			width: 100%;
			height:290px;
			padding: 20px 0px;
		}
		.bodyIMG{
			position:relative;
			text-align:center;
			display: flex;
			align-items: center; 
			justify-content: center;
			border:1px solid lightgray;
			width: 300px;
			height: 250px;
			float: left;
			margin:0px 15px;
		}
		
		.bodyCont_wrap{
			/* position:relative; */
			/* border:1px solid black; */
			float: left;
			width: 574px;
			height: 100%;
			padding: 20px 0px;

			
		
		}
		
		.bodySub{
			display: block;
			font-size: 25px;
			font-weight: 600;
			max-height: 70px;
			overflow: hidden;
			/* white-space :nowrap; */
			text-overflow: ellipsis;
			margin-bottom: 10px;
		}
		.bodyCont{
			/* position:absolute; */
			font-size: 20px;
			/* display: block; */
			/* height: 105px; */
			overflow: hidden;
			/* margin-bottom: 20px; */
			display: -webkit-box;
	        -webkit-line-clamp: 3;
	        -webkit-box-orient: vertical;
	        padding-top: 10px;
		}
		.bodyMenu{
			position:absolute;
			bottom:45px;
			font-size: 16px;
			color: crimson;
			
		}
		.bodyDate{
			position:absolute;
			bottom:47px;
			right:320px;
			font-size: 14px;
			color: gray;
		}
		
		#pagingBox{
		margin:0 auto;
			
		}
		
		.bodyNone{
			margin: 100px;
			text-align: center;
			font-size:20px;
			font-weight: 600;
			color: grey;
		}
	</style>
</head>
<body>
	<div id="container_wrap">
		<%@ include file="csjBlogHead.jsp" %>
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
	var $menu_num = '${menu_num}'
	
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
			url: 'csj_pagingListMenu',
			data: {'page':page,'cnt':cnt,'mem_id':$mem_id,'menu_num':$menu_num},
			dataType: 'JSON',
			success: function(data) {
				console.log(data);
				totalPage = data.pages;
				listDraw(data.list);					

				
				if (data.list.length>0) {
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
					
				}
			},
			error: function(e) {
				console.log(e);
			}
		});
	}
	function listDraw(list) {
		var content = '';
		
		if (list.length>0) {
			list.forEach(function(item,board_num) {
				content += '<a href="./csj_detail?board_num='+item.board_num+'&mem_id='+$mem_id+'"><div class="body">';
				content += '<div class="bodyIMG"><img src="/postImageFolder/'+item.board_thumFileName+'" style="max-width:300px;max-height:250px;z-index:none;"></div>';
				content += '<span class="bodySub">'+item.board_subject+'</span>'
				content += '<span class="bodyCont">'+item.board_cont+'</span>'
				content += '<span class="bodyMenu">'+item.menu_name+'</span>'
				
				var date = new Date(item.board_date).toLocaleString();	
				content += '<span class="bodyDate">'+date+'</span>'
				content += '</div></a>'
	
			});
		}else {
			content='<p class="bodyNone">게시글이 존재하지 않습니다.</p>'
		}
	 	$('#body_wrap').empty();
		$('#body_wrap').append(content);
	}



</script>
</html>