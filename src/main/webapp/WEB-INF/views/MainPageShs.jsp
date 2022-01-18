<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
   <link rel="stylesheet" type="text/css" href="resources/css/HS.css">
   <style>
   *{margin: 0 auto;}
   .container{
   		background: #ccc;
   		width: 1000px;
   		position: relative;
   		top:0;
   		left: 0px;
   }
   
   #mainBanner{
   		background: #23749e;
   		position: absolute;
   		width: 100%;
   		height: 370px;
   		top:82px;
   		left:0px;
   }
   #Category{
   		position: absolute;
   		top:400px;
   		left:130px;
   		font-size: 35px;
   		color: #848484;
   }
   
   .BigCate{
   margin-left:13px;
	cursor: pointer;
   }
   
   .BigCate:hover{
   		border-bottom:5px solid #ec5041;
   		color:black;
   }
   
   
   #CateBg{
   background: #f4f4f4;
   width: 100%;
   height:550px;
   position: absolute;
   top:455px;
   left: 0;
   }
  



/* 대카테고리 부분 */

.ContBox{
	position: relative;
	top:300px;
	left:0px;
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
    padding: 0;
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
	margin-top:30px;
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






   </style>
<body>
<%@ include file="headerShs_login.jsp"%>


	<div id="mainBanner"></div>
	<div id="CateBg"></div>
	



	
	




	<div class="container">
	

	<div id="Category">
		<span class="BigCate">라이프</span>
		<span class="BigCate">여행.맛집</span>
		<span class="BigCate">문화.연예</span>
		<span class="BigCate">IT</span>
		<span class="BigCate">스포츠</span>
		<span class="BigCate">시사</span>
	</div>

	
	<div class = "ContBox">
			<ul class="CateCont" >
							<li>
								<a href="#" target="_blank" class="conA">
									<div class="ContImg">
									<img alt="img01" src="resources/images_shs/ContDe00.png"/>
									</div>
									<div class="ContTxt">
										<div class="ContSmall">	
												<span style=""> 중카테</span>
												<span>좋아요</span>
												<span style="color: red">5</span>
											</dl>
										</div>
											<strong class="ContTitle">
												<span>MZ세대, 딩크족 알아보기알라라라 김치수제비 알리오올리오 까르보나라</span>
											</strong>
									</div>
									<div class="ContBlog">
										<div class="txt_id">Daily Note</div>
										<div class="txt_blog">by 마루밑 문지기</div>
									</div>
								</a>
							</li>
							
							<li>
								<a href="#" target="_blank" class="conA">
									<div class="ContImg">
									<img alt="img01" src="resources/images_shs/ContDe00.png"/>
									</div>
									<div class="ContTxt">
										<div class="ContSmall">	
												<span>중카테</span>
												<span>좋아요</span>
												<span style="color: red">5</span>
											</dl>
										</div>
											<strong class="ContTitle">
												<span>MZ세대, 딩크족 알아보기알라라라 김치수제비 알리오올리오 까르보나라</span>
											</strong>
									</div>
									<div class="ContBlog">
										<div class="txt_id">Daily Note</div>
										<div class="txt_blog">by 마루밑 문지기</div>
									</div>
								</a>
							</li>
							
							<li>
								<a href="#" target="_blank" class="conA">
									<div class="ContImg">
									<img alt="img01" src="resources/images_shs/ContDe00.png"/>
									</div>
									<div class="ContTxt">
										<div class="ContSmall">	
												<span> 중카테</span>
												<span>좋아요</span>
												<span style="color: red">5</span>
											</dl>
										</div>
											<strong class="ContTitle">
												<span>MZ세대, 딩크족 알아보기알라라라 김치수제비 알리오올리오 까르보나라</span>
											</strong>
									</div>
									<div class="ContBlog">
										<div class="txt_id">Daily Note</div>
										<div class="txt_blog">by 마루밑 문지기</div>
									</div>
								</a>
							</li>
				
				</ul>
		</div>

	</div>

	<div class="boardListShs">
			ggg
			
	</div>



</body>
<script>

      
      
      
      
      

</script>
</html>