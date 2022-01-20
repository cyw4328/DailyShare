<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
   <!-- <link rel="stylesheet" type="text/css" href="resources/css/HS.css"> -->
   <style>
   

      
   li{
   list-style:none;
   }
   *{margin: 0 auto;}
   .container{

   		width: 1000px;
   		position: relative;
   		top:0;
   		left: 0px;
   }
   
   .mainBanner{

   		position: absolute;
   		width: 100%;
   		height: 370px;
   		top:82px;
   		left:0px;
   }
   #Category{
   		position: absolute;
   		top:400px;
   		left:450px;
   		font-size: 35px;
   		color: #848484;
   }
   
   .BigCate{
   	margin : 0px 30px;
	cursor: pointer;
	display: inline-block;
   }
   
   .BigCate:hover{
   		border-bottom:5px solid #ec5041;
   		color:black;
   }
   
   
   #CateBg{
   background: #f4f4f4;
   width: 100%;
   height:600px;
   position: absolute;
   top:455px;
   left: 0;
   }
  



/* 대카테고리 부분 */

.ContBox{
	position: relative;
	top:300px;
	left:380px;
	margin: 0px;
   }
.CateCont li {
    width: auto;
    float: left;

    background: #fff;
	list-style:none;
	margin-right:15px; 
	height: 362px;
	
	transition: box-shadow .3s;
    transition-property: box-shadow;
    transition-duration: 0.3s;
    transition-timing-function: ease;
    transition-delay: 0s;

	
}

.CateCont li:hover {
	 box-shadow: 0 0 11px rgba(33,33,33,.2);
}


.ContImg{
	display: block;
    padding: 50px;
    border-bottom:1px soled #c4c4c4;

}


.CateCont{
	position:absolute; 
	top:200px; 
	left:0;
}


.conA{
	text-decoration: none;
	color: black;
}

.ContSmall{
	font-size: 13px;
	
}

.ContTxt{
	padding-left: 10px;
	margin-top:0px;
}

.ContTitle{
	font-size: 22px;
	overflow: hidden;
  	text-overflow: ellipsis;
	 display: -webkit-box;
 	 -webkit-line-clamp: 2;
  	-webkit-box-orient: vertical;
  	 width: 270px;
  	 margin-top:15px;
  	 margin-bottom: 15px;
}

.ContTitle:hover{
	text-decoration:underline;
}

.ContBlog{
padding-left:15px;
font-size: 13px;
}

.txt_blog{
	margin-top:5px;
	color:b5b5b5;
}



.boardListShs{
	background: skyblue;
	width: 1000px;
   	position: relative;
   	top:970px;
   	left: 0px;
   	height: 600px;

}


<!----------------------------------------------------------------------------------------------------------->

.list_Story{
	list-style:none;
}


.list_Story li {
    position: relative;
    width: 100%;
   list-style:none;
}

.boardImg{
	display: block;
	float: right;
	position: relative;
	width: 128px;
	height: 128px;
	padding: 0px;
	margin: 0 0 0 46px;
}


.section_list {
	border-top:1px solid #cecece;
   	width: 1000px;
   	position: relative;
   	top:968px;
   	left: 0px;
   	height: 200px;
   	
}

    .boardA{
   	position: relative;
   	top:25px;
   	left:0px;
   	text-decoration : none;
   	
   }
   
   .board_title{
   	display: block;
    overflow: hidden;
    position: absolute;
    max-width: 500px;
	top:0px;
	left:158px;
    font-size: 22px;
    line-height: 1;
    color: #000;
    font-weight: normal;
    text-overflow: ellipsis;
    white-space: nowrap;
   }
   
   .boardSTxt{
    position: absolute;
    top: 60px;
    left: 158px;
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
    
    .innerData{
    	font-size: 13px;
    	color: #909090;
    	border-bottom: 1px solid #909090;
    }
    
    .screenOut{
	    font-size: 13px;
	    line-height: 13px;
	    font-family: fontARD;
	    color: #909090;
	    position: absolute;
	    top:60px;
	    left: 0p;
	    width: 50px;
   }
   
   .boardBlogId{
   		position: absolute;
   		top:120px;
   		left:158px;
   		max-width: 300px;
   		text-overflow: ellipsis;
   		white-space: nowrap;
   		color: black;
   		font-size: 14px;
   }
   
   .boardLike{
   		font-size: 14px;
   		position: absolute;
   		top:100px;
   		left:0px;
   		width: 60px;
   		color: black;
   }
   
   .theBogi{
   	

   }

	.likeCnt{
		color: red;
	}   
	
	
	.MainSearch{
		position: absolute;
		top:300px;
		left:40%;
		border:0px;
	}
	#searchBtn{
	background-color: black;
	color: white;
	width: 90px;
	height: 40px;
	}
	
	#sogae{
	width: 370px;
	height: 150px;
	text-align: center;
	border-color: white;
	font-size: 25px;
	position: absolute;
	left: 650px;
	top: 120px;
	}

 
	
	
	
	
<!---------------------------------------------------------------------아래서치관련css-->	
	
	
   </style>
<body>
<%@ include file="headerShs_login.jsp"%>
	


	<div class="mainBanner">

 
	</div>
	
	<div id="CateBg"></div>
	



	
	
