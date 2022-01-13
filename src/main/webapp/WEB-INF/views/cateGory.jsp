<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <link rel="stylesheet" href="resources/common.css">
    <style>
    </style>
</head>
<body>
	<form action="bigCategoryAdd" method="POST">
		<table>
			<tr>
				<td>
					대분류 추가 
					<input type="text" name="mainCategoryAdd">
				</td>
			</tr>	
			<tr>
				<td>
					<input type="radio" name="admin" value="1">관리사용자용
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="admin" value="0">일반사용자용
				
					<input type="submit" value="등록">
				</td>
			</tr>
		</table>
	</form>
	<table>
		<c:forEach var="item" items="${bigCategoryList}">
			<tr>
					<td>${item}</td>
					<td><a href="bigCategoryDel?bigCategory=${item}"><button>삭제</button></a></td>
			</tr>
		</c:forEach>
	</table>
	<br/>
	
	<form action="middleCategoryAdd" method="POST">
		<table>
			<tr>
				<td>
					중분류 추가
					<input type="text" name="middleCategoryAdd">
 					<select id="bigSelec" name="daeCategory">
						<option selected="selected">대분류선택</option>
						<c:forEach var="item" items="${bigCategoryList}">
							<option><c:out value="${item}"/></option>
						</c:forEach>
					</select>
				</td>
			</tr>

			<tr>
				<td>
					<input type="radio" name="admin" value="1">관리사용자용
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="admin" value="0">일반사용자용
				
					<input type="submit" value="등록">
				</td>
			</tr>
		</table>
	</form>
		<table>
			<c:forEach var="item1" items="${midCategoyrList}">
				<tr>
						<td>${item1}</td>
						<td><a href="midCategoryDel?midCategory=${item1}"><button>삭제</button></a></td>
				</tr>
			</c:forEach>
		</table>
		<br/>
</body>
<script>
</script>
</html>