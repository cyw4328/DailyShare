<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <link rel="stylesheet" href="resources/common.css">
    <style>
    	#container_wrap{
			position:relative;
			width: 1400px;
			height: 1500px;
			border:2px solid red; 
			margin: 0 auto;
		}
		#form_wrap{
			position:relative;
			width: 900px;
			height: 90%;
			/* border:1px solid black; */
			margin: 0 auto;
		}
		#category_wrap{
			position:relative;
			width: 100%;
			height: 100px;
			/* border:1px solid red; */	
		}
		#category_wrap img{
			position:absolute;
			max-width:40px;
			cursor: pointer; 
			top: 10px;
		}
		.menu{
			color:grey;
			position:absolute;
			/* min-width: 100px; */
			height: 25px;
			border-radius:5px;
			left: 0px;
			bottom: 0px;
			font-size: 15px;
		}
		.writer{
			color:grey;
			position:absolute;
			/* min-width: 100px; */
			height: 25px;
			border-radius:5px;
			right: 0px;
			bottom: 0px;
			font-size: 15px;
		}
		
		
		
		#sub_wrap{
			position:relative;
			height: 70px;
			border-bottom:2px solid gray;
		}
		.subject{
			position:absolute;
			border:none;
			top:15px;
			/* border-bottom:2px solid grey; */
			/* width: 100%; */
			/* height: 70px; */
			font-size: 30px;
		}
		
		
		#multiple_container{
	 		position:relative;
	 		width: 100%;
	 		min-height: 500px;
	 		border-bottom:2px solid gray;
	 	}
	 	.likesTag{
	 		position: absolute;
	 		bottom:0px;
	 		left: 0px;
	 	}
	 	.likesTag span{
	 		color: gray;
	 	}
	 	.buttons{
	 		position: absolute;
	 		bottom:0px;
	 		right: 0px;
	 	}
	 	.buttons a:link { color: gray; text-decoration: none;}
		.buttons a:visited { color: gray; text-decoration: none;}
		.buttons a:hover { color: gray; text-decoration: none;}

	

    </style>
</head>
<body>
	<div id="container_wrap">
		<%@ include file="csjBlogHead.jsp" %>
		<input type="hidden" name="board_num" value="${boardDetail.board_num }"/>
		<div id="form_wrap">
			<div id="category_wrap">
				<img src="resources/images_csj/backimage.png" onclick="javascript:history.back();">
				<span class="menu">게시글 메뉴</span>
				<span class="writer">작성자 ${boardDetail.mem_id } &nbsp;작성 날짜</span>
				<input type="hidden" name="board_num" value="${boardDetail.board_views }"/>
			</div>
			
			<div id="sub_wrap">
				<span class="subject">
					햄스터 ${boardDetail.board_subject}				
				</span> 
			</div>
			<div id="multiple_container">
				<p>이미지 첨부</p>
				<p>${boardDetail.board_cont } 게시글 내용</p>
				
				<div class="likesTag">
					댓글 수 (<span>0</span>)&nbsp;
					<input type="button" onclick="like()" value="♡" id ="heart">
					<span>#태그1&nbsp;</span>
					<span>#태그2&nbsp;</span>
					<span>#태그3&nbsp;</span>
				</div>
				
				<div class="buttons">
					<c:if test="${loginId eq boardDetail.mem_id}">
						<a href="./updateForm?board_num=${boardDetail.board_num}">수정</a>
						<a href="#" onclick="del();">삭제</a>					
					</c:if>
					<c:if test="${loginId ne boardDetail.mem_id}">
						<a href="#">공유</a>
						<a href="#">신고</a>					
					</c:if>					
				</div>
			</div>
			<%@ include file="comment.jsp" %>
			
		
		
		
		</div>
	
	</div>

</body>
<script>

	//추천 기능

	
function like() {
		
 	var board_num = ${boardDetail.board_num}

	console.log("고마워ㅠ");
	console.log(board_num);
		
	$.ajax({
		url: "updateLike",
		type: "GET",
		data: {'board_num':board_num},
		dataType: "JSON",
		success: function (LikeCheck) {
			alert("추천 성공");
			if (LikeCheck == 1) {
				$("#heart").text("♥")
			}else{
				$("#heart").text("♡")
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