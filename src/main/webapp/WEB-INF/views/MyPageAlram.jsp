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
   
   table {
	width: 500px;
	position: relative;
	right: 0px;
	top:50px;
	float: left;
	}

	table,td{
	border-bottom: 1px solid black;
	border-collapse: collapse;
	padding: 5px 10px;
	}


	
	#AlrimPageList{
		width: 700px;
		height: 600px;
		position: absolute;
		top: 200px;
		left: 300px;
		/* background-color: yellow; */
	}
	.alrimTd{
		margin: 0px auto;
	}
	#title{
		position: absolute;
		top: 82px;
		left: 300px;
	}
    
    </style>
</head>
<body>
	<%@ include file="headerShs_login.jsp"%>
	<%@ include file="MyPageShs.jsp"%>
	
	<div id="title">
		<h2>알림목록</h2>
	</div>

	<div id="AlrimPageList">
		<table>
			<tbody id="list"></tbody>
			<tr>
				<td colspan="4" id="paging">
					<div class="container">                           
               			<nav aria-label="Page navigation" style="text-align:center">
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

AlrimPageList(currPage,10);


function AlrimPageList(page,cnt) {
	
	// 페이지 도착하자마자 ajax 실행
	$.ajax({
		type:'POST',
		url:'AlrimPageList',
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
						AlrimPageList(page,10);
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
    
    
    
    list.forEach(function(item,alarm_num) {
    	var date = new Date(item.alarm_date);
    	var target = item.alarm_target;
    	console.log(target+"d");
    	var msg = '';
		if (target == 0) {
			msg = "댓글이 달렸습니다.";
		}else{
			msg = "구독자가 새글을 업로드 하였습니다.";
		}

		content +='<tr>';
		content += '<td  class="alrimTd" onclick=location.href="./boardDetail?board_num='+item.alarm_targetNum+'" style="cursor:hand">'+item.mem_id+"님 "+msg
		+'<td>'+date.getFullYear()+"-"
	      +("0"+(date.getMonth()+1)).slice(-2)+"-"
	      +("0" + date.getDate()).slice(-2)+" "
	      +("0" + date.getHours()).slice(-2)+":"
	      +("0" + date.getMinutes()).slice(-2)+":"
	      +("0" + date.getSeconds()).slice(-2);
		content += '&nbsp;&nbsp;&nbsp;&nbsp;'+'<button class="alrimDel">'+"X"+'</button>'+'</td>';
		content += '</tr>';
    });
    $('#list').empty();
    $('#list').append(content);
}

$('.alrimDel').click(function() {
	$(this).next().val();
	console.log($(this).next().val());
	console.log("버튼");
})


</script>
</html>