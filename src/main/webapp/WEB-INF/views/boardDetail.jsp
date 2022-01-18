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
			<td colspan="2">
					<!-- 추천 기능 -->
				<c:choose>
					<c:when test="${LikeCheck eq '0' or empty LikeCheck }">
						<input type="button" onclick="like()" value="♡" id ="heart"/>
					</c:when>
					<c:otherwise>
						<input type="button" onclick="like()" value="♥" id ="heart"/>
					</c:otherwise>
				</c:choose>
				<p id="likecnt"> ${board_like} </p>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="button" onclick="location.href='./cyw'" value="리스트"/>
				<input type="button" onclick="location.href='./updateForm?board_num=${boardDetail.board_num}'" value="수정"/>
				<input type="button" onclick="del()" value="삭제"/>
				<input type="button" onclick="" value="공유하기"/>	
			</th>
		</tr>
	</table>
</body>
<script>

	//추천 기능

	
function like() {
		
 	var board_num = ${boardDetail.board_num}

	//console.log("고마워ㅠ");
	//console.log(board_num);
		
	$.ajax({
		url: "updateLike",
		type: "GET",
		data: {'board_num':board_num},
		dataType: "JSON",
		success: function (LikeCheck) {
			
			if (LikeCheck == 1) {
				alert("추천 취소 완료");
				$("#heart").val("♡")
			}else{
				alert("추천 완료");
				$("#heart").val("♥")
			}
		},
		error : function () {
			alert("추천에 실패했습니다.");
		}
	});
}





function del() {
	var yn = confirm("정말 이글을 삭제 하시겠습니까?");
	
	if (yn) {
		location.href='./boardDel?board_num=${boardDetail.board_num}';
	}
	
}

</script>
</html>