<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <style>
    
       	   #con_gooDock{width: 1200px;}
   #gooDock{
      position: relative;
      top :100px;
      right:0px;
      float:right;
      width:900px;   
   }
   
   #menu{
   	width: 700px;
   	height: 600px;
   	position: absolute;
   	top: 200px;
   	left: 300px;
   }
   	#title{
		position: absolute;
		top: 82px;
		left: 300px;
	}
    
    </style>
</head>
<body>
	<%@ include file="headerShs_login.jsp"%>
	<%@ include file="MyPageShs.jsp"%>
	
	<div id="title">
		<h2>블로그 메뉴 수정</h2>
	</div>

	<div id="menu">
		<form action="menuAdd" method="POST" id="menuAdd">
			<table>
				<tr>
					<td colspan="4">메뉴추가</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="menuAddName" id="menuName"/>
					</td>
					<td>
						<select id="bigSelec" name="daeCategoryMenu">
	 						<option selected="selected">대분류이름</option>
							<c:forEach var="item" items="${bigCategoryList}">
								<option value="${item.main_num}">${item.main_name}</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<select id="midSelec" name="midCategoryMenu">
	 						<option selected="selected">중분류이름</option>
							<c:forEach var="item" items="${midCategoyrList}">
								<option value="${item.mid_num}">${item.mid_name}</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<input type="button" value="등록" id="menuAddCheck"/>
					</td>
				</tr>
			</table>
			</form>
			<table>
			
			<c:forEach var="item2" items="${menuList}">
				<tr>
						<td>${item2.menu_name}</td>				
						<td>
							<button class="menuDel">삭제</button>
							<input type="hidden" value="${item2.menu_num}">
						</td>
				</tr>
			</c:forEach>
		</table><br/>
	</div>



</body>
<script>

$("#menuAddCheck").click(function() {
	console.log("추가 버튼 클릭");
	
	var $menuAdd = $('input[name="menuAddName"]');
	var $daeCategory = $('select[name=daeCategoryMenu]');
	var $midCategory = $('select[name=midCategoryMenu]');
	
	if ($menuAdd.val() == '') {
		alert('메뉴이름을 입력해주세요.');
		$menuAdd.focus();
	}else if ($daeCategory.val() == "대분류이름") {
		console.log($daeCategory.val());
		alert('메뉴가 들어갈 대분류를 정해주세요.');
	} else if ($midCategory.val() == "중분류이름") {
		alert('메뉴가 들어갈 중분류를 정해주세요.');
	}else {
		$('#menuAdd').submit();
	}
});


$('.menuDel').click(function() {
	console.log("버튼작동");
	console.log($(this).next().val());
	
	var menu_num = $(this).next().val();
	$.ajax({
		type:'POST',
		url:'menuDel',
		data:{"menu_num" : menu_num},
		dataType:'JSON',
		success:function(data) {
			console.log(data.row);
			if (data.row >0) {
				alert('[삭제불가]하위메뉴가 존재합니다.');
			}else {
				alert('삭제가 완료되었습니다.');
				window.location.href="./menuAddPage";
			}
		},
		error:function(e) {
			console.log(e);
		}
	});
});

</script>
</html>