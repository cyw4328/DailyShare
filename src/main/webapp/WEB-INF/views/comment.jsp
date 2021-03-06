<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>Daily Share</title>
	<!-- <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script> -->
	<style>

	#comment_wrap{
		position: relative;
		width: 100%;
		/* border: 1px solid blue; */
		/* border-bottom: 2px solid gray; */
	}
	#loginId{
		position: relative;
		left: 0;
		margin-top: 20px;
		margin-bottom:10px;
		display: inline-block;
		
	}
	#input_wrap{
		/* border: 1px solid red; */
		position:absolute;
		text-align: center;
		height:130px;
		margin: 0 auto;
		left: 0;
	}
	
	table{
		width: 750px;
		margin:0 auto;
		/* border: 1px solid black; */
	}
	
	
	#comList_wrap{
		position:relative;
		border-top: 2px solid gray;
		text-align: center;
		top:130px;
	}
	
	
	#csj_com_form{
		margin: 0 auto;
	}
	
	#csj_com_button{
		position: absolute;
		width: 55px;
		height: 35px;
		top: 18%;
		right: -12%;
		border:1px solid gray;
		border-radius:5px;
		background-color: #ffffff;
		font-weight: 600;
		cursor: pointer;

	}
 	#csj_com_content{
 		margin:0 auto;
		width: 800px;
		height: 80px;
		resize: none;
		border-radius: 5px;
	}
	
	
	.com_content_text{
		width: 600px;
	}
	
	
	.csj_com_list{

		border-radius:5px;
		position : relative;
		height: 150px;
		left: 0px;
		width:900px;
		
	}
	.csj_com_mem_id{
		position: absolute;
		left: 25px;
		top:15px;
		font-size: 16px;
		font-weight: 600;
		color: #555555;
	}
	.csj_com_a{
		position: absolute;
		right: 50px;
		top: 15px;
		font-size: 14px;
	}
	.csj_com_content{
		/* background-color:#FAFAFA; */
		position: absolute;
		top: 45px;
		left:10px;
		height:90px;
		/* max-width:400px; */
		font-size: 17px;
		overflow: hidden;
		/* background-color: lightgray; */
		/* border: 1px solid gray; */
		/* border-top: 2px solid gray; */
		/* border-bottom: 2px solid gray; */

	}
	
	hr{
		width:900px;
		
		border: 1px solid #ececec;
		background-color: gray;
	}
	
	.reply_create{
		position:absolute;
		right:50px;
		top:109px;
		border: 0;
		background-color: #ffffff;
		padding: 0px;
		font-size: 16px;
		font-weight: 600;
		color: #3c3c3c;
		cursor: pointer;
		text-decoration: underline;
	}


 	.csj_reply_box{
		display: none;
	}




	.com_fix_font{
		position:absolute;
		font-size: 15px;
		font-weight:600;
		right: 465px;
		top: 10px;
	}
	.com_fix_content{
		position:absolute;
		width: 800px;
		height: 100px;
		right: 100px;
		top:35px;
		
		font-size:17px;
		border-right : 4px solid lightgray;
		border-bottom : 4px solid lightgray;
		border-left : 2px solid lightgray;
		border-top : 2px solid lightgray;
		border-radius:5px;
		
	}
	.com_fix{
		cursor: pointer;
	}
	
	.csj_reply_wrap{
		position: relative;
		height: 120px;
		border-bottom: 2px solid #ececec;
	}
	.csj_reply_content{
		position: absolute;
		margin:0 auto;
		width: 490px;
		height: 100px;
		resize: none;
		border-radius: 5px;
		right: 125px;
		
		border-right : 4px solid lightgray;
		border-bottom : 4px solid lightgray;
		border-left : 2px solid lightgray;
		border-top : 2px solid lightgray;
		border-radius:5px;
	}
	
	.csj_reply_submit{
		position: absolute;
		width: 55px;
		height: 35px;
		top: 28%;
		right: 50px;
		border:1px solid gray;
		border-radius:5px;
		background-color: #ffffff;
		font-weight: 600;
	}
	.reply_close{
		position: absolute;
		padding:0;
		margin:0;
		top: -5%;
		right: 50px;
		border:0;
		border-radius:5px;
		background-color: #ffffff;
		font-weight: 600;
		color: gray;
		font-size: 20px;
		font-weight: 600;
		cursor: pointer;
	}
	
	.submit{
		position: absolute;
		width: 55px;
		height: 35px;
		top: 37%;
		right: 25px;
		border:1px solid gray;
		border-radius:5px;
		background-color: #ffffff;
		font-weight: 600;
		cursor: pointer;
	}
	.cancle{
		position: absolute;
		padding:0;
		margin:0;
		top: 5%;
		right: 10px;
		border:0;
		border-radius:5px;
		background-color: #ffffff;
		font-weight: 600;
		color: gray;
		font-size: 20px;
		font-weight: 600;
		cursor: pointer;
	}
	.fix_wrap{
		position: relative;
		width: 100%;
		height: 100%;
		background-color: white;
	}
	
	#rereple{
	background-color:#fafafa;
	}

	</style>
