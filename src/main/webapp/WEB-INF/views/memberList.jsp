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
    	
    	#tab1{
    		font-weight: bold;
    		color: orange;
    	}
    	
		#memS{
		   	position: absolute;
		   	left: 880px;
		   	top: 200px;
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
		
		#ListTable{
		    position: absolute;
		   	left: 300px;
		   	top: 220px;
		}
    </style>
</head>
<body class="no-drag">
	<%@ include file="headerShs_login.jsp"%>
	<%@ include file="AdminMyPageShs.jsp"%>
	
	
	<!-- 검색 select 박스 추가 -->
		<div  id="memS">
			<form action="search_mem" method="GET" name="search_mem">
				<select name="SearchType" id="type" style="height: 25px;">
					<option selected value="all">전체</option>
					<option value="mem_id">아이디</option>
					<option value="mem_name">이름</option>
				</select>
				<input type="text" name="keyword">
				<input type="button" id="btnSearch" onclick="SearchList()" value="검색">
			</form>
		</div>


		<div id="ListTable">
			<table>
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>가입날짜</th>
				</tr>
			</thead>
			<tbody id="memlist"></tbody>
			<tr>
				<td colspan="5" id="paging" >
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
	headTxt.innerText = '회원목록'
	
		function SearchList(){
		$.ajax({
			type: 'GET',
			url : 'SearchList',
			data : $("form[name=search_mem]").serialize(),
			success : function(result){
				console.log("확인");
				//테이블 초기화
				$('#memlist').empty();
				if(result.length>=1){
					var str = '';
					result.forEach(function(item){
						var date = new Date(item.mem_date);
						str="<tr>"
						str+="<td style='width:15%'>"+item.mem_id+"</td>";
						str+="<td style='width:15%'>"+item.mem_name+"</td>";
						str+="<td style='width:40%'>"+item.mem_email+"</td>";
						str+="<td style='width:15%'>"+item.mem_phone+"</td>";
						str+="<td style='width:15%'>"+date.getFullYear()+"-"+("0"+(date.getMonth()+1)).slice(-2)+"-"+("0" + date.getDate()).slice(-2)+"</td>";
						str+="</tr>";
						$('#memlist').append(str);
						
		
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
			url:'memlist',
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
			content += "<tr>";
			content += "<td style='width:15%'>"+item.mem_id+"</td>";
			content += "<td style='width:15%'>"+item.mem_name+"</td>";
			content += "<td style='width:40%'>"+item.mem_email+"</td>";
			content += "<td style='width:15%'>"+item.mem_phone+"</td>";
			content += "<td style='width:15%'>"+date.getFullYear()+"-"+("0"+(date.getMonth()+1)).slice(-2)+"-"+("0" + date.getDate()).slice(-2)+"</td>";
			content += "</tr>";	
		});
		//console.log(content);
		$('#memlist').empty();
		$('#memlist').append(content);		
	}
	
	$("#tab2").click(function() {
		location.href='./decPage'
	});
</script>
</html>