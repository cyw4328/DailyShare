<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <style>
    *{margin: 0 auto;}
    
    #FeedPageMain{
   		width:1000px;
    	position: relative;
    	left: 0px;
    	top: 100px;
    }
        .ForumInput{
    		 text-align: center; 
    	}

    	#forumTd{
    		border-bottom: 1px solid black;
    		width: 1000px;
    		text-align: center;

    	}
    	
    	.searchLi{
    		position: relative;
    		top:150px;
    		left: 0;
    	}
    	
    	
    	
    </style>
</head>
<body>
	<%@ include file="headerShs_login.jsp"%>
	
	<div>
		<div id="FeedPageMain">
			<h2>Search</h2>
	    	<h4>검색 결과 입니다.</h4>	
	    	<hr style="border:1px solid black; width:1000px; " >
	    	
		</div>	
	
	
<!-- 	<button onclick="location.href='./'">돌아가기</button>
	<h1>검색결과입니다.</h1> -->

	<table>
		<tbody>
		<c:forEach var="item" items="${list}">
			<tr onclick="location.href='./csj_detail?board_num=${item.board_num}&mem_id=${item.mem_id}'" style="cursor: hand" class="searchLi">
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