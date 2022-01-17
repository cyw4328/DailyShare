<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
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
      border: 1px solid black;
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
    border: 1px solid black;
    height: 40px;
    line-height: 40px;
	cursor: pointer;
	padding-left: 10px
   }
   
   .tab00:hover{
    font-weight: bold;
    color: orange;
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



   
   
   </style>

<body>



<div id="con_gooDock">


<div id="memuBar">
		<div id = "left">관리자계정</div>
		<div id="write">글쓰기</div>
		<div class= "tab00" id="tab1">회원목록</div>
		<div class= "tab00" id="tab2">신고목록</div>
		<div class= "tab00" id="tab3">제재목록</div>
		<div class= "tab00" id="tab4">관리자목록</div>
		
</div>	
		

	<div id="gooDock">
	
	
		<span id="headTxt">구독 블로거 관리</span> 
<!-- 		<span class="Following">내가 구독하는 블로거</span>
		<span class="Follow">나를 구독하는 블로거</span> -->		
		<hr>
	
</div>			
</body>
<script>
/* $('#tab1').click(function(){
    $('#tab1').css({
          'color':'red'              
      });
    $('#tab2').css({
          'color':'black'
      });
    $('#tab3').css({
          'color':'black'
      });
    $('#tab4').css({
          'color':'black'
      });
    $('#tab5').css({
          'color':'black'
      });
    const title = document.getElementById('headTxt');
    title.innerText = '회원목록'
 
 });
 */





	














		

	

</script>
</html>