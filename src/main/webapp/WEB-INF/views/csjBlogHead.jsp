<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>Daily Share</title>
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
      
      .subButtonBox{
         position: absolute;
         font-size:30px;
         right : 70px;
         top: 25px;
      }
      .subButton{
      	border:0;
      	border-radius:10px;
      	width: 80px;
      	height:35px;
      	cursor: pointer;
      	text-align: center;
      	font-size: 15px;
      	font-weight: 600;
      	
	    background-color: black;
	    color: #FFF;
	    font-weight: bold;
	    border: 0px;
	   /*  padding: 3px 10px; */
	    border-radius: 20px;
      	
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
	.subButton{
	
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
                  ${mem_id}??? ?????????
               </c:if>
               <c:if test="${not empty mem_blog}">
                  ${mem_blog}
               </c:if>
         </a>
      </span>
      <!-- <span class="blogSearch">
         ?????????
      </span> -->
		<span class="subButtonBox" >
			<c:if test="${mem_id ne loginId}">
				<c:if test="${subResult gt 0 }">	
					<form id="delSubForm" action="csj_delSub" method="get">
						<input class="subButton" id="delSub" type="button" value="?????????"/>
						<input type="hidden" name="sub_id" value="${mem_id}"/>
						<input type="hidden" name="mem_id" value="${loginId}"/>
					</form>
				</c:if>
				<c:if test="${subResult eq 0 }">
					<form id="inSubForm" action="csj_inSub" method="get">
						<input class="subButton" id="inSub" type="button" value="????????????"/>
						<input type="hidden" name="sub_id" value="${mem_id}"/>
						<input type="hidden" name="mem_id" value="${loginId}"/>
					</form>
				</c:if>
			</c:if>
			<c:if test="${mem_id eq loginId}">
				<input class="subButton" type="button" onclick="location.href='./csj_writeForm'" value="?????????"/>
			</c:if>
		</span>
      
   </nav>
   
   <div id="menuBox">
	   		<input class="menu_close" type="button"  value="X" />
            <c:if test="${empty menu}"> 
                  <span class="menuNone">?????????</span>
                  <span class="menuNone">????????????</span>
                  <span class="menuNone">????????????</span>
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

var $loginId = '${loginId}';
$('#delSub').click( function() {
	alert('????????? ?????? ???????????????????');	
	if ($loginId != '') {
		$('#delSubForm').submit();
	}else {
		alert('???????????? ????????? ???????????????.');
		location.href='./loginPage';
	}
});
$('#inSub').click( function() {
	alert('?????? ???????????????????');
	console.log($loginId);
	if ($loginId != '') {
		$('#inSubForm').submit();
		
	}else {
		alert('???????????? ????????? ???????????????.');
		location.href='./loginPage';
	}
});


function menuMove() {
   console.log('?????? ??????');
   $('#menuBox').animate({width:"toggle"},400);
}

$('.menu_close').click(function name() {
	$('#menuBox').animate({width:"toggle"},400);
});

















































</script>
</html>