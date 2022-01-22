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
  	    
	    #ForumPage{
	   		width:1000px;
	    	position: relative;
	    	left: 0px;
	    	top: 100px;
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
		<div id="ForumPage">
			<h2>Search</h2>
	    	<h4>검색 결과 입니다.</h4>	
	    	<hr style="border:1px solid black; width:1000px; " >
	    	
		</div>	
		
	<!--  <button onclick="location.href='./ForumBoard'">돌아가기</button>
	<h1>검색결과입니다.</h1>-->

	<table>
		<tbody>
		
		<c:forEach var="item" items="${list}">
			<tr onclick='location.href="./csj_detail?board_num=${item.board_num}&mem_id=${item.mem_id}' style="cursor: hand" class="searchLi">
				<td id="forumTd">
					<c:out value="${item.mem_id}"/>&nbsp;&nbsp;
					<c:out value="${item.board_date}"/>&nbsp;&nbsp;
					추천수 : <c:out value="${item.board_like}"/><br/>
					<c:out value="${item.board_subject }"/><br/>
					<c:out value="${item.board_cont}"/>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
</body>
<script>
/*
function ForumBoardList(list) {
	var content = '';
	
	for (var i = 0; i < list.length; i++) {
		var date = new Date(list[i].board_date);
			content += '<li onclick=location.href="./csj_detail?board_num='+list[i].board_num+'&mem_id='+list[i].mem_id+'" style="cursor:hand">';
			content += '<dl class="listData">'+'<dd>'+'<span class="screenOut">'+list[i].mem_id+'&nbsp;&nbsp;&nbsp;&nbsp;'+date.getFullYear()+"-"
		      +("0"+(date.getMonth()+1)).slice(-2)+"-"
		      +("0" + date.getDate()).slice(-2)+" "
		      +("0" + date.getHours()).slice(-2)+":"
		      +("0" + date.getMinutes()).slice(-2)+""
		      +'</span>'+'</dd>'+'</dl>';
			content += '<dl class="boardLike">'+"좋아요 "+'<span>'+'<span class="likeCnt">'+list[i].board_like+'</span>'+'</span>'+' </dl>'+'</div>';
			content += '<strong class="board_title">'+'<span>'+list[i].board_subject+'</span>'+'</strong>';
			content += '<p class="boardSTxt">'+list[i].board_cont+'</p>'+'</div>';
			content += '</a>'+'</li>'+'</br>'+'</br>'+'</br>'+'</br>'+'</br>'+'</br>'+'</br>'+'</br>'+'<hr style="width:1000px; border:1px solid #ececec">';		
	}
	$('.ForumBoardList').append(content);
}
*/
</script>
</html>