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
    
      	   #con_gooDock{width: 1200px;}
   #gooDock{
      position: relative;
      top :100px;
      right:0px;
      float:right;
      width:900px;   
   }
   
   #sival{
   	width: 700px;
   	height: 600px;
   	position: absolute;
   	top: 200px;
   	left: 300px;
   }

   #pagination{

   }
   	#title{
		position: absolute;
		top: 82px;
		left: 300px;
	}
	
		#Search{
	   	width: 300px;
	   	height: 50px;
	   	position: absolute;
	   	top: 140px;
	   	left: 300px;
	}
    
    </style>
</head>
<body>
	<%@ include file="headerShs_login.jsp"%>
	<%@ include file="MyPageShs.jsp"%>
	
	<div id="title">
		<h2>내가 쓴 댓글 목록</h2>
	</div>
	
	
	<div id="sival">
		<table>
			<tbody id="list"></tbody>
			<tr>
				<td colspan="4" id="paging">
					<div class="container">                           
               			<nav aria-label="Page navigation" style="text-align:center; width:500px;">
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

reviewList(currPage,10);


function reviewList(page,cnt) {
	
	// 페이지 도착하자마자 ajax 실행
	$.ajax({
		type:'POST',
		url:'reviewList',
		data:{'page':page,'cnt':cnt}, 
		dataType:'JSON',
		success:function(data) {

			totalPage = data.pages;
			listDraw(data.list);
			console.log(data.list);
			
			if (data.list.length > 0) {
				$('#pagination').twbsPagination({
					startPage:currPage, // 현재 페이지
					totalPages:totalPage, // 만들수 있는 총 페이지 수
					visiblePages:5, // [1][2][3]... 이걸 몇개까지 보여줄 것인가? 밑에 페이지클릭숫자
					onPageClick:function(event,page) { // 해당 페이지 번호를 클릭 했을때 일어날 일들
						console.log(event); // 현재 일어나는 클릭 이벤트 관련 정보들
						console.log(page); // 몇 페이지를 클릭 했는지에 대한 정보
						reviewList(page,10);
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

    list.forEach(function(item,com_num) {
    	var date = new Date(item.com_date);

		content +='<tr>';
		content += '<td  class="alrimTd" onclick=location.href="./boardDetail?board_num='+item.board_num+'" style="cursor:hand">'+item.mem_id+" 님의 댓글 : "+item.com_cont+'</td>'
		+'<td>'+date.getFullYear()+"-"
	      +("0"+(date.getMonth()+1)).slice(-2)+"-"
	      +("0" + date.getDate()).slice(-2)+" "
	      +("0" + date.getHours()).slice(-2)+":"
	      +("0" + date.getMinutes()).slice(-2)+":"
	      +("0" + date.getSeconds()).slice(-2);
		content += '&nbsp;&nbsp;&nbsp;&nbsp;'+'<button onclick="MyComDel('+item.com_num+')">'+"삭제"+'</button>'+'</td>';
		content += '</tr>';



    });
    $('#list').empty();
    $('#list').append(content);
}

function MyComDel(e) {
	$.ajax({
		type:'POST',
		url:'MyComDel',
		data:{"com_num":e}, // {}안에 아무것도 안넣으면 다보여줘라 라는 뜻
		dataType:'JSON',
		success:function(data) {
			console.log(data.list);
			window.location.href="./MyReviewControlPage";
			
		},
		error:function(e) {
			console.log(e);
		}
	});
}
	

</script>
</html>