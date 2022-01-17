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
	<table>
		<tr>
			<th>글번호</th>
			<td>${boardDetail.board_num }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${boardDetail.board_subject }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${boardDetail.board_views }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${boardDetail.mem_id }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${boardDetail.board_cont }</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="button" onclick="location.href='./cyw'" value="리스트"/>
				<input type="button" onclick="location.href='./updateForm?board_num=${boardDetail.board_num}'" value="수정"/>
				<input type="button" onclick="del()" value="삭제"/>
				
			</th>
		</tr>
	</table>
</body>
<script>

function del() {
	var yn = confirm("정말 이글을 삭제 하시겠습니까?");
	
	if (yn) {
		location.href='./boardDel?board_num=${boardDetail.board_num}';
	}
	
}

</script>
</html>