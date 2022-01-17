<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
		.postHeadline{
			width: 1200px;
			height: 1000px;
			border:1px solid black; 
		}
		.postHead{
			border:1px solid black;
			width: 100px;
			height: 300px;
			font-size: 12px;
		}
		
	</style>
</head>
<%@ include file="csjBlogHead.jsp" %>
<body>
	<div class="postHeadline">
		<c:forEach items="${boardList}" var="boardList" begin="0" end="2">
			<!-- 서버에서 path 설정해줘야 함 -->
			<span class='postHead'>
				<c:if test="${not empty boardList.board_thumFileName }">
					<img src="/postImageFolder/${boardList.board_thumFileName}" width="100px"/>
				</c:if>
				${boardList.board_subject}
				${boardList.menu_name}
				<fmt:formatDate value="${boardList.board_date}" pattern="yyyy-MM-dd HH:mm"/>
			</span>		
		</c:forEach>
	</div>
	
</body>
<script>
</script>
</html>