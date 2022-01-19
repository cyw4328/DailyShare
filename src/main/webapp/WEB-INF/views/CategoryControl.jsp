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
   
   	#title{
		position: absolute;
		top: 82px;
		left: 300px;
	}
       #sival{
   	width: 700px;
   	height: 600px;
   	position: absolute;
   	top: 200px;
   	left: 300px;
   }
   #BigCateGoryList{
   	position: absolute;
   	left: 300px;
   	top: 175px;
   }
   #middleCategoryList{
   position: absolute;
   left: 805px;
   top: 174px;
   }
   #bigMiddleSearch{
   position: absolute;
   left: 300px;
   top: 500px;
   }

   
    </style>
</head>
<body>
	<%@ include file="headerShs_login.jsp"%>
	<%@ include file="AdminMyPageShs.jsp"%>
	
	<div id="title">
		<h2>카데고리 관리</h2>
	</div>
	
	<div id="BigCateGoryList">
		<form action="bigCategoryAdd" id="mainCategoryAdd" method="POST">
		<table>
			<tr>
				<td colspan="2">
					<h3>대분류 추가</h3><br/>
					<input type="text" name="mainCategoryAdd" id="mainCateName">
					<br/>
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
					<td>
						<button class="bigCategoryDel">삭제</button>
						<input type="hidden" value="${item.main_num}"/>
					</td>
			</tr>
		</c:forEach>
	</table>
	<br/>
	</div>
	
	<div id="middleCategoryList">
	<form action="middleCategoryAdd"  id="middleCategorya" method="POST">
		<table>
			<tr>
				<td colspan="2">
					<h3>중분류 추가</h3><br/>
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
					<td>${item1.mid_name}</td>
					<td>
						<button class="midCategoryDel">삭제</button>
						<input type="hidden" value="${item1.mid_num}">
					</td>
				</tr>
			</c:forEach>
		</table>
		</div>
		
		<div id="bigMiddleSearch">
		<table>
			<thead>
				<tr>
					<td>
					<h3>대분류별 중분류 리스트</h3>
						<select id="bigSel" name="daeCategory" onchange="midCategoryCall()">
	 						<option selected="selected">대분류이름</option>
							<c:forEach var="item" items="${bigCategoryList}">
								<option value="${item.main_num}">${item.main_name}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
			</thead>
			<tbody class="midlist">
			</tbody>
		</table>
		<br/>
		</div>
		
	
	

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


$('.bigCategoryDel').click(function() {
	console.log("버튼작동");
	console.log($(this).next().val());
	
	var main_num = $(this).next().val();
	$.ajax({
		type:'GET',
		url:'bigCategoryDel',
		data:{"main_num" : main_num},
		dataType:'JSON',
		success:function(data) {
			console.log(data.row);
			if (data.row >0) {
				alert('[삭제불가]하위메뉴가 존재합니다.');
			}else {
				alert('삭제가 완료되었습니다.');
				window.location.href="./cyw";
			}
		},
		error:function(e) {
			console.log(e);
		}
	});
});
	
	$('.midCategoryDel').click(function() {
		console.log("버튼작동");
		console.log($(this).next().val());
		
		var mid_num = $(this).next().val();
		$.ajax({
			type:'GET',
			url:'midCategoryDel',
			data:{"mid_num" : mid_num},
			dataType:'JSON',
			success:function(data) {
				console.log(data.row);
				if (data.row >0) {
					alert('[삭제불가]하위메뉴가 존재합니다.');
				}else {
					alert('삭제가 완료되었습니다.');
					window.location.href="./cyw";
				}
			},
			error:function(e) {
				console.log(e);
			}
		});
	});
	
	// 대분류 선택시 중분류 리스트나열
	function midCategoryCall() {

		var selectValue = $("#bigSel option:selected").val();
		console.log(selectValue);
		
		$.ajax({
			type:'GET',
			url:'midCategoryCall',
			data:{"selectValue":selectValue},
			dataType:'JSON',
			success:function(data) {
				//console.log(data.list);				
				listDraw(data.list);	
				
			},
			error:function(e) {
				console.log(e);
			}
		});
	}

	function listDraw(list) {
		var content = '';
		
		for (var i = 0; i < list.length; i++) {
			//console.log(list[i]);
			content += '<tr>';
			content += '<td>'+list[i].mid_name+'</td>';
			content += '</tr>';
		}
		$('.midlist').empty();
		$('.midlist').append(content);
	}
	
	// 대분류 버튼 클릭시 해당하는 리스트 뽑아오기 (조인)
	$('.middleListCall').click(function() {
		var middleListCall = $(this).next().val();
		console.log(middleListCall);
		
		$.ajax({
			type:'GET',
			url:'middleListCall',
			data:{"middleListCall" : middleListCall},
			dataType:'JSON',
			success:function(data) {
				/*	console.log(data.list);
				console.log(data.list[1].board_subject);
				console.log(data.list[1].board_cont); */
				if (data.list != []) {
					middleListCallAdd(data.list);					
				}
				
			},
			error:function(e) {
				console.log(e);
			}
		});
		
	})
	




</script>
</html>