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
    		width: 1000px;
    		height: 30px;
    		left: 50px;
    		top:-300px;

    	}

    	#ForomBoardCheck{
    		position: relative;
    		left: 840px;
    		top: -40px;
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
    		position: relative;
    		width: 1000px;
    		height: 200px;
    		top:-300px;
    		left:10px;
    	}
    	
    	#add{
    		width: 800px;
    		height: 200px; 
    		background-color: white;
    		margin-left: 30px;
	   }

	   textarea{
	   		width:100%;
	   		height: 100%;
	   		display: inline-block;
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
         #ForumBoardList{
			position: relative;
    		width: 1000px;
    		height: 200px;
    		font-size: 20px;
    		padding: 20px;
    		top: -550px;
         }
         
         #moreBtn{
    		position: relative;
    		left: 500px;
    		top: 10px;
    		background-color: black;
    		width: 100px;
    		height: 50px;
    		color: white;
    	}





	.ForumBoardList{
		list-style:none;
	
	}
	
	
	.ForumBoardList li {
	    position: relative;
	  	 list-style:none;
	  	 margin-bottom: 20px;
	}

   
   .board_title{
   	display: block;
    overflow: hidden;
    position: absolute;
    max-width: 500px;
	top:80px;
	left:50px;
    font-size: 24px;
    line-height: 1;
    color: #222222;
    font-weight: normal;
    text-overflow: ellipsis;
    white-space: nowrap;
    
   }
   
    .board_title:hover{
	text-decoration:underline;
}

   
   .boardSTxt{
    position: absolute;
    top: 110px;
    left: 60px;
    display: block;
    display: -webkit-box;
    overflow: hidden;
    width: 564px;
    max-height: 44px;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
    font-size: 15px;
    color: #777;
    line-height: 22px;
    padding: 0 0 0 1px;
    }
    
    .screenOut{
	    font-size: 14px;
	    line-height: 14px;
	    font-family: fontARD;
	    color: #909090;
	    position: relative;
	    width: 200px;
	   	top:25px;
	   	left:0px;
	   	text-decoration : none;
   }

   .boardLike{
   		font-size: 13px;
   		position: absolute;
   		top:50px;
   		left:900px;
   		width: 100px;
   		color: black;
   }
   
	.likeCnt{
		color: red;
	} 
	
	*{margin: 0 auto;}		
      
	   li{
	   list-style:none;
	   }
	   
	#searchBtn{
	background-color: black;
	color: white;
	width: 90px;
	height: 40px;
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
				<table id="add">
					<tr style="height: 50px;">
						<th style="font-size: 13px;">제목</th>
						<td>
							<input type="text" maxlength='100' placeholder="제목을 입력하세요."  id="forumSub" name="ForumSub" style="width:100%; height: 100%;"/>
						</td>
					</tr>
					<tr>
						<th style="font-size: 13px;">내용</th>
						<td>
							<textarea maxlength='1000' placeholder="내용을 입력하세요." id="message-22d4" name="ForumCont"></textarea>
						</td>
					</tr>
				</table>
	    		<input type="submit" value="등록하기" id="ForomBoardCheck">
          	</form>
         

		<br/>

        <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
     	<div id="ForumSearch">
     	<form action="ForumSearch" method="POST">
     		<table>
     			<tr>
     				<td>
     					<select name="SearchScope" style=" height: 40px; font-size: 17px;">
     						<option selected="selected" value="All">전체</option>
     						<option value="User">작성자</option>
     						<option value="subCont">제목+내용</option>
     					</select>
     					<input type="text" name="ForumSearch" style=" height: 40px; font-size: 17px; margin:0px;"/>
     					<input type="submit" id="searchBtn" style=" height: 40px; margin:0px;" value="검색"/>
     				</td>
     			</tr>
     		</table>
     	</form>
     	</div>
   		<br/>

     	<div>
        <div id="ForumBoardList" >
        	<ul class = "ForumBoardList"> 		
			</ul>
			<br/>
			<button onclick="more()" id="moreBtn">더보기</button>
			<br/>		
		</div>
		</div>

</body>
<script>



<!-- 로그인,제목+내용입력시 등록가능 -->
$("#ForomBoardCheck").on("click", function(e) {
	   e.preventDefault();
	   var loginId = '<%=(String)session.getAttribute("loginId")%>';
	   
	   if (loginId == "null") {
			alert("로그인이 필요한 기능입니다.");
			location.href='./loginPage';
	   }else{
		   var ForumSub = $("input[name='ForumSub']").val();
		   var ForumCont = $("#message-22d4").val();
		   
		   //아이디,비밀번호 유효성 검사
		   if (ForumSub == null || ForumSub == "") { 
		      alert("제목을 입력해주세요");
		      return false;
		   } 
		   else if (ForumCont == null || ForumCont == "") { 
		      alert("내용을 입력해주세요");
		      return false;
		   }else{
			   alert("등록되었습니다.");
			   $('#ForumBoardAdd').submit();	   
		   }
	   }
});



var currPage = 1;

ForumListCall(currPage,5);

function more() {
	currPage++;
	ForumListCall(currPage,5);
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
/*
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
*/
function ForumBoardList(list) {
	var content = '';
	
	for (var i = 0; i < list.length; i++) {
		var date = new Date(list[i].board_date);
			content += '<li onclick=location.href="./csj_detail?board_num='+list[i].board_num+'&mem_id='+list[i].mem_id+'" style="cursor:hand">';
			content += '<dl class="listData">'+'<dd>'+'<span class="screenOut">'+list[i].mem_id+'&nbsp;&nbsp;&nbsp;&nbsp;'+date.getFullYear()+"-"
		      +("0"+(date.getMonth()+1)).slice(-2)+"-"
		      +("0" + date.getDate()).slice(-2)+" "
		      +("0" + date.getHours()).slice(-2)+":"
		      +("0" + date.getMinutes()).slice(-2)+""
		      +'</span>'+'</dd>'+'</dl>';
			content += '<dl class="boardLike">'+"좋아요 "+'<span>'+'<span class="likeCnt">'+list[i].board_like+'</span>'+'</span>'+' </dl>'+'</div>';
			content += '<strong class="board_title">'+'<span>'+list[i].board_subject+'</span>'+'</strong>';
			content += '<p class="boardSTxt">'+list[i].board_cont+'</p>'+'</div>';
			content += '</a>'+'</li>'+'</br>'+'</br>'+'</br>'+'</br>'+'</br>'+'</br>'+'</br>'+'</br>'+'<hr style="width:1000px; border:1px solid #ececec">';		
	}
	$('.ForumBoardList').append(content);
}


</script>
</html>