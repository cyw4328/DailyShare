<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<!-- <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script> -->
	<style>
		
		#menuBody a:link { color: black; text-decoration: none;}
		#menuBody a:visited { color: black; text-decoration: none;}
		#menuBody a:hover { color: black; text-decoration: none;}
		
		#blogHead{
			border:1px solid black;
			width: 100%;
			height:85px;
			list-style-type : none;
			margin: 0;
			padding: 0;
			text-align: center;
		}
		.hamberger{
			position: absolute;
			left: 2%;
			top:20px;
		}
		
		img[src="resources/images_csj/hambergerimg.png"]{
			cursor: pointer;
			width: 50px;
			height: 50px;
		}
		.blogName{
			display: inline-block;
			margin-top: 25px;
			font-size:30px;
/* 			position: absolute;
			left:18%;
			top: 25px; */
			
		}
		
		.blogSearch{
			position: absolute;
			font-size:30px;
			right : 70px;
			top: 25px;
		}
		

		
		
		
		#menubox{
			position:absolute;
			display:none;
			border: 1px solid black;
			width:300px;
			min-height: 800px;
			background-color: white;
			z-index: 10;
		}
		.menuTap{
			width: 300px;
			list-style-type : none;
			margin: 0;
			padding: 0;
			text-align: center;
		}
		.menuNone{
			margin-top: 50px;
			text-align: center;
			font-size:16px;
			font-weight: 600;
			color: gray;
		}
		
	</style>
</head>
<body id="menuBody">
	<nav id="blogHead">
		<span class="hamberger">
			<img  src="resources/images_csj/hambergerimg.png" onclick="menuMove();">
		</span>
		<span class="blogName">
			<a href="./csj_blogMain?mem_id=${mem_id}">
					<c:if test="${empty mem_blog}">
						${mem_id}의 블로그
					</c:if>
					<c:if test="${not empty mem_blog}">
						${mem_blog}
					</c:if>
			</a>
		</span>
		<span class="blogSearch">
			검색창
		</span>
	</nav>
	
	<div id="menuBox">
			<ul class="menuTap">
				<c:if test="${empty menu}">
					<li>
						<p class="menuNone">메뉴가 존재하지 않습니다.</p>
					</li>
				</c:if>					
				<c:if test="${not empty menu}">
					<c:forEach items="${menu}" var="list">
							<a href="./csj_menuMain?mem_id=${mem_id}&menu_num=${list.menu_num}">
								<li>${list.menu_name}</li>
							</a>					
				
					</c:forEach>
				</c:if>
			</ul>

	</div>
	
</body>
<script>
function menuMove() {
	console.log('버튼 작동');
	$('#menuBox').animate({width:"toggle"},400);
}

</script>
</html>