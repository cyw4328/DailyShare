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
		
		#DecTable1,#DecTable2,#DecTable3{
		    position: absolute;
		   	left: 300px;
		   	top: 220px;
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
        <a target="_blank" id="a1" style="color: black; box-shadow: inset 0 -6px 0 gray; cursor:pointer;">접수된신고</a>
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
		<div id="decM">
		<form action="enr_decM" method="GET" name="enr_decM">
			<input type="text" placeholder="새로 등록할 항목" name="decMkeyword" style="width : 300px; font-size:16px; height:30px;  border-radius: 5px / 5px;">
			<input type="button" id="decMEnr" onclick="decMSearchList()" value="등록">
        </form>
	</div>
	
	<div id="DecTable1">
			<table>
				<tr>
					<th>신고번호</th>
					<th>신고자아이디</th>
					<th>신고된아이디</th>
					<th>신고항목</th>
					<th>신고한날짜</th>
					<th>신고내용</th>
				</tr>
				<tbody id="declist1"></tbody>
				<tr>
					<td colspan="6" id="paging" >
						<div class="container" style="width:850px;">                           
			               <nav aria-label="Page navigation" style="text-align:center;">
			                  <ul class="pagination" id="pagination"></ul>
			               </nav>               
			            </div>
					</td>
				</tr>
			</table>
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
		
		
		<div id="DecTable3">
			<table>
				<tr>
					<th>코드</th>
					<th>신고항목</th>
					<th>사용여부</th>
					<th></th>
				</tr>
				<tbody id="declist3"></tbody>
				<tr>
					<td colspan="4" id="paging" >
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
	//검색 ajax
	function decSearchList(){
		$.ajax({
			type: 'GET',
			url : 'SearchList1',
			data : $("form[name=search_dec]").serialize(),
			success : function(result){
				console.log("확인");
				//테이블 초기화
				$('#declist1').empty();
				if(result.length>=1){
					var str = '';
					result.forEach(function(item){
						var date = new Date(item.dec_date);
						str='<tr>'
						str += "<td>"+item.dec_num+"</td>";
						str+="<td>"+item.mem_id+"</td>";
						str+="<td>"+item.target_id+"</td>";
						str+="<td>"+item.dec_name+"</td>";
						str+="<td>"+date.getFullYear()+"-"+("0"+(date.getMonth()+1)).slice(-2)+"-"+("0" + date.getDate()).slice(-2)+"</td>";
						str+="<td>"+item.dec_cont+"</td>";
						str+="</tr>";
						$('#declist1').append(str);
						
		
	        		})				 
				}
			}
		})
	};
	
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
			url:'declist1',
			data:{'page':page,'cnt':cnt},
			dataTyps:'JSON',
			success: function(data){
				console.log(data);
				totalPage = data.pages;
				listDraw(data.list);
				
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
								
			},
			error:function(e){
				console.log(e);
			}
		});		
	}
	
	
	function listDraw(list){ //리스트를 불러올때 하단 생성
		var content = '';	
		list.forEach(function(item, mem_id){
			var date = new Date(item.mem_date);
				content='<tr>'
				content+= "<td>"+item.dec_num+"</td>";
				content+="<td>"+item.mem_id+"</td>";
				content+="<td>"+item.target_id+"</td>";
				content+="<td>"+item.dec_name+"</td>";
				content+="<td>"+date.getFullYear()+"-"+("0"+(date.getMonth()+1)).slice(-2)+"-"+("0" + date.getDate()).slice(-2)+"</td>";
				content+="<td>"+item.dec_cont+"</td>";
				content+="</tr>";	
		});
		//console.log(content);
		$('#declist1').empty();
		$('#declist1').append(content);		
	}



	const headTxt = document.getElementById('headTxt');
	headTxt.innerText = '신고목록'
	
	$("#tab1").click(function() {
		location.href='./managerPage'
	});
	
	var ahr = document.getElementsByTagName('a');

	$("#dec").show();
	$("#decS").show();
	$("#decM").hide();
	$("#DecTable1").show();
	$("#DecTable2").hide();
	$("#DecTable3").hide();
	$('#a1').click();
    
    $('#a1').click(function(){
    	document.getElementById("a1").style = "color: black; box-shadow: inset 0 -6px 0 gray; cursor:pointer;";
    	document.getElementById("a2").style = "color: black; cursor:pointer;";
    	document.getElementById("a3").style = "color: black; cursor:pointer;";
    	$("#decS").show();
    	$("#decM").hide();
    	$("#DecTable1").show();
    	$("#DecTable2").hide();
    	$("#DecTable3").hide();
    	
    });
    
	$('#a2').click(function(){
		document.getElementById("a1").style = "color: black; cursor:pointer;";
    	document.getElementById("a2").style = "color: black; box-shadow: inset 0 -6px 0 gray; cursor:pointer;";
    	document.getElementById("a3").style = "color: black; cursor:pointer;";
    	$("#decS").show();
    	$("#decM").hide();
    	$("#DecTable1").hide();
    	$("#DecTable2").show();
    	$("#DecTable3").hide();
    });
    
	$('#a3').click(function(){
		document.getElementById("a1").style = "color: black; cursor:pointer;";
    	document.getElementById("a2").style = "color: black; cursor:pointer;";
    	document.getElementById("a3").style = "color: black; box-shadow: inset 0 -6px 0 gray; cursor:pointer;";
		$("#decS").hide();
		$("#decM").show();
		$("#DecTable1").hide();
    	$("#DecTable2").hide();
    	$("#DecTable3").show();
	});
</script>
</html>