<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
	#csj_com_content{
		width: 500px;
		height: 100px;
		resize: none;
	}
	
	
	#csj_com_list{
		width :500px;
		height: 100px;
		border: 1px solid black;
	}
	/* #csj_com_list{
		position:absolute;
		width :500px;
		height: 100px;
		border: 1px solid black;
	}
	#csj_com_id{
		position: absolute;
		left: 0px;
	}
	#csj_com_a{
		position: absolute;
		right:0px;
	}
	#csj_com_cont{
		position:absolute;
		top: 25%;
	} */

	</style>
</head>
<body>
	<div>
		<form id="csj_com_form" action="csj_com_regist" method="post">
			<input type="hidden" name="board_num" value="1" />
			<textarea id="csj_com_content" name="com_cont" placeholder="댓글을 입력하세요"></textarea>
			<input type="button" id="csj_com_button" value="등록" />
			<input type="checkbox" name="com_secret" value="1"/>&nbsp; 비밀댓글
		</form>	
	</div>
	<table>
		<c:forEach items="${comList}" var="comList">
			<tr>
				<td>
					<form id="csj_reply_form" action="csj_reply_list" method="post">
						<input type="text" value="${comList.com_num}" name="com_num"/>
					</form>
				</td>
				<td>
					<div id="csj_com_list">
						<span id="csj_com_id">${comList.mem_id}</span>
						<span id="csj_com_a">
							<a href="#">수정</a>&nbsp;
							<a href="#">삭제</a>&nbsp;
							<a href="#">신고</a>&nbsp;
							<span><fmt:formatDate value="${comList.com_date}" pattern="yyyy-MM-dd HH:mm:ss"/></span>&nbsp;
						</span>
						<div id="csj_com_cont"><p>${comList.com_cont}</p></div>
					</div>
					<input type="button" value="답글"/>
				</td>
			</tr>
		</c:forEach>
	</table>



</body>
<script>
	$('#csj_com_button').click(function(){
		if ($('#csj_com_content').val() == "") {
			alert("내용을 입력하세요.");
		}else {
			$('#csj_com_form').submit();
		}
	});

</script>
</html>