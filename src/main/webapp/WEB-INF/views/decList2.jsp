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

		#DecTable2{
		    position: absolute;
		   	left: 300px;
		   	top: 240px;
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
	
	<div id="decS">
		<form action="search_dec" method="GET" name="search_dec">
			<select name="decSearchType" style="height:25px;" id="type">
				<option selected value="all">전체</option>
				<option value="mem_id">신고자아이디</option>
				<option value="target_id">신고된아이디</option>
				<option value="dec_name">신고항목</option>
			</select>
			<input type="text" name="deckeyword">
			<input type="button" id="decSearch" onclick="decSearchList()" value="검색">
        </form>
		</div>
		<div id="DecTable2">
			<table>
				<tr>
					<th>신고번호</th>
					<th>신고자아이디</th>
					<th>신고된아이디</th>
					<th>신고항목</th>
					<th>처리한날짜</th>
					<th>처리내용</th>
					<th>처리자</th>
				</tr>
				<tbody id="declist2"></tbody>
				<tr>
					<td colspan="7" id="paging" >
						<div class="container" style="width:850px;">                           
			               <nav aria-label="Page navigation" style="text-align:center;">
			                  <ul class="pagination" id="pagination"></ul>
			               </nav>               
			            </div>
					</td>
				</tr>
			</table>
		</div>
</body>
<script>
	const headTxt = document.getElementById('headTxt');
	headTxt.innerText = '신고목록'
	
	$("#tab1").click(function() {
		location.href='./managerPage'
	});
	
	var ahr = document.getElementsByTagName('a');
	document.getElementById("a2").style = "color: black; box-shadow: inset 0 -6px 0 gray; cursor:pointer;";
	
	$('#a1').click(function(){
		location.href='./decPage'
	});
	
	$('#a3').click(function(){
		location.href='./decPage3'
	});
</script>
</html>