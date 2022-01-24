<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Daily Share</title>
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
		top: 108px;
		left: 300px;
		  font-size: 28px;
  		font-style: bold;
	}
	
	.borderSt{
		position: relative;
		top:145px;
		left:300px;
	}
	
	.followCnt{
		 position: absolute;
	     top :7px;
	     left:0px;
	     margin-bottom: 20px;
	}
    
    </style>
</head>
<body>
	<%@ include file="headerShs_login.jsp"%>
	<%@ include file="MyPageShs.jsp"%>

		<p id="title">알림목록</p>

	<div class="borderSt">
		<hr style="border:1px solid #9a9a9a; width: 900px; float: left;">
		<p class="followCnt">알림목록 입니다.</p>
	</div>


	<div id="AlrimPageList">
		<table>
			<thead id="list">
			
			</thead>
			<tbody>
			<tr>
				<td colspan="2" id="paging">
					<div class="container">                           
               			<nav aria-label="Page navigation" style="text-align:center">
                  			<ul class="pagination" id="pagination"></ul>
              			</nav>               
            		</div>
				</td>
			</tr>
			</tbody>
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
			listDraw(data.list,data.loginId);
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

function listDraw(list,loginId) {
    var content = '';
    
    
    
    list.forEach(function(item,alarm_num) {
    	var date = new Date(item.alarm_date);
    	var target = item.alarm_target;
    	console.log(target+"d");
    	var msg = '';
		if (target == 1) {
			msg = "댓글이 달렸습니다.";
		}else{
			msg = "구독자가 새글을 업로드 하였습니다.";
		}

		content +='<tr>';
		content += '<td  class="alrimTd" onclick=location.href="./csj_detail?board_num='+item.alarm_targetNum+'&mem_id='+item.mem_id+'" style="cursor:hand">'+loginId+"님 "+msg+'</td>'
		+'<td>'+date.getFullYear()+"-"
	      +("0"+(date.getMonth()+1)).slice(-2)+"-"
	      +("0" + date.getDate()).slice(-2)+" "
	      +("0" + date.getHours()).slice(-2)+":"
	      +("0" + date.getMinutes()).slice(-2)+":"
	      +("0" + date.getSeconds()).slice(-2);
		content += '&nbsp;&nbsp;&nbsp;&nbsp;'+'<button onclick="alrimDel('+item.alarm_num+')">'+"X"+'</button>'+'<input type="hidden" value="'+item.alarm_num+'"/>'+'</td>';
		content += '</tr>';
    });
    $('#list').empty();
    $('#list').append(content);
}



function alrimDel(e) {
	$.ajax({
		type:'POST',
		url:'alrimDel',
		data:{"alram_num":e}, // {}안에 아무것도 안넣으면 다보여줘라 라는 뜻
		dataType:'JSON',
		success:function(data) {
			console.log(data.list);
			window.location.href="./MyAlrimPage";
			
		},
		error:function(e) {
			console.log(e);
		}
	});
}


</script>
</html>