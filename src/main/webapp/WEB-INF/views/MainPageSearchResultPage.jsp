<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Daily Share</title>
    <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <style>
    *{margin: 0 auto;}
    
    #FeedPageMain{
   		width:1000px;
    	position: relative;
    	left: 0px;
    	top: 100px;
    }
        .ForumInput{
    		 text-align: center; 
    
    	}

    	#forumTd{
   
    		width: 1000px;
    	}
    	
    	.searchLi{
    		position: relative;
    		top:150px;
    		left: 0;
    	
    	}
	    #midname{
		    font-size: 14px;
		    line-height: 14px;
		    font-family: fontARD;
		    color: #909090;
		    position: relative;
		    width: 100px;
		    height: 30px;
		   	top:-30px;
		   	left:-400px;
		   	text-decoration : none;

	   }
	    #date{
		    font-size: 14px;
		    line-height: 14px;
		    font-family: fontARD;
		    color: #909090;
		    position: relative;
		    width: 160px;
		   	top:-70px;
		   	left:-370px;
		   	text-decoration : none;

	   }
	   
	    #like{
	   		font-size: 13px;
	   		position: absolute;
	   		top:10px;
	   		left:52px;
	   		width: 100px;
	   		color: black;

	   }
	   
	   #likecolor{
	   		color:red;
	   		position: relative;
	   		width: 40px;
	   		top: -18px;
		    left: 15px;

	   }    	
	   
	    #subject{
		   	display: block;
		    overflow: hidden;
		    position: absolute;
		    max-width: 500px;
			top:-30px;
			left:250px;
		    font-size: 24px;
		    line-height: 1;
		    color: #222222;
		    font-weight: normal;
		    text-overflow: ellipsis;
		    white-space: nowrap;

	   }
	   
	   #cont{
		   	position: absolute;
		    top: 20px;
		    left: 250px;
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

	   #id{
		    font-size: 14px;
		    line-height: 14px;
		    font-family: fontARD;
		    position: relative;
		    width: 100px;
		   	top:50px;
		   	left:-200px;
		   	text-decoration : none;

	   }
    	#img{
	   		position: relative;
	   		width: 150px;
	   		top: -100px;
		    left: 410px;

	   }    	
    	
    </style>
</head>
<body>
	<%@ include file="headerShs_login.jsp"%>
	
	<div>
		<div id="FeedPageMain">
			<h2>Search</h2>
	    	<h4>검색 결과 입니다.</h4>	
	    	<hr style="border:1px solid black; width:1000px; " >
	    	
		</div>	
	
	
<!-- 	<button onclick="location.href='./'">돌아가기</button>
	<h1>검색결과입니다.</h1> -->

	<table>
		<tbody>
		<c:forEach var="item" items="${list}">
			<tr onclick="location.href='./csj_detail?board_num=${item.board_num}&mem_id=${item.mem_id}'" style="cursor: hand" class="searchLi">
				<td id="forumTd">
					<!--<div id="midname"><c:out value="${item.mid_name}"/></div>--><br/><br/>
					<div id="date"><c:out value="${item.board_date}"/></div>
					<div id="like">좋아요<div id="likecolor"><c:out value="${item.board_like}"/></div></div>
					<div id="subject"><c:out value="${item.board_subject }"/></div>
					<div id="cont"><c:out value="${item.board_cont}"/></div>
					<div id="id"><c:out value="${item.mem_id}"/></div>
					<div id="img"><img src="/postImageFolder/<c:out value="${item.board_thumFileName}"/>" width ="150px" height="150px" alt="boardImg" class = "thumb_g"></div>
					<hr style="width:1000px; border:1px solid #ececec">
					<br/><br/>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
<script>

</script>
</html>