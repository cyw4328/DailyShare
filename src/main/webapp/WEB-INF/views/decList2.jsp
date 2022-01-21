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
		    left: 875px;
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
		#popUp{
			display:none;
			position: absolute;
			width: 200px;
			height: 250px;
			top:25%;
			left: 49%;
			border: 1px solid black ;
			z-index: 10;
			background-color: white;
		}
    </style>
</head>
<body class="no-drag">
	<div id="popUp">
		<input type="button" value="X" onclick="popClose();"/>
		<p>작성자 : <span class="popId"></span></p>
		<p>내용 : <span class="popContent"></span></p>
		<p>신고항목 : <span class="popDecname"></span></p>
		<p>처리 내용: <span class="popState"></span></p>
		<button onclick="popClose();">확인</button>
	</div>
	<%@ include file="headerShs_login.jsp"%>
	<%@ include file="AdminMyPageShs.jsp"%>
	
	<div id="dec">
        <a  id="a1" href="./decPage" style="color: black; cursor:pointer;">접수된신고</a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a  id="a2" href="./decPage2" style="color: black; cursor:pointer;">처리된 신고</a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a id="a3" href="./decPage3" style="color: black; cursor:pointer;">항목관리</a>
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

var currPage = 1;
var totalPage = 2;

listCall(currPage,5);

function more(){ //다음 페이지로 넘겼을 때
	currPage++;
	console.log('currPage',currPage);
	if(currPage>totalPage){
		$('button').attr('disabled',true);
	}else{
		listCall(currPage, 5);			
	}
}

function listCall(page, cnt){				
	
	$.ajax({
		type:'GET',
		url:'csj_declist2',
		data:{'page':page,'cnt':cnt},
		dataTyps:'JSON',
		success: function(data){
			console.log(data.list);
			totalPage = data.pages;
			listDraw(data.list);
			
			if (data.list.length>0) {
				
			$('#pagination').twbsPagination({
				startPage: currPage,//현재 페이지
				totalPages: totalPage,//만들수 있는 총 페이지 수
				visiblePages:5, //[1][2][3]... 이걸 몇개 까지 보여줄 것인지
				onPageClick:function(evt,page){//해당 페이지 번호를 클릭했을때 일어날 일들
					console.log(evt); //현재 일어나는 클릭 이벤트 관련 정보들
					console.log(page);//몇 페이지를 클릭 했는지에 대한 정보
					listCall(page, 5);
				}
			});
			}
							
		},
		error:function(e){
			console.log(e);
		}
	});		
}

function listDraw(list){ //리스트를 불러올때 하단 생성
	console.log(list);
	var content = '';	
	list.forEach(function (item){
		var date = new Date(item.sol_date);
			content+='<tr>'
			content+= "<td>"+item.sol_num+"</td>";
			content+="<td>"+item.mem_id+"</td>";
			content+="<td>"+item.dec_targetId+"</td>";
			content+="<td>"+item.dec_name+"</td>";
			content+="<td>"+date.getFullYear()+"-"+("0"+(date.getMonth()+1)).slice(-2)+"-"+("0" + date.getDate()).slice(-2)+"</td>";
			content+="<td>"+'<button onclick="checkReport('+item.dec_target+','+item.dec_targetNum+','+item.dec_num+',\''+item.dec_name+'\',\''+item.sol_state+'\')">확인</button>'+'</td>';					
			content+="<td>"+item.sol_admin+"</td>";
			content+="</tr>";	
	});
	//console.log(content);
	$('#declist2').empty();
	$('#declist2').append(content);		
}

function checkReport(dec_target,dec_targetNum,dec_num,dec_name,sol_state) {
	console.log(dec_target,dec_targetNum,dec_num,dec_name,sol_state);
	$('#popUp').show();
	$('.popState').text(sol_state);
	
	$.ajax({
		type:'post',
		url:'csj_singoCont',
		data:{'dec_target':dec_target,'dec_targetNum':dec_targetNum,'dec_name':dec_name},
		dataType:'JSON',
		success: function(data){
			console.log(data.content,data.mem_id,data.dec_name);
			$('.popId').text(data.mem_id);
			$('.popContent').text(data.content);
			$('.popDecname').text(data.dec_name);
			
		},
		error: function(e){
			console.log(e);
		}
		
		
	});
}
function popClose() {
	$('#popUp').toggle();
}


	const headTxt = document.getElementById('headTxt');
	headTxt.innerText = '신고목록'
	

	
	var ahr = document.getElementsByTagName('a');
	document.getElementById("a2").style = "color: black; box-shadow: inset 0 -6px 0 gray; cursor:pointer;";
	

</script>
</html>