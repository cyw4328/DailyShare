<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
	<link rel="stylesheet" href="resources/css/common.css" type="text/css">
	<script src="resources/js/jquery.twbsPagination.js"></script>
    <style  type="text/css">
    	
    	/*드래그 금지*/
         .no-drag {-ms-user-select: none; -moz-user-select: -moz-none; -webkit-user-select: none; -khtml-user-select: none; user-select:none;} 
    	
    	#tab2{
    		font-weight: bold;
    		color: orange;
    	}

   		table, th, td{
			border : 1px solid black;
			border-collapse : collapse;
			padding : 8px;
			text-align: center;
	
		}
		
		table{
			width: 900px;
		}
		
		#dec{
		    position :absolute;
		    left: 800px;
		   	top: 120px;
            font-size: 16px;
		}
		
		#decS{
		   	position: absolute;
		   	left: 840px;
		   	top: 200px;
	    }
	    
	    #decM{
		   	position: absolute;
		   	left: 600px;
		   	top: 200px;
	    }
		
		#DecTable3{
		    position: absolute;
		   	left: 300px;
		   	top: 240px;
		}
		
		#decMEnr{
	    	width:60px;
		    height:40px; 
		    font-size:16px; 
		    border-radius: 5px / 5px;
		    background:black;
		    color: white; 
		    cursor:pointer;
		}
    </style>
</head>
<body class="no-drag">
	<%@ include file="headerShs_login.jsp"%>
	<%@ include file="AdminMyPageShs.jsp"%>
	
	<div id="dec">
        <a target="_blank" id="a1" style="color: black; cursor:pointer;">접수된신고</a>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <a target="_blank" id="a2" style="color: black; cursor:pointer;">처리된신고</a>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <a target="_blank" id="a3" style="color: black; cursor:pointer;">항목관리</a>
	</div>
		<div id="decM">
		<form action="enr_decM" method="POST">
			<input type="text" placeholder="새로 등록할 항목" name="decMkeyword" style="width : 300px; font-size:16px; height:30px;  border-radius: 5px / 5px;">
			<input type="submit" id="decMEnr" value="등록">
        </form>
	</div>
		<div id="DecTable3">
			<table style='width:850px;'>
				<tr>
					<th style='width:15%'>코드</th>
					<th style='width:50%'>신고항목</th>
					<th style='width:15%'>사용여부</th>
					<th style='width:20%'></th>
				</tr>
				<c:if test="${declist3 eq null || decsize3 == 0}">
					<tr><td colspan="4">등록된 항목이 없습니다.</td></tr>
				</c:if>
				<c:forEach items="${declist3}" var="board">
					<tr>
						<td>${board.dec_code}</td>
						<td>
							<div id="decsave"  style="display:block;">${board.dec_name}</div>
							<div id="decupdate" style="display:none;">
								<form  action="decupdate" method="POST">
								<input type="text" name="user_name" id="name" value="${board.dec_name}"/>
								<input type="button" id="save" value="확인"/>
								</form>
							</div>
						</td>
						<td>${board.dec_blind}</td>
						<td>
							<input type="button" id="update" value="수정"/>
							<input type="button" id="use" value="미사용"/>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
</body>
<script>
	$('#use').click(function() {
	
	});
	
	$("[id^=update]").on('click', function(){
		$(this).css.style."background:gray";
		console.log($(this).parent().prev().prev().find('div').first());
		$(this).parent().prev().prev().find('div').first().toggle();
		$(this).parent().prev().prev().find('div').last().toggle();

	});
	
	const headTxt = document.getElementById('headTxt');
	headTxt.innerText = '신고목록'
	
	$("#tab1").click(function() {
		location.href='./managerPage'
	});
	
	var ahr = document.getElementsByTagName('a');
	document.getElementById("a3").style = "color: black; box-shadow: inset 0 -6px 0 gray; cursor:pointer;";
	
	$('#a1').click(function(){
		location.href='./decPage'
	});
	
	$('#a2').click(function(){
		location.href='./decPage2'
	});
</script>
</html>