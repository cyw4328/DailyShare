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
    	.boardList{
    		white-space: nowrap;
	        overflow: hidden;
	        text-overflow: ellipsis;
	        text-align: center;
    	}
    	a:link { color: black; text-decoration: none;}
 		a:visited { color: black; text-decoration: none;}
 		a:hover { color: blue; text-decoration: underline;}
 		

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
					<td>
						<button class="bigCategoryDel">삭제</button>
						<input type="hidden" value="${item.main_num}"/>
					</td>
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
					<td>${item1.mid_name}</td>
					<td>
						<button class="midCategoryDel">삭제</button>
						<input type="hidden" value="${item1.mid_num}">
					</td>
				</tr>
			</c:forEach>
		</table>
		<br/>
		
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
		
		<table>
			<thead>
				<tr>
					<td>
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
		<table>
			<tr>
				<c:forEach var="item" items="${bigCategoryList }">
					<td>
						<button class="middleListCall">${item.main_name}</button>
						<input type="hidden" value="${item.main_num}">
					</td>
				</c:forEach>
			</tr>
		</table>
		<table>
			<thead></thead>
			<tbody class="boardList"></tbody>
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
		
		$('.menuDel').click(function() {
			console.log("버튼작동");
			console.log($(this).next().val());
			
			var menu_num = $(this).next().val();
			$.ajax({
				type:'GET',
				url:'menuDel',
				data:{"menu_num" : menu_num},
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
		
		function middleListCallAdd(list) {
			var content = '';
			
			
			
			for (var i = 0; i < list.length; i++) {
				
				var date = new Date(list[i].board_date);
				
				//console.log(list[i]);
				content += '<a href="./boardDetail?board_num='+list[i].board_num+'">'+'<tr>' ;
				content += '<td>'+list[i].mid_name+'<br/>'
				+"작성일 : "+date.getFullYear()+"-"
			      +("0"+(date.getMonth()+1)).slice(-2)+"-"
			      +("0" + date.getDate()).slice(-2)+" "
			      +("0" + date.getHours()).slice(-2)+":"
			      +("0" + date.getMinutes()).slice(-2)+":"
			      +("0" + date.getSeconds()).slice(-2)+
				'<br/>'+"공감수 : "+list[i].board_like+'</td>'+'<br/>';
				content += '<td>'+"제목 : "+list[i].board_subject+'<br/>'+"내용 : "+list[i].board_cont+'<br/>'+"작성자 : "+list[i].mem_id+'</td>';
				content += '</tr>'+'</a>'+'<button onclick="boardSingo('+list[i].board_num+')">'+"신고하기"+'</button>'+'<hr/>';
				
	
			}
			$('.boardList').empty();
			$('.boardList').append(content);
		};
		
		$('.boardList').mouseover(function() {
			$(this).css('cursor','pointer');
		});

		
function boardSingo(e) {
	console.log(e);
	var loginId <%session.getAttribute("loginId");%>
	if (loginId != null) {
		
		var yn = confirm("정말 이글을 신고 하시겠습니까?");
		
		if (yn) {
			
			$.ajax({
				type:'POST',
				url:'boardSingo',
				data:{"board_num":e}, // {}안에 아무것도 안넣으면 다보여줘라 라는 뜻
				dataType:'JSON',
				success:function(data) {
					console.log(data.list);
					/* window.location.href="./MyReviewControlPage"; */
					
				},
				error:function(e) {
					console.log(e);
				}
			});
		}
	}else{
		alert("로그인이 필요한 서비스입니다.");
	}
	
	
}	

		
		
</script>
</html>