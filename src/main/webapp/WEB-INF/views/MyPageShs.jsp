<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>Daily Share</title>

   <style>
   
   #con_gooDock{width: 1200px;
  	 position: relative;
      top :0x;
      right:0px;
   }
   #gooDock{
   	display:inline;
      position: absolute;
      top :100x;
      right:0px;
      float:right;
      width:900px;   
   }
   
   #memuBar{
   position: absolute;
     top :100px;
     right:950px;
     display:inline;
   	  width:200px;
   }


   
    #left{
      border: 1px solid #d5d5d5;
		text-align: center;
		line-height: 80px; 
		text-align: left;
		padding-left: 10px;
          }
      #write{
       border: 1px solid black;
		text-align: center;
		height:40px;
		text-align: center;
		padding-left: 10px;
		line-height: 40px;
		background: black;
		font-weight: bold;
      	color:white;
      	margin-top: 3px;
      	margin-bottom: 3px;
      	cursor: pointer;

      }
      
   .tab00{
    border-left: 1px solid #d5d5d5;
    border-top: 1px solid #d5d5d5;
    border-right: 1px solid #d5d5d5;
    height: 40px;
    line-height: 40px;
	cursor: pointer;
	padding-left: 10px;
   }
    .tab00:last-child{
    border-bottom: 1px solid #d5d5d5;
    }
   
   
   .tab00 a{
   text-decoration-line : none;
   }
   
   
   .tab00:hover{
    font-weight: bold;
    color: #ff8a00;
   }

   
  
  #headTxt{
  font-size: 28px;
  font-style: bold;
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

a{
	text-decoration : none;
	color: black;
}

   
   
   </style>

<body>



<div id="con_gooDock">


<div id="memuBar">
		<div id = "left">
		

		<a href="/share/csj_blogMain?mem_id=${loginId}"><p style="text-align: center;">${loginId} 블로그</p></a>
		</div>
		

		<a href="./csj_writeForm" ><div id="write">글쓰기</div></a>
		<a href="./memberPassCk" ><div class= "tab00" id="tab1">개인정보수정</div></a>
		<a href="./followShs" ><div class= "tab00" id="tab2">구독관리</div></a>
		<a href="./MyAlrimPage"><div class= "tab00" id="tab3">알림목록</div></a>
		<a href="./menuAddPage"><div class= "tab00" id="tab5">블로그메뉴</div></a>
		<a href="./MyBoardControlPage"><div class= "tab00" id="tab6">MY 게시글</div></a>
		<a href="./MyReviewControlPage"><div class= "tab00" id="tab7">MY 댓글</div></a>

		
</div>	
		

	<div id="gooDock">
	
	
<!--		<span id="headTxt">구독 블로거 관리</span> 
 		<span class="Following">내가 구독하는 블로거</span>
		<span class="Follow">나를 구독하는 블로거</span> 
		<hr>-->		
	
</div>			
</body>
<script>
	






	














		

	

</script>
</html>