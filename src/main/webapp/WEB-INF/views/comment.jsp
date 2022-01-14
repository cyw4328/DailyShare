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
		height: 60px;
		resize: none;
	}
	
	.com_content_text{
		width: 500px;
	}
	
	
	.csj_com_list{
		width :500px;
		height: 150px;
		border: 1px solid black;
	}
	
	
	
	
 	.csj_reply_box{
		display: none;
	}
	.com_fix_content{
		width: 500px;
		height: 40px;
		border: 1px solid black;
		
	}
	.com_fix_font{
		font-size: 14px;
		margin :0 auto;
	}
	.com_fix{
		cursor: pointer;
	}
	

	</style>
</head>
<body>
	<div>
		<span>${loginId}</span>
		<form id="csj_com_form" action="csj_com_regist" method="post">
			<input type="hidden" name="com_targetId" value="게시물작성자" />
			<input type="hidden" name="board_num" value="1" />
			<input type="hidden" name="com_parent" value="0" />
			<textarea id="csj_com_content" name="com_cont" placeholder="댓글을 입력하세요"></textarea>
			<input type="button" id="csj_com_button" value="등록" />
		</form>	
	</div>
	<c:forEach items="${comList}" var="comList">
			<table>
				<tr>
					<td>
						<c:if test="${comList.com_depth eq 0}">
							<div class="csj_com_list" style="margin-left:0px;">
								<span>${comList.mem_id}</span>
								<input type="hidden" value="${comList.com_num}"/>
								<span id="csj_com_a">
									<c:if test="${loginId eq comList.mem_id}">
										<span class="com_fix">수정</span>&nbsp;
										<a href="./csj_com_del?com_num=${comList.com_num}">삭제</a>&nbsp;
									</c:if>
									<c:if test="${loginId ne comList.mem_id}">
										<a href="#">신고</a>&nbsp;
									</c:if>
									<fmt:formatDate value="${comList.com_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</span>
								<div>
									<span style="color:blue;">${comList.com_targetId}&nbsp;</span>
									<span>${comList.com_cont}&nbsp;<input class="reply_create" type="button" value="답글"/></span>
								</div>
							</div>						
						</c:if>
						<c:if test="${comList.com_depth eq 1}">
							<div class="csj_com_list" style="margin-left:100px;">
								<span>${comList.mem_id}</span>
								<input type="hidden" value="${comList.com_num}"/>
								<span id="csj_com_a">
									<c:if test="${loginId eq comList.mem_id}">
										<span class="com_fix">수정</span>&nbsp;
										<a href="./csj_com_del?com_num=${comList.com_num}">삭제</a>&nbsp;
									</c:if>
									<c:if test="${loginId ne comList.mem_id}">
									<a href="#">신고</a>&nbsp;
									</c:if>
									<fmt:formatDate value="${comList.com_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</span>
								<div>
									<span style="color:blue;">@${comList.com_targetId}&nbsp;</span>
									<span>${comList.com_cont}&nbsp;<input class="reply_create" type="button" value="답글"/></span>
								</div>
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
								<textarea id="csj_reply_content" name="com_cont" placeholder="@${comList.mem_id}&nbsp;댓글을 입력하세요"></textarea>
								<input class="csj_reply_submit" type="button"  value="등록" />
								<input class="reply_close" type="button"  value="취소" />	
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
		console.log('답글 submit 작동');
		if ($(this).prev().val() == "") {
			alert("내용을 입력하세요.");
		}else {
			$(this).parent().submit();
		}
	});
	var loginId = '${loginId}'
	/* 댓글 수정 버튼 */
	$('.com_fix').click(function() {
		var $com_num = $(this).parent().prev().val();
		
		$(this).closest($('div')).html(
				'<p class="com_fix_font">'+loginId+'</p>'+
				'<input type="text" class="com_fix_content" value="'+$(this).parent().next().children().last().text()+'"/>'+
				'<input type="button" class="submit" value="확인"/><input type="button" class="cancle" value="취소"/>'
		);
		
		$('.cancle').click(function (){
			location.href="./csj_com"
		});
		
		$('.submit').click(function (){
			var $com_content = $('.com_fix_content').val();
			$.ajax({
				type:'post',
				url:'csj_com_update',
				data:{'com_content':$com_content, 'com_num':$com_num},
				dataType:'JSON',
				success: function(data) {
					if(data.updateResult>0){
						alert('댓글이 수정되었습니다.');
						location.href='./csj_com';	
					}else {
						alert('댓글 수정에 실패했습니다.')
						location.href='./csj_com';	
					}
				},
				error: function(e) {
					console.log(e);
				}
					
				
			});
			
		});
		
	});
	
	
	
	

</script>
</html>