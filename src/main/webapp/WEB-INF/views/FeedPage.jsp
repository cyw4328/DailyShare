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
    	 overflow: hidden;
 		 text-overflow: ellipsis;
  		display: -webkit-box;
  		-webkit-line-clamp: 1;
  		-webkit-box-orient: vertical;
  		width:750px;
  		border-bottom:1px solid #fff;
    }
    .BigTxt:hover{
    	border-bottom:1px solid black;
    }
    
	table{
		width:1170px;}
		
	tr{
		border-bottom:1px solid #cecece;
		height:140px;
	}
	
	
	.smallTxt{
		font-size:15px;
    	 overflow: hidden;
 		 text-overflow: ellipsis;
  		display: -webkit-box;
  		-webkit-line-clamp: 2;
  		-webkit-box-orient: vertical;
  		width:750px;
  		border-bottom:1px solid #fff;
	}
	
	.smallTxt:hover{
		text-decoration:underline;
	}
	
	#list{
		width: 1000px;
	}
	
	
	
	
	
	
    </style>
</head>
<body>
	<%@ include file="headerShs_login.jsp"%>
	
	<div>
		<div id="FeedPageMain">
			<h2>FEED</h2>
	    	<h4>?????? ???????????? ?????? ??? ?????????.</h4>	
	    	<a href="./followingShs" ><span>????????? : ${subCont}</span></a></br>
	    	<hr style="border:1px solid black; width:1170px; float:left;" >
	    	
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
						<td>????????? : ${item.mem_id}<br/>${item.board_date}<br/>????????? : ${item.board_like}</td>
						<td>?????? : ${item.board_subject}<br/>?????? : ${item.board_cont }<br/></td>
						<td><img src="/photo/${item.board_thumFileName}" width="100px"/></td>
					</tr>
			</c:forEach> --%>
		</table>
	</div>
	
	<div id="gudokjaBoardNone">
		<h1>????????? ??? ?????? ??? ??? ????????????.</h1>
		<h3>????????? ???????????? Daily Share!</h3>
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
		
		// ????????? ?????????????????? ajax ??????
		$.ajax({
			type:'POST',
			url:'feedListCall',
			data:{'page':page,'cnt':cnt}, // {}?????? ???????????? ???????????? ??????????????? ?????? ???
			dataType:'JSON',
			success:function(data) {
				
				totalPage = data.pages;
				listDraw(data.list);
				if (data.list.length > 0) {
					$('#pagination').twbsPagination({
						startPage:currPage, // ?????? ?????????
						totalPages:totalPage, // ????????? ?????? ??? ????????? ???
						visiblePages:5, // [1][2][3]... ?????? ???????????? ????????? ?????????? ?????? ?????????????????????
						onPageClick:function(event,page) { // ?????? ????????? ????????? ?????? ????????? ????????? ??????
							console.log(event); // ?????? ???????????? ?????? ????????? ?????? ?????????
							console.log(page); // ??? ???????????? ?????? ???????????? ?????? ??????
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

   		 	content +='<table><tr onclick=location.href="./csj_detail?board_num='+item.board_num+'&mem_id='+item.mem_id+'" style="cursor:hand; border-bottom = 1px solid black;">';

   		 	
			content += '<td  id="forumTd" style ="font-size:16px;">'+"by &nbsp&nbsp"+item.mem_id+'</td>';
			content += '<td>'+'<p class="BigTxt">'+item.board_subject+'</p>'+'<p class="smallTxt">'+item.board_cont+'</p>'+date.getFullYear()+"-"
		      +("0"+(date.getMonth()+1)).slice(-2)+"-"
		      +("0" + date.getDate()).slice(-2)+" "
		      +("0" + date.getHours()).slice(-2)+":"
		      +("0" + date.getMinutes()).slice(-2)+":"
		      +("0" + date.getSeconds()).slice(-2)+"&nbsp;&nbsp;&nbsp;?????????  "+'<span style="color:red;">'+item.board_like+'</span>'+'</td>';
			
			content += '<td style="text-align:right;">'+'<img src="/postImageFolder/'+item.board_thumFileName+'"width="100px">'+'</td>'
			content += '</tr>'+'<br/>'+'</table>';
        });
        $('#list').empty();
        $('#list').append(content);
    }
	
	
	<%-- <c:forEach var="item" items="${subsBoard}">
	<tr id="feedCont">
		<td>????????? : ${item.mem_id}<br/>${item.board_date}<br/>????????? : ${item.board_like}</td>
		<td>?????? : ${item.board_subject}<br/>?????? : ${item.board_cont }<br/></td>
		<td><img src="/photo/${item.board_thumFileName}" width="100px"/></td>
	</tr>
</c:forEach> --%>


</script>
</html>