<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <style>
        .ForumInput{
    		 text-align: center; 
    	}

    	#forumTd{
    		border: 1px solid black;
    		width: 400px;
    		text-align: center;
    	}
    </style>
</head>
<body>
	<button onclick="location.href='./'">돌아가기</button>
	<h1>검색결과입니다.</h1>

	<table>
		<tbody>
		<c:forEach var="item" items="${list}">
			<tr onclick="location.href='./csj_detail?board_num=${item.board_num}&mem_id=${item.mem_id}'" style="cursor: hand">
				<td id="forumTd">
					<c:out value="${item.mem_id}"/>&nbsp;&nbsp;<c:out value="${item.board_date}"/>&nbsp;&nbsp;추천수 : <c:out value="${item.board_like}"/><br/>
					<c:out value="${item.board_subject }"/><br/>
					<c:out value="${item.board_cont}"/>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
<script>

</script>
</html>