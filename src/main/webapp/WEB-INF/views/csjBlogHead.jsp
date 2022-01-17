<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>

		.blogHead{
			border:1px solid black;
			width: 100%;
			height:60px;
			list-style-type : none;
			margin: 0;
			padding: 0;
		}
		.blogHead li{
			float: left;
			padding: 0% 14%;
		}
		
		img[src="resources/images_csj/hambergerimg.png"]{
			cursor: pointer;
			width: 40px;
			height: 40px;
		}
		
		#menubox{
			position:absolute;
			display:none;
			border: 1px solid black;
			width:300px;
			min-height: 800px;
			background-color: white;
		}
		.menuTap{
			width: 300px;
			list-style-type : none;
			margin: 0;
			padding: 0;
			text-align: center;
		}
		
	</style>
</head>
<body>
	<nav>
		<ul class="blogHead">
			<li><img  src="resources/images_csj/hambergerimg.png" onclick="menuMove();"></li>
			<li>${mem_id}'s 블로그</li>
			<li>검색창</li>
		</ul>
	</nav>
	<div id="menuBox">
			<ul class="menuTap">
				<c:forEach items="${menuList}" var="menuList">				
					<li>${menuList.menu_name}</li>
				</c:forEach>
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