</head>
<body>

	<div id="comment_wrap">
		<span id="loginId">${loginId}</span>
		<div id="input_wrap">
			<form id="csj_com_form" action="csj_com_regist" method="post">
				<input type="hidden" name="mem_id" value="${loginId}" />
				<input type="hidden" name="com_targetId" value="${boardDetail.mem_id }" />
				<input type="hidden" name="board_num" value="${boardDetail.board_num}" />
				<input type="hidden" name="com_parent" value="0" />
				<input type="hidden" name="com_boardId" value="${boardDetail.mem_id }" />
				<textarea id="csj_com_content" name="com_cont" placeholder="????????? ???????????????"></textarea>
				<input type="button" id="csj_com_button" value="??????" />
			</form>	
		</div>
		
		<div id="comList_wrap">
			<c:forEach items="${comList}" var="comList">
					<table>
						<tr>
							<td>
								<c:if test="${comList.com_depth eq 0}">
									<div class="csj_com_list">
										<span class="csj_com_mem_id" style="top:22px;">
											<a href="./csj_blogMain?mem	_id=${comList.mem_id }">${comList.mem_id}</a>
										</span>
										
										<input type="hidden" value="${comList.com_num}"/>
										<span class="csj_com_a">
											<c:if test="${loginId eq comList.mem_id}">
												<span class="com_fix">??????</span>&nbsp;
												<a class="com_del" href="./csj_com_del?com_num=${comList.com_num}&board_num=${boardDetail.board_num}&mem_id=${boardDetail.mem_id}">??????</a>&nbsp;
											</c:if>
											<c:if test="${loginId ne comList.mem_id}">
												<a href="#" onclick="singoPop()">??????</a>&nbsp;
											</c:if>
											<fmt:formatDate value="${comList.com_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
										</span>
										
										<div class="csj_com_content" style="width:800px; left: 20px;">
											<span style="color:#b9b9b9;">@${comList.com_targetId}&nbsp;</span>
											<span>${comList.com_cont}&nbsp;
											</span>
										</div>
										<c:if test="${loginId ne comList.mem_id}">
											<input class="reply_create" type="button" value="??????" />
										</c:if>
									</div>						
								</c:if>
								<c:if test="${comList.com_depth eq 1}">
									<div class="csj_com_list" style=" width: 900px" id="rereple">
										<span class="csj_com_mem_id" style="left:50px; top:22">
											<a href="./csj_blogMain?mem_id=${comList.mem_id }">??? ${comList.mem_id}</a>
										</span>
										<input type="hidden" value="${comList.com_num}"/>
										<span class="csj_com_a">
											<c:if test="${loginId eq comList.mem_id}">
												<span class="com_fix">??????</span>&nbsp;
												<a class="com_del" href="./csj_com_del?com_num=${comList.com_num}&board_num=${boardDetail.board_num}&mem_id=${boardDetail.mem_id}">??????</a>&nbsp;
											</c:if>
											<c:if test="${loginId ne comList.mem_id}">
											<a href="#"onclick=" singoPop()">??????</a>&nbsp;
											</c:if>
											<fmt:formatDate value="${comList.com_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
										</span>
										<div class="csj_com_content" style="width:750px; left: 50px;">
											<span style="color:blue; color:#b9b9b9;">@${comList.com_targetId}&nbsp;</span>
											<span>${comList.com_cont}&nbsp;
											</span>
										</div>
										<c:if test="${loginId ne comList.mem_id}">
											<input class="reply_create" type="button" value="??????"/>
										</c:if>
									</div>						
								</c:if>
							<hr style="margin:0;padding: 0px;">	
							</td>
						</tr>
						
						<tr class="csj_reply_box" >
							<td>
								<div class="csj_reply_wrap">
									<form  action="csj_com_regist" method="post">
										<input type="hidden" name="mem_id" value="${loginId}" />
										<input type="hidden" name="com_targetId" value="${comList.mem_id}" />
										<input type="hidden" name="board_num" value="${boardDetail.board_num}" />
										<input type="hidden" name="com_parent" value="${comList.com_parent}" />
										<input type="hidden" name="com_boardId" value="${boardDetail.mem_id }" />
										<textarea class="csj_reply_content" name="com_cont" placeholder="@${comList.mem_id}&nbsp;????????? ???????????????"></textarea>
										<input class="csj_reply_submit" type="button"  value="??????" />
										<input class="reply_close" type="button"  value="X" />	
									</form>
								</div>
							<td/>
						</tr>
					</table>
			</c:forEach>
		</div>
	</div>


