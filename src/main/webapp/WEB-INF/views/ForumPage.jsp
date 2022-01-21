<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>

    <style>
    	.ForBg{
    		background-color:#ebf5e9;
    		width:100%;
    		position: static;
    		top:86px;
    		left:0px;
    		height: 300px;
    		z-index:-1;
    		border-bottom: 1px solid #ededed;

    	}
    	.ForumInput{
    		position: relative;
    		text-align: left; 
    		font-size: 20px;
    		padding: 30px;
    		width: 700px;
    		height: 30px;
    		left: 50px;
    		top:-300px;

    	}
		.forum1{
			position: relative;
    		width: 613px;
    		height: 58px;
    		text-align: left; 
    		font-size: 20px;
    		padding-left: 20px;
    		left: 10px;
    		top: -300px;
    		background-color: white;

		}
		.forum2{
			position: relative;
    		width: 591px;
    		height: 38px;
    		text-align: left; 
    		font-size: 20px;
    		padding: 20px;
    		left: 10px;
    		top: -295px;
    		background-color: white;
 
		}
		#forum2{
			position: relative;
    		width: 500px;
    		height: 77px;
    		text-align: left; 
    		font-size: 20px;
    		left: 66px;
    		top: -38px;
    		
		}
    	#ForomBoardCheck{
    		position: relative;
    		left: 860px;
    		top: -285px;
    		background-color: black;
    		color: white;
    		width: 100px;
    		height: 35px;
    		border-radius: 10px / 10px;
    	}
    	p{
    		font-size: 15px;
		} 
    	#forumTd{
    		border: 1px solid black;
    		width: 500px;
    		height: 100px;
    		text-align: center;
    	}
    	#ForumSearch{
    		position: relative;
    		top: -570px;
    	}
    	
    	#ForumBoardAdd{
    		padding: 15px 200px;
    	}
    	.forumTd{
         max-width: 500px;
         text-overflow: ellipsis;
         white-space: nowrap;
         color: black;
         font-size: 14px;
         text-align: center;
         border-bottom: 1px solid black;
         
   }
         #ForumBoardListTable{
			border : 1px solid black;
			border-collapse : collapse;
			position: relative;
    		width: 700px;
    		text-align: left; 
    		font-size: 20px;
    		padding: 20px;
    		top: -550px;
         }
         
         #moreBtn{
    		position: relative;
    		left: 800px;
    		top: -550px;
    		background-color: black;
    		width: 100px;
    		height: 50px;
    		color: white;
    	}
    	
    </style>
</head>
<body>
	<%@ include file="headerShs_login.jsp"%>
          
         <div class="ForBg"></div>
        <div class="ForumInput">
        <h3>FORUM</h3>
        <p>자유롭게 이야기를 나눠보세요</p>
 		</div>
	    	<form action="ForumBoardAdd" method="POST" id="ForumBoardAdd">
	    		<input type="hidden" value="21" name="MenuForum"/>
	    		<div class="forum1">
	    			<p style="font-size:13px;">제목
	    			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    			<input type="text" placeholder="제목을 입력하세요" id="forumSub" name="ForumSub" style=" width:500px; height:60px; margin-top:-1px;"></p>
	    		</div>
	    		<div class="forum2">
	    			<p style="font-size:13px;">내용</p>
	    			<div id="forum2">
	    			<textarea placeholder="내용을 입력하세요." rows="5" cols="67" id="message-22d4" name="ForumCont"></textarea>
	    			</div>
	    		</div>
	    		<input type="submit" value="등록하기" id="ForomBoardCheck">
          	</form>
         

		<br/>

        <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
     	<div id="ForumSearch">
     	<form action="ForumSearch" method="POST">
     		<table>
     			<tr>
     				<td>
     					<select name="SearchScope">
     						<option selected="selected" value="All">전체</option>
     						<option value="User">작성자</option>
     						<option value="subCont">제목+내용</option>
     					</select>
     					<input type="text" name="ForumSearch"/>
     					<input type="submit" value="검색"/>
     				</td>
     			</tr>
     		</table>
     	</form>
     	</div>
   		<br/>

     	<div>
        <table id="ForumBoardListTable" >
        	<thead></thead>
        	<tbody class="ForumBoardList">
        	</tbody>
		</table>
		<br/>
		<button onclick="more()" id="moreBtn">더보기</button>
		<br/>
		</div>

</body>
<script>
$("#ForomBoardCheck").on("click", function(e) {
	   e.preventDefault();
	   var ForumSub = $("input[name='ForumSub']").val();
	   var ForumCont = $("#forumSub").val();
	   
	   //아이디,비밀번호 유효성 검사
	   if (ForumSub == null || ForumSub == "") { 
	      alert("제목을 입력해주세요");
	      return false;
	   } 
	   if (ForumCont == null || ForumCont == "") { 
	      alert("내용을 입력해주세요");
	      return false;
	   } 
});


var currPage = 1;

ForumListCall(currPage,10);

function more() {
	currPage++;
	ForumListCall(currPage,10);
}

function ForumListCall(page,cnt) {
	
	$.ajax({
		type:'POST',
		url:'forumBoardList',
		data:{'page':page,'cnt':cnt},
		dataType:'JSON',
		success:function(data) {
			console.log(data.list);
			if (data.list != []) {
				ForumBoardList(data.list);				
			}
		},
		error:function(e) {
			console.log(e);
		}
	});
}

function ForumBoardList(list) {
	var content = '';
	
	
	
	for (var i = 0; i < list.length; i++) {
		
		var date = new Date(list[i].board_date);
			
		 content +='<tr onclick=location.href="./csj_detail?board_num='+list[i].board_num+'&mem_id='+list[i].mem_id+'" style="cursor:hand">';
			content += '<td  class="forumTd">'+list[i].mem_id+'&nbsp;&nbsp;&nbsp;&nbsp;'
			+"작성일 : "+date.getFullYear()+"-"
		      +("0"+(date.getMonth()+1)).slice(-2)+"-"
		      +("0" + date.getDate()).slice(-2)+" "
		      +("0" + date.getHours()).slice(-2)+":"
		      +("0" + date.getMinutes()).slice(-2)+":"
		      +("0" + date.getSeconds()).slice(-2)+'&nbsp;&nbsp;&nbsp;&nbsp;'+
				"공감수 : "+list[i].board_like+'<br/>';
			content += '<b>'+list[i].board_subject+'</b>'+'<br/>'+list[i].board_cont+'</td>';
			content += '</tr>'+'<hr/>';
		

	}
	$('.ForumBoardList').append(content);
};

$('#ForomBoardCheck').click(function() {
	var loginId = '<%=(String)session.getAttribute("loginId")%>';
	
	if (loginId == "null") {
		alert("로그인이 필요한 기능입니다.");
	}else{
		$('#ForomBoardCheck').submit();
		
	}
	
})


</script>
</html>