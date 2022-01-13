<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <link rel="stylesheet" href="resources/common.css">
    <style>
    	#midCateName{
    		width: 50%;
    	};
    	#mainCateName{
    		width: 50%;
    	};
    </style>
</head>
<body>
	<form action="bigCategoryAdd" id="mainCategoryAdd" method="POST">
		<table>
			<tr>
				<td colspan="2">
					대분류 추가 <br/>
					<input type="text" name="mainCategoryAdd" id="mainCateName">
				</td>
			</tr>	
			<tr>
				<td colspan="2">
					<input type="radio" name="mainAdmin" value="1">관리사용자용
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="mainAdmin" value="0">일반사용자용
				
					<input type="button" id="bigCategoryAdd" value="등록">
				</td>
			</tr>
		</table>
	</form>
	<table>
		<c:forEach var="item" items="${bigCategoryList}">
			<tr>
					<td>${item.main_name}</td>
					<td><a href="bigCategoryDel?bigCategory=${item.main_num}"><button>삭제</button></a></td>
			</tr>
		</c:forEach>
	</table>
	<br/>
	
	<form action="middleCategoryAdd"  id="middleCategorya" method="POST">
		<table>
			<tr>
				<td colspan="2">
					중분류 추가<br/>
					<input type="text" name="middleCategoryAdd" id="midCateName">
 					<select id="bigSelec" name="daeCategory">
 						<option selected="selected">대분류이름</option>
						<c:forEach var="item" items="${bigCategoryList}">
							<option value="${item.main_num}">${item.main_name}</option>
						</c:forEach>
					</select><br/>
					<input type="radio" name="middle_admin" value="1">관리사용자용
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="middle_admin" value="0">일반사용자용
				
					<input type="button" id="middleCategoryAdd" value="등록">
				</td>
			</tr>
		</table>
	</form>
	
		<table>
			<c:forEach var="item1" items="${midCategoyrList}">
				<tr>
						<td><b>${item1.main_num}</b>${item1.mid_name}</td>
						<td><a href="midCategoryDel?midCategory=${item1.mid_num}"><button>삭제</button></a></td>
				</tr>
			</c:forEach>
		</table>
		<br/>
		
		<form action="menuAdd" method="POST">
			<table>
				<tr>
					<td colspan="4">메뉴추가</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="menuAdd"/>
					</td>
					<td>
						<select id="bigSelec" name="daeCategory">
			 						<option selected="selected">대분류이름</option>
									<c:forEach var="item" items="${bigCategoryList}">
										<option value="${item.main_num}">${item.main_name}</option>
									</c:forEach>
						</select>
					</td>
					<td>
						<select id="midSelec" name="midCategory">
	 						<option selected="selected">중분류이름</option>
							<c:forEach var="item" items="${midCategoyrList}">
								<option value="${item.mid_num}">${item.mid_name}</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<input type="submit" value="추가" id="menuAdd"/>
					</td>
				</tr>
			</table>
			</form>
			<table>
			<c:forEach var="item2" items="${menuList}">
				<tr>
						<td>${item2.menu_name}</td>
						<td><a href="menuDel?menu=${item2.menu_num}"><button>삭제</button></a></td>
				</tr>
			</c:forEach>
		</table>
		
		
		
</body>
<script>
	

	$("#bigCategoryAdd").click(function() {
		console.log("추가 버튼 클릭");
		
		var $mainCategoryAdd = $('input[name="mainCategoryAdd"]');
		var $mainAdmin = $('input[name="mainAdmin"]:checked');
		
		if ($mainCategoryAdd.val() == '') {
			alert('대분류이름을 입력해주세요.');
			$mainCategoryAdd.focus();
		}else if ($mainAdmin.val() == null) {
			alert('사용범위를 선택해 주세요.');
		}else {
			$('#mainCategoryAdd').submit();
		}
	
	});
	
	$("#middleCategoryAdd").click(function() {
		console.log("추가 버튼 클릭");
		
		var $middleCategoryAdd = $('input[name="middleCategoryAdd"]');
		var $daeCategory = $('select[name=daeCategory]');
		var $middle_admin = $('input[name="middle_admin"]:checked');
		
		if ($middleCategoryAdd.val() == '') {
			alert('중분류이름을 입력해주세요.');
			$middleCategoryAdd.focus();
		}else if ($daeCategory.val()== "대분류이름") {
			alert('중분류가 들어갈 대분류를 정해주세요.');
		} else if ($middle_admin.val() == null) {
			alert('사용범위를 선택해 주세요.');
		}else {
			$('#middleCategorya').submit();
		}
	
	});
	


</script>
</html>