<div id="sogae"><h1>오늘을 공유하다 DAILY SHARE</h1></div>



	<div class="container"></div>
	

	

	<div id="Category">

	</div>

	
	
	
	<div class = "ContBox">
			<ul class="CateCont" >
			
				</ul>
		</div>
		
		<div class="MainSearch">
 		<form action="MainSearch" method="POST">
     		<table id="SearchInput">
     			<tr>
     				<td>
     					<select name="SearchScope">
     						<option selected="selected" value="All">전체</option>
     						<option value="User">작성자</option>
     						<option value="subCont">제목+내용</option>
     					</select>
     					</td>
     					<td>
     					<input type="text" name="ForumSearch"/>
     					</td>
     					<td>
     					<input type="submit" value="검색" id="searchBtn"/>
     				</td>
     			</tr>
     		</table>
     	</form>

	</div>

	<div class="section_list">
		 <ul class = "list_Story">
		 </ul>			
	</div>
				

	



					

</body>
<script>


MainBigCategoryCall();


function MainBigCategoryCall() {
		
	$.ajax({
		type:'POST',
		url:'MainPageBigCateGory',
		data:{}, // {}안에 아무것도 안넣으면 다보여줘라 라는 뜻
		dataType:'JSON',
		success:function(data) {
			console.log(data.list);
			/* window.location.href="./MyReviewControlPage"; */
			MainCategorylistDraw(data.list) 
		},
		error:function(e) {
			console.log(e);
		}
	});      
}
function MainCategorylistDraw(list) { // 배열안에 있는 내용을 표로 그리는 함수
	var content = '';
	
	for (var i = 0; i <list.length; i++) {
		console.log(list[i].main_name);
		content += '<span class="BigCate" onclick="MainNum('+list[i].main_num+')">'+list[i].main_name+'</span>';
		content += '<input type="hidden" value="'+list[i].main_num+'"/>'
		
	}
	$('#Category').empty();
	$('#Category').append(content); // 선택한 뒤에 내용을 추가하는 append
}

function MainNum(e) {
	console.log(e);
	$('.list_Story').empty();
	$('.CateCont').empty();
	$.ajax({
		type:'POST',
		url:'GoodBoardList',
		data:{"MainNum":e}, 
		dataType:'JSON',
		success:function(data) {
			console.log(data.list);
			ForumBoardList(data.list)
		},
		error:function(e) {
			console.log(e);
		}
	});      
	
	$.ajax({
		type:'POST',
		url:'BestBoardList',
		data:{"MainNum":e}, 
		dataType:'JSON',
		success:function(data) {
			
			console.log(data.Best);
			BestBoardList(data.Best);
		},
		error:function(e) {
			console.log(e);
		}
	});      
	
	
}

function ForumBoardList(list) {
	var content = '';
	
	
	 /* list.length */
	for (var i = 0; i < 10; i++) {
		
		var date = new Date(list[i].board_date);
			

			content += '<li>';
			content += '<a target="_blank" href="./csj_detail?board_num='+list[i].board_num+'&mem_id='+list[i].mem_id+'" class = "boardA">';
			content += '<div class ="boardImg">';
			content += '<img src="/photo/'+list[i].board_thumFileName+'" width ="100px" height="100px" alt="boardImg" class = "thumb_g">';
			content += '</div>';
			content += '<div class="boardCont">'+'<div class="boardCate">'+'<dl class="listData">'+'<dd>'+'<span class="innerData">'+list[i].mid_name+'</span>'+'</dd>'+'</dl>';
			content += '<dl class="listData">'+'<dd>'+'<span class="screenOut">'+date.getFullYear()+"-"
		      +("0"+(date.getMonth()+1)).slice(-2)+"-"
		      +("0" + date.getDate()).slice(-2)+" "
		      +'</span>'+'</dd>'+'</dl>';
			content += '<dl class="boardLike">'+'<span>'+"좋아요 "+list[i].board_like+'</span>'+' </dl>'+'</div>';
			content += '<strong class="board_title">'+'<span>'+list[i].board_subject+'</span>'+'</strong>';
			content += '<p class="boardSTxt">'+list[i].board_cont+'</p>'+'</div>';
			content += '<div class="boardBlogId">'+'<span>'+list[i].mem_id+'</span>'+'</div>';
			content += '</a>'+'</li>'+'</br>'+'</br>'+'</br>'+'</br>'+'</br>'+'</br>'+'</br>'+'</br>'+'<hr>';

						
	}
	
	$('.list_Story').append(content);
};


function BestBoardList(Best) {
	var content = '';
	
	
	 /* list.length */
	for (var i = 0; i < 3; i++) {
		
			

			content += '<li>';
			content += '<a target="_blank" href="./csj_detail?board_num='+Best[i].board_num+'&mem_id='+Best[i].mem_id+'" class = "conA">';
			content += '<div class="ContImg">';
			content += '<img alt="img01" src="/photo/'+Best[i].board_thumFileName+'width ="150px" height="150px"">';
			content += '</div>';
			content += '<div class="ContTxt">'+'<div class="ContSmall">'+'<span>'+Best[i].mid_name+'</span>'+'<span>'+' &nbsp; &nbsp;'+"좋아요"+'</span>'+'&nbsp;'+'<span style="color:red">'+Best[i].board_like+'</span>'+'</div>'+'</div>';
			content += '<strong class="ContTitle">'+'<span>'+'&nbsp;'+Best[i].board_subject+'</span>'+'</strong>'+'</div>';
			content += '<div class="ContBlog">'+'<div class="txt_id">'+Best[i].mem_id+'</div>'+'</div>'+'</a>';
			content += '</li>';

						
	}

	$('.CateCont').append(content);
};






</script>
</html>