<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
    <script src="resources/js/jquery.twbsPagination.js"></script>

    <style>
    #gudokJa{
    	position: absolute;
    	right: 400px;
    	top: 270px;
    }
    #gudokJa:hover{
		color: red;
		cursor: pointer;
    }
    #FeedPageMain{
    	position: relative;
    	left: 350px;
    	top: 100px;
    }
    #gudokjaBoard{
    	/* background-color: black; */
    	width: 1000px;
    	height: 600px;
    	position: absolute;
    	top: 300px;
    	left: 330px;
    	display: none;
    }
    
        #gudokjaBoardNone{
    	/* background-color: black; */
    	width: 1000px;
    	height: 600px;
    	position: absolute;
    	top: 300px;
    	left: 400px;
    	display: none;
    }
    
    #feedTable{
    	width: 200px;
    	height: 500px;
    	position: absolute;
    	text-align: center;

    }
    #feedCont{
    	border-bottom: 3px solid black;
    }
    #feedTr{
    	border-bottom: 2px solid black;
    }
    #forumTd{
    	width:200px;

    }
    
    .BigTxt{
    	font-size:25px;
    }
	table{
		width:1000px;}
		
	tr{
		border-bottom:1px solid #cecece;
		height:120px;
	}
	
	
    </style>
</head>
<body>
	<%@ include file="headerShs_login.jsp"%>
	
	<div>
		<div id="FeedPageMain">
			<h2>FEED</h2>
	    	<h4>내가 구독하고 있는 글 입니다.</h4>	
	    	<a href="./followingShs" ><span>구독중 : ${subCont}</span></a></br>
	    	<hr style="border:1px solid black; width:1100px; float:left;" >
	    	
		</div>
		

		
	</div>
	
	<div id="gudokjaBoard">
		<table id="feedTable">
			<tbody id="list"></tbody>
			<tr>
				<td colspan="3" id="paging">
					<div class="container">                           
               			<nav aria-label="Page navigation" style="text-align:center">
                  			<ul class="pagination" id="pagination"></ul>
              			</nav>               
            		</div>
				</td>
			</tr>
		
			<%-- <c:forEach var="item" items="${subsBoard}">
					<tr id="feedCont">
						<td>작성자 : ${item.mem_id}<br/>${item.board_date}<br/>좋아요 : ${item.board_like}</td>
						<td>제목 : ${item.board_subject}<br/>내용 : ${item.board_cont }<br/></td>
						<td><img src="/photo/${item.board_thumFileName}" width="100px"/></td>
					</tr>
			</c:forEach> --%>
		</table>
	</div>
	
	<div id="gudokjaBoardNone">
		<h1>로그인 후 사용 할 수 있습니다.</h1>
		<h3>오늘을 공유하는 Daily Share!</h3>
	</div>
</body>
<script>

display();

	$('#gudokJa').click(function() {
		window.location.href="./";
	})
	
function display() {
		var loginId = '<%=(String)session.getAttribute("loginId")%>';
		
		if (loginId == "null") {
			/* $('#gudokjaBoardNone').css{'display':'block'}; */
			var None = document.getElementById('gudokjaBoardNone');
			None.style.display = 'block';
		}else{
			var True = document.getElementById('gudokjaBoard');
			True.style.display = 'block';	
		}
		
}
	
	
	
	
	
	var currPage = 1;
	var totalPage = 2;
	
	listCall(currPage,10);
	
	function listCall(page,cnt) {
		
		// 페이지 도착하자마자 ajax 실행
		$.ajax({
			type:'POST',
			url:'feedListCall',
			data:{'page':page,'cnt':cnt}, // {}안에 아무것도 안넣으면 다보여줘라 라는 뜻
			dataType:'JSON',
			success:function(data) {
				
				totalPage = data.pages;
				listDraw(data.list);
				if (data.list.length > 0) {
					$('#pagination').twbsPagination({
						startPage:currPage, // 현재 페이지
						totalPages:totalPage, // 만들수 있는 총 페이지 수
						visiblePages:5, // [1][2][3]... 이걸 몇개까지 보여줄 것인가? 밑에 페이지클릭숫자
						onPageClick:function(event,page) { // 해당 페이지 번호를 클릭 했을때 일어날 일들
							console.log(event); // 현재 일어나는 클릭 이벤트 관련 정보들
							console.log(page); // 몇 페이지를 클릭 했는지에 대한 정보
							listCall(page,10);
						}
					
					});	
				}
			
				
				
			},
			error:function(e) {
				console.log(e);
			}
		});
	}

	
	function listDraw(list) {
        var content = '';
        list.forEach(function(item,board_num) {
        	var date = new Date(item.board_date);
   		 	content +='<table><tr onclick=location.href="./csj_detail?board_num='+list[i].board_num+'&mem_id='+list[i].mem_id+'" style="cursor:hand; border-bottom = 1px solid black;">';
			content += '<td  id="forumTd" style ="font-size:16px;">'+"by &nbsp&nbsp"+item.mem_id+'</td>';
			content += '<td>'+'<p class="BigTxt">'+item.board_subject+'</p>'+'<p>'+item.board_cont+'</p>'+date.getFullYear()+"-"
		      +("0"+(date.getMonth()+1)).slice(-2)+"-"
		      +("0" + date.getDate()).slice(-2)+" "
		      +("0" + date.getHours()).slice(-2)+":"
		      +("0" + date.getMinutes()).slice(-2)+":"
		      +("0" + date.getSeconds()).slice(-2)+"&nbsp;&nbsp;&nbsp;좋아요  "+'<span style="color:red;">'+item.board_like+'</span>'+'</td>';
			
			content += '<td style="text-align:right;">'+'<img src="/photo/'+item.board_thumFileName+'"width="100px">'+'</td>'
			content += '</tr>'+'<br/>'+'</table>';
        });
        $('#list').empty();
        $('#list').append(content);
    }
	
	
	<%-- <c:forEach var="item" items="${subsBoard}">
	<tr id="feedCont">
		<td>작성자 : ${item.mem_id}<br/>${item.board_date}<br/>좋아요 : ${item.board_like}</td>
		<td>제목 : ${item.board_subject}<br/>내용 : ${item.board_cont }<br/></td>
		<td><img src="/photo/${item.board_thumFileName}" width="100px"/></td>
	</tr>
</c:forEach> --%>


</script>
</html>