</body>
<script>

function singoPop() {
	$('#SingoPopup').toggle();
	
}


	/* ?????? submit ?????? */
	$('#csj_com_button').click(function(){
	   if ($loginId == '') {
	      alert("???????????? ????????? ???????????????.");
	      location.href='./loginPage'
	   }else if ($('#csj_com_content').val() == "") {
	      alert("????????? ???????????????.");
	      $('#csj_com_content').focus();
	   }else {
	      $('#csj_com_form').submit();
	   }
	});
		
	
	
	
	/* ?????? ????????? ???????????? */
	$('.reply_create').click(function name() {
		$(this).closest('tr').next().toggle();
	});
	
	/* ?????? ????????? ????????? */
	$('.reply_close').click(function name() {
		$(this).closest('tr').hide();
	});
	
	/* ?????? submit ?????? */
   $('.csj_reply_submit').click(function() {

      if ($loginId == '') {
         alert("???????????? ????????? ???????????????.");
         location.href='./loginPage'
      }else if ($(this).prev().val() == "") {
         alert("????????? ???????????????.");
      }else {
         $(this).parent().submit();
      }
   });
	var loginId = '${loginId}';
	var $board_num=${boardDetail.board_num};
	var $mem_id= '${boardDetail.mem_id}';
	/* ?????? ?????? ?????? */
	$('.com_fix').click(function() {
		var $com_num = $(this).parent().prev().val();
		//<div id="multiple_container" contenteditable="true" placeholder="????????? ???????????????" onkeydown="resize(this)" onkeyup="resize(this)"></div>
		$(this).closest($('div')).append(
				'<div class="fix_wrap">'+
				'<span class="com_fix_font">'+loginId+'</span>'+
				'<textarea class="com_fix_content">'+$(this).parent().next().children().last().text()+'</textarea>'+
				//'<input type="text" class="com_fix_content" value="'+$(this).parent().next().children().last().text()+'"/>'+
				'<input type="button" class="submit" value="??????"/><input type="button" class="cancle" value="X"/>'+
				'<div>'
				
		);
		
		$('.cancle').click(function (){
			$(this).parent().remove();
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
						alert('????????? ?????????????????????.');
						location.href="./csj_detail?board_num="+$board_num+"&mem_id="+$mem_id;
					}else {
						alert('?????? ????????? ??????????????????.')
						location.href="./csj_detail?board_num="+$board_num+"&mem_id="+$mem_id;
					}
				},
				error: function(e) {
					console.log(e);
				}
					
				
			});
			
		});
		
	});
	
	
	$('.com_del').click(function () {
		alert('????????? ?????????????????????????');
	});
	
	
	

</script>
</html>