<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <style>
    	#container_wrap{
			position:relative;
			width: 1400px;
			height: 1500px;
			/* border:2px solid red;  */
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
	 		min-height: 700px;
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
		
		.photo{
			text-align: center;
		}

	

    </style>
</head>
<body>
	<div id="container_wrap">
		<%@ include file="csjBlogHead.jsp" %>
		<input type="hidden" name="board_num" value="${boardDetail.board_num }"/>
		<div id="form_wrap">
			<div id="category_wrap">
				<img src="resources/images_csj/backimage.png" onclick="javascript:history.back();">
				<span class="menu">${boardDetail.menu_name}</span>
				<span class="writer">
					<a href="./csj_blogMain?mem_id=${boardDetail.mem_id }">${boardDetail.mem_id }</a> &nbsp;<fmt:formatDate value="${boardDetail.board_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
				</span>
				<input type="hidden" name="board_num" value="${boardDetail.board_views }"/>
			</div>
			
			<div id="sub_wrap">
				<span class="subject">
					${boardDetail.board_subject}				
				</span> 
			</div>
			<div id="multiple_container">
				<c:if test="${not empty photos.size()}">
					<c:forEach items="${photos}" var="photo">
						<p class="photo">
							<img src="/postImageFolder/${photo.photo_newName}" style="max-width:300px;max-height:250px;z-index:none;"/>
						</p>			
					</c:forEach>
				</c:if>
				<p>${boardDetail.board_cont }</p>
				
				<div class="likesTag">
					댓글 수 (<span style="color: gray;font-weight:600">&nbsp;${comList.size()}&nbsp;</span>)&nbsp;&nbsp;
					<c:choose>
						<c:when test="${LikeCheck eq '0' or empty LikeCheck }">
							<input type="button" onclick="like()" value="♡" id ="heart"/>&nbsp;${boardDetail.board_likes}&nbsp;&nbsp;
						</c:when>
						<c:otherwise>
							<input type="button" onclick="like()" value="♥" id ="heart"/>&nbsp;${boardDetail.board_likes}&nbsp;&nbsp;
						</c:otherwise>
					</c:choose>
					<c:if test="${tags.size() gt 0}">
						<c:forEach items="${tags}" var="tag">
							<span>#${tag}&nbsp;</span>						
						</c:forEach>
					</c:if>
				</div>
				
				<div class="buttons">
					<c:if test="${loginId eq boardDetail.mem_id}">
						<a href="./csj_UpdateForm?board_num=${boardDetail.board_num}">수정</a>&nbsp;&nbsp;
						<a href="#" onclick="del();">삭제</a>&nbsp;&nbsp;		
					</c:if>
					<c:if test="${loginId ne boardDetail.mem_id}">
						<a href="#">공유</a>&nbsp;&nbsp;
						<a href="#">신고</a>&nbsp;&nbsp;					
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