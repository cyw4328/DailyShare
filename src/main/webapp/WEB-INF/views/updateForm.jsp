<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Daily Share</title>
    <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <link rel="stylesheet" href="resources/common.css">
    <style>
    </style>
</head>
<body>
	<form action="update" method="POST">
		<table>
			<tr>
				<th>제목</th>
				<td>
					<input type="hidden" name="board_num" value="${boardDetail.board_num }">
					<input type="text" name="subject" value="${boardDetail.board_subject }">
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${boardDetail.mem_id }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content">${boardDetail.board_cont }</textarea></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" onclick="location.href='./cyw'" value="취소"/>
					<input type="submit" value="저장"/>
				</th>
			</tr>
		</table>
		</form>
</body>
<script>


</script>
</html>