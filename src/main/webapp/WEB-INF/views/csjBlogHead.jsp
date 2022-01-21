<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <!-- <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script> -->
   <style>
      
      #menuBody a:link { color: black; text-decoration: none;}
      #menuBody a:visited { color: black; text-decoration: none;}
      #menuBody a:hover { color: black; text-decoration: none;}
      
      #blogHead{
         position:relative;
         
         border-bottom:1px solid #dedede;
         width: 100%;
         height:85px;
         list-style-type : none;
         margin: 0;
         padding: 0;
         text-align: center;
      }
      .hamberger{
         position: absolute;
         left: 2%;
         top:20px;
      }
      
      img[src="resources/images_csj/hambergerimg.png"]{
         cursor: pointer;
         width: 50px;
         height: 50px;
      }
      .blogName{
         display: inline-block;
         margin-top: 25px;
         font-size:30px;
/*          position: absolute;
         left:18%;
         top: 25px; */
         
      }
      
      .blogSearch{
         position: absolute;
         font-size:30px;
         right : 70px;
         top: 25px;
      }
      

      
      
      
      #menubox{
        position:absolute;
        display:none;
        width:300px;
       	height: 1918px;
        background-color:rgba(225, 225, 225, 0.8);
        z-index: 10;
        padding: 35px;
      }
      .menuList{
      	color:#6E6E6E;
      	display: block;
      	font-size:22px;
      	width:230px;
      	height: 50px;
      	margin-bottom: 30px;
      	font-weight: 600;
    }
      .menuList:hover {
		text-decoration: underline;
	}
	.menuNone{
		text-align:center;
		color:#6E6E6E;
      	display: block;
      	font-size:22px;
      	width:230px;
      	height:30px;
      	font-weight: 600;
      	letter-spacing: 3px;
      	margin-bottom: 5px;
	}
	.menu_close{
		position: absolute;
		padding:0;
		margin:0;
		top: 0px;
		right: 5px;
		border:0;
		border-radius:5px;
		background-color: rgba(225, 225, 225,0.1);
		font-weight: 600;
		color: #6E6E6E;
		font-size: 25px;
		font-weight: 600;
		cursor: pointer;
	}

      
   </style>
</head>
<body id="menuBody">
   <nav id="blogHead">
      <span class="hamberger">
         <img  src="resources/images_csj/hambergerimg.png" onclick="menuMove();">
      </span>
      <span class="blogName">
         <a href="./csj_blogMain?mem_id=${mem_id}">
               <c:if test="${empty mem_blog}">
                  ${mem_id}의 블로그
               </c:if>
               <c:if test="${not empty mem_blog}">
                  ${mem_blog}
               </c:if>
         </a>
      </span>
      <!-- <span class="blogSearch">
         검색창
      </span> -->
      <span class ="foliSpan" ><input class="followBtn" id="${item.sub_num}" type="button" value="구독하기" /></span>
	<span class ="UnfoliSpan" ><input class="UnfoliBtn" id="${item.sub_num}" type="button" value="구독중" /></span>
      
   </nav>
   
   <div id="menuBox">
	   		<input class="menu_close" type="button"  value="X" />
            <c:if test="${empty menu}"> 
                  <span class="menuNone">메뉴가</span>
                  <span class="menuNone">존재하지</span>
                  <span class="menuNone">않습니다</span>
            </c:if>               
            <c:if test="${not empty menu}">
               <c:forEach items="${menu}" var="list">
                     <a href="./csj_menuMain?mem_id=${mem_id}&menu_num=${list.menu_num}">
                        <span class="menuList">${list.menu_name}</span>
                     </a>               
               </c:forEach>
            </c:if>

   </div>
   
</body>
<script>
function menuMove() {
   console.log('버튼 작동');
   $('#menuBox').animate({width:"toggle"},400);
}

$('.menu_close').click(function name() {
	$('#menuBox').animate({width:"toggle"},400);
});








































//구독하기
//var mem_id = 'test04';
var mem_id='${mem_id}';
//var mem_id = ${boardDetail.mem_id}; --> board 에 대한 작성자

$('.UnfoliSpan').hide();

$('.followBtn').click(function (){
	BtnVal = $(this).val();
	console.log('스크립트 테스트'+BtnVal);
	$('.UnfoliSpan').show();
	$('.foliSpan').hide();
	
		   $.ajax({
			type:'post',
			url:'followPlusShs',
			data:{'mem_id':mem_id},
			dataType:'JSON',
			success: function(data) {
				console.log(data.result);
				 if(data.result==0){
						$('.UnfoliSpan').show();
						$('.foliSpan').hide();
				 }
				
			},
			error: function(e) {
				console.log(e);
			}
			
		});  
		
		
}); 



//구독취소
$('.UnfoliBtn').click(function (){
	BtnVal = $(this).val();
	console.log('스크립트 테스트'+BtnVal);
	$('.UnfoliSpan').hide();
	$('.foliSpan').show();
	
 	$.ajax({
		type:'post',
		url:'followDelShs',
		data:{'mem_id':mem_id},
		dataType:'JSON',
		success: function(data) {
			console.log(data.result);
			if(data.result==0){
				$('.UnfoliSpan').hide();
				$('.foliSpan').show();
		 }
		},
		error: function(e) {
			console.log(e);
		}
		
	});   

}); 













</script>
</html>