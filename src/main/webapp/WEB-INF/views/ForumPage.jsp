<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
     
    <style>
    	.ForumInput{
    		 text-align: center; 
    	}

    /* 	#ForumBoardListTable{
    		border: 1px solid black;
    	} */
    	#forumTd{
    		border: 1px solid black;
    	}
    	#moreBtn{
    		position: absolute;
    		left: 700px;
    		background-color: black;
    		width: 100px;
    		height: 50px;
    		color: white;
    	}
    	
    </style>
</head>
<body>
	<%@ include file="headerShs_login.jsp"%>
          
          
        <div class="ForumInput">
        <h2>FORUM</h2>
        <p>자유롭게 이야기를 나눠보세요</p>
        <div class="u-form u-form-1">
	    	<form action="ForumBoardAdd" method="POST">
	    		<input type="hidden" value="21" name="MenuForum"/>
        		<table>
		         	<tr>
		         		<td><p>제목</p></td>
		         		<td><input type="text" placeholder="제목을 입력하세요" id="forumSub" name="ForumSub"></td>
		         		<td></td>
		         	</tr>
		         	<tr>
		         		<td><p>내용</p></td>
		         		<td><textarea placeholder="내용을 입력하세요." rows="4" cols="50" id="message-22d4" name="ForumCont"></textarea></td>
		         		<td></td>
		         	</tr>
		         	<tr>
		         		<td><p>파일첨부</p></td>
		         		<td><input type="file" value="사진은 3장까지만 첨부 가능합니다."></td>	
		         		<td><input type="submit" value="등록하기"></td>	
		         	</tr>
		         </table>
          	</form>
          </div>
		</div>
		<br/>
        <hr/>
        <br/>
     
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
     
   		<br/>
        <hr/>
        <br/>  
     
        <table id="ForumBoardListTable">
        	<tbody class="ForumBoardList">
        	</tbody>
		</table>
		<br/>
		<button onclick="more()" id="moreBtn">더보기</button>
		<br/>

</body>
<script>
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
		
		//console.log(list[i]);
		/* content += '<a href="./boardDetail?board_num='+list[i].board_num+'">'+'<tr>';
		content += '<td>'+list[i].mem_id
		+"작성일 : "+date.getFullYear()+"-"
	      +("0"+(date.getMonth()+1)).slice(-2)+"-"
	      +("0" + date.getDate()).slice(-2)+" "
	      +("0" + date.getHours()).slice(-2)+":"
	      +("0" + date.getMinutes()).slice(-2)+":"
	      +("0" + date.getSeconds()).slice(-2)+
			"공감수 : "+list[i].board_like+'</td>'+'</tr>';
		content += '<tr>'+'<td>'+"제목 : "+list[i].board_subject+'<br/>'+"내용 : "+list[i].board_cont+'<br/>'+"작성자 : "+list[i].mem_id+'</td>';
		content += '</tr>'+'</a>'+'<hr/>'; */
		
		 content +='<tr onclick=location.href="./boardDetail?board_num='+list[i].board_num+'" style="cursor:hand">';
			content += '<td  id="forumTd">'+list[i].mem_id+'&nbsp;&nbsp;&nbsp;&nbsp;'
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
	/* $('.ForumBoardList').empty(); */
	$('.ForumBoardList').append(content);
};


</script>
</html>