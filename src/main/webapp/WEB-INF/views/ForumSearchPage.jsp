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
  	    
	    #ForumPage{
	   		width:1000px;
	    	position: relative;
	    	left: 0px;
	    	top: 100px;
	    }

    	#forumTd{
    		width: 1000px;

    	}
    	
    	.searchLi{
    		position: relative;
    		top:150px;
    		left: 0;
    	}
    	    
	    #id{
		    font-size: 14px;
		    line-height: 14px;
		    font-family: fontARD;
		    color: #909090;
		    position: relative;
		    width: 500px;
		   	top:-30px;
		   	left:-190px;
		   	text-decoration : none;
	   }
	   
	    #like{
	   		font-size: 13px;
	   		position: absolute;
	   		top:-30px;
	   		left:900px;
	   		width: 100px;
	   		color: black;
	   }
	   
	    #subject{
		   	display: block;
		    overflow: hidden;
		    position: absolute;
		    max-width: 500px;
			top:10px;
			left:100px;
		    font-size: 24px;
		    line-height: 1;
		    color: #222222;
		    font-weight: normal;
		    text-overflow: ellipsis;
		    white-space: nowrap;
	   }
	   
	   #cont{
		   	position: absolute;
		    top: 40px;
		    left: 110px;
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
	   #likecolor{
	   		color:red;
	   		position: relative;
	   		top: -19px;
		    left: 45px;
	   }
    	
    </style>
</head>
<body>
	<%@ include file="headerShs_login.jsp"%>
	
	<div>
		<div id="ForumPage">
			<h2>Search</h2>
	    	<h4>검색 결과 입니다.</h4>	
	    	<hr style="border:1px solid black; width:1000px; " >
	    	
		</div>	
		
	<!--  <button onclick="location.href='./ForumBoard'">돌아가기</button>
	<h1>검색결과입니다.</h1>-->

	<table>
		<tbody>
		
		<c:forEach var="item" items="${list}">
			<tr onclick="location.href='./csj_detail?board_num=${item.board_num}&mem_id=${item.mem_id}'" style="cursor: hand" class="searchLi">
				<td id="forumTd">
					<div id="id"><c:out value="${item.mem_id}"/>&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${item.board_date}"/></div>
					<div id="like">좋아요<div id="likecolor"><c:out value="${item.board_like}"/></div></div>
					<div id="subject"><c:out value="${item.board_subject }"/></div>
					<div id="cont"><c:out value="${item.board_cont}"/></div>
					<br/><br/><br/><br/><br/><br/><br/>
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