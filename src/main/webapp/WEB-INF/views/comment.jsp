<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
 	#csj_com_content, #csj_reply_content{
		width: 500px;
		height: 100px;
		resize: none;
	}
	
	
	.csj_com_list{
		width :500px;
		height: 100px;
		border: 1px solid black;
	}
	
	
	
	
 	.csj_reply_box{
		display: none;
	}
	
	

	</style>
</head>
<body>
	<div>
		<form id="csj_com_form" action="csj_com_regist" method="post">
			<input type="hidden" name="com_targetId" value="게시물작성자" />
			<input type="hidden" name="board_num" value="1" />
			<input type="hidden" name="com_parent" value="0" />
			<textarea id="csj_com_content" name="com_cont" placeholder="댓글을 입력하세요"></textarea>
			<input type="button" id="csj_com_button" value="등록" />
			<input type="checkbox" name="com_secret" value="1"/>&nbsp; 비밀댓글
		</form>	
	</div>
	<c:forEach items="${comList}" var="comList">
			<table>
				<tr>
					<td>
						<c:if test="${comList.com_depth eq 0}">
							<div class="csj_com_list" style="margin-left:0px;">
								${comList.mem_id}
								<span id="csj_com_a">
									<a href="#">수정</a>&nbsp;
									<a href="#">삭제</a>&nbsp;
									<a href="#">신고</a>&nbsp;
									<fmt:formatDate value="${comList.com_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</span>
								<p><span>${comList.com_targetId}</span>${comList.com_cont}</p>
								<input class="reply_create" type="button" value="답글"/>
							</div>						
						</c:if>
						<c:if test="${comList.com_depth eq 1}">
							<div class="csj_com_list" style="margin-left:100px;">
								${comList.mem_id}
								<span id="csj_com_a">
									<a href="#">수정</a>&nbsp;
									<a href="#">삭제</a>&nbsp;
									<a href="#">신고</a>&nbsp;
									<fmt:formatDate value="${comList.com_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</span>
								<p>${comList.com_cont}</p>
								<input class="reply_create" type="button" value="답글"/>
							</div>						
						</c:if>
					</td>
				</tr>
				
				<tr class="csj_reply_box" >
					<td>
						<div>
							<form  action="csj_com_regist" method="post">
								<input type="hidden" name="com_targetId" value="${comList.mem_id}" />
								<input type="hidden" name="board_num" value="1" />
								<input type="hidden" name="com_parent" value="${comList.com_num}" />
								<textarea id="csj_reply_content" name="com_cont" placeholder="@${comList.mem_id} 댓글을 입력하세요"></textarea>
								<input class="csj_reply_submit" type="button"  value="등록" />
								<input class="reply_close" type="button"  value="취소" />	
								<input type="checkbox" name="com_secret" value="1"/>&nbsp; 비밀댓글
							</form>
						</div>
					<td/>
				</tr>
			</table>
	</c:forEach>


</body>
<script>

	/* 댓글 submit 버튼 */
	$('#csj_com_button').click(function(){
		if ($('#csj_com_content').val() == "") {
			alert("내용을 입력하세요.");
		}else {
			$('#csj_com_form').submit();
		}
	});
	
	/* 답글 입력창 보여주기 */
	$('.reply_create').click(function name() {
		$(this).closest('tr').next().toggle();
	});
	
	/* 답글 입력창 가리기 */
	$('.reply_close').click(function name() {
		$(this).closest('tr').hide();
	});
	
	/* 답글 submit 버튼 */
	$('.csj_reply_submit').click(function() {
		console.log("답글 submit 작동");
		if ($(this).prev().val() == "") {
			alert("내용을 입력하세요.");
		}else {
			$(this).parent().submit();
		}
	});
	

</script>
</html>