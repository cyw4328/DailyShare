<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
	</style>
</head>
<body>
	로그인 한 아이디 : ${loginId}
	<table>
		<c:forEach items="${memberList}" var="list">
			<tr>
				<td>
					<a href="./csj_blogMain?mem_id=${list.mem_id}">
						${list.mem_id}
					</a>
					
				</td>
			</tr>				
		</c:forEach>
	</table>

</body>
<script>
</script>
</html>