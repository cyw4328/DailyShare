<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>  
        <script src="resources/js_csj/jquery.twbsPagination.js"></script>
        <link rel="icon" href="./icon.png">
        <style type="text/css">
            
            /*드래그 금지*/
            .no-drag {-ms-user-select: none; -moz-user-select: -moz-none; -webkit-user-select: none; -khtml-user-select: none; user-select:none;} 

		    #left{
		    	position :static;
                border: 1px solid black;
                width: 240px;
				height: 80px;
                margin-top: 70px; 
                margin-left: 160px;
                line-height: 80px; 
                text-align: left;
                padding-left: 10px;     
		    }		    
		    #write{
		    	position :relative;
                border: 1px solid black;
                width: 250px;
				height: 40px;
                margin-top: 10px; 
                margin-left: 160px;
                text-align: center;
                line-height: 35px; 
                background: black;
                color: white; 
                cursor:pointer;
		    }	    
		    #tab1{
		    	position :relative;
                border: 1px solid black;
                width: 240px;
				height: 40px;
                margin-top: 10px; 
                margin-left: 160px;
                line-height: 35px; 
                text-align: left;
                padding-left: 10px;
                cursor:pointer;
                color:red;
		    }
		    #tab2,#tab3,#tab4,#tab5{
		    	position :relative;
                border: 1px solid black;
                width: 240px;
				height: 40px;
                margin-left: 160px;
                line-height: 35px; 
                text-align: left;
                padding-left: 10px;
                cursor:pointer;
		    }		    
		    #title{
		    	position :static;
                margin-top: -360px; 
                margin-left: 450px;
                text-align: left;
                font-size: 20px;
                padding-left: 10px;
		    }
		    #dec{
		    	position :absolute;
		    	margin-top: -20px; 
                margin-left: 1000px;
                font-size: 16px;
		    }
		    #hr{
		    	position :relative;
		    	width: 900px;
                margin-top: 10px; 
                margin-left: 450px;
		    }
		    #memS{
		    	position :relative;
                margin-top: 15px; 
                margin-left: 1060px;
		    }  
		    #decS{
		    	position :relative;
                margin-top: 15px; 
                margin-left: 1020px;
		    }    
		    #decM{
		    	position :relative;
                margin-top: 25px; 
                margin-left: 700px;
                
		    }
		    #ListTable{
		    	position :relative;
                margin-top: 20px; 
                margin-left: 280px;
		    }
		    #DecTable1{
		    	position :relative;
		    	margin-top: 20px; 
                margin-left: 280px;
		    }	  
		    #DecTable2{
		    	position :relative;
		    	margin-top: 20px; 
                margin-left: 280px;
		    }	   	 
		    #DecTable3{
		    	position :relative;
		    	margin-top: 20px; 
                margin-left: 280px;
		    }	   	  	    
		    table, th, td{
				border : 1px solid black;
				border-collapse : collapse;
				padding : 8px;
				text-align: center;
			}
			table{
				width: 900px;
			}
			.clicked {
	        	box-shadow: inset 0 -6px 0 gray;
	        }
	        #decMSearch{
	        	width:60px;
		    	height:40px; 
		    	font-size:16px; 
		    	border-radius: 5px / 5px;
		    	background:black;
		    	color: white; 
		    	cursor:pointer;
	        }
        </style>
    </head>
    <body class="no-drag">
		<%@ include file="headerShs_login.jsp"%>
		<div id="left">관리자 블로그</div>
		<div id="write">게시글 쓰기</div>
		<div id="tab1">회원목록</div>
		<div id="tab2">신고목록</div>
		<div id="tab3">재재목록</div>
		<div id="tab4">관리자목록</div>
		<div id="tab5">카테고리목록</div>
		<div id="title">회원목록</div>
		<div id="dec">
        	<a target="_blank" id="a1" style="box-shadow: inset 0 -6px 0 gray; cursor:pointer;">접수된신고</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        	<a target="_blank" id="a2" style="cursor:pointer;">처리된신고</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        	<a target="_blank" id="a3" style="cursor:pointer;">항목관리</a>
		</div>
		<div id="hr"><hr></div>
		<div id="memS">
		<form action="search_mem" method="GET" name="search_mem">
			<select name="SearchType" id="type">
				<option selected value="all">전체</option>
				<option value="mem_id">아이디</option>
				<option value="mem_name">이름</option>
			</select>
			<input type="text" name="keyword">
			<input type="button" id="memSearch" onclick="getSearchList()" value="검색">
        </form>
		</div>
		<div id="decS">
		<form action="search_dec" method="GET" name="search_dec">
			<select name="SearchType" id="type">
				<option selected value="all">전체</option>
				<option value="mem_id">신고자아이디</option>
				<option value="dec_target">신고된아이디</option>
				<option value="dec_name">신고항목</option>
			</select>
			<input type="text" name="keyword">
			<input type="button" id="decSearch" onclick="getSearchList()" value="검색">
        </form>
		</div>
		<div id="decM">
		<form action="search_decM" method="GET" name="search_decM">
			<input type="text" placeholder="새로 등록할 항목" name="keyword" style="width : 300px; font-size:16px; height:30px; border-radius: 5px / 5px;">
			<input type="button" id="decMSearch" onclick="getSearchList()" value="등록">
        </form>
		</div>
		<div id="ListTable">
			<table>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>가입날짜</th>
					<th>회원탈퇴여부</th>
					<th>회원제재상태</th>
				</tr>
				<c:if test="${MemberList eq null || size == 0}">
				<tr><td colspan="5">등록된 글이 없습니다.</td></tr>
				</c:if>
				<c:forEach items="${MemberList}" var="members">
				<tr>
					<td>${members.mem_id}</td>
					<td>${members.mem_name}</td>
					<td>${members.mem_email}</td>
					<td>${members.mem_phone}</td>
					<td>${members.mem_date}</td>
					<td>${members.mem_out}</td>
					<td>${members.mem_san}</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		
		<div id="DecTable1">
			<table>
				<tr>
					<th>신고번호</th>
					<th>신고자아이디</th>
					<th>신고된아이디</th>
					<th>신고항목</th>
					<th>신고한날짜</th>
					<th>신고내용</th>
				</tr>
				<c:if test="${DecList eq null || size == 0}">
				<tr><td colspan="6">등록된 항목이 없습니다.</td></tr>
				</c:if>
				<c:forEach items="${DecList1}" var="dec1">
				<tr>
					<td>${dec1.dec_num}</td>
					<td>${dec1.mem_id}</td>
					<td>${dec1.target_id}</td>
					<td>${dec1.dec_name}</td>
					<td>${dec1.dec_date}</td>
					<td>${dec1.dec_cont}</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		
		<div id="DecTable2">
			<table>
				<tr>
					<th>신고번호</th>
					<th>신고자아이디</th>
					<th>신고된아이디</th>
					<th>신고항목</th>
					<th>처리한날짜</th>
					<th>처리내용</th>
					<th>처리자</th>
				</tr>
				<c:if test="${DecList eq null || size == 0}">
				<tr><td colspan="7">등록된 항목이 없습니다.</td></tr>
				</c:if>
				<c:forEach items="${DecList2}" var="dec2">
				<tr>
					<td>${dec2.dec_num}</td>
					<td>${dec2.mem_id}</td>
					<td>${dec21.target_id}</td>
					<td>${dec2.dec_name}</td>
					<td>${dec2.sol_date}</td>
					<td>${dec2.sol_state}</td>
					<td>${dec2.sol_admin}</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		
		<div id="DecTable3">
			<table>
				<tr>
					<th>코드</th>
					<th>신고항목</th>
					<th>사용여부</th>
					<th></th>
				</tr>
				<c:if test="${DecList eq null || size == 0}">
				<tr><td colspan="4">등록된 항목이 없습니다.</td></tr>
				</c:if>
				<c:forEach items="${DecList3}" var="dec3">
				<tr>
					<td>${dec3.dec_code}</td>
					<td>${dec3.dec_name}</td>
					<td>${dec3.dec_blind}</td>
					<td>${dec3.dec_update}</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		
		
    </body>

    <script>
    	const title = document.getElementById('title');
    	var ahr = document.getElementsByTagName('a');
    	$("#dec").hide();
    	$("#decS").hide();
    	$("#decM").hide();
    	$("#DecTable").hide();
	    $('#tab1').click(function(){
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
	    	title.innerText = '회원목록'
	    	$("#memS").show();
	    	$("#ListTable").show();	
	    	$("#dec").hide();
	    	$("#decS").hide();
	    	$("#decM").hide();
	    	$("#DecTable1").hide();
	    	$("#DecTable2").hide();
	    	$("#DecTable3").hide();
	    });
	    
	    $('#tab2').click(function(){
	    	$('#tab1').css({
                'color':'black'
            });
	    	$('#tab2').css({
                'color':'red'
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
	    	title.innerText = '신고목록'
	    	$("#dec").show();
	    	$("#decS").show();
	    	$("#memS").hide();
	    	$("#decM").hide();
    		$("#ListTable").hide();
    		$("#DecTable1").show();
    		$("#DecTable2").hide();
    		$("#DecTable3").hide();
    		$('#a1').click();
	    });
	    
	    $('#tab3').click(function(){
	    	$('#tab1').css({
                'color':'black'
            });
	    	$('#tab2').css({
                'color':'black'
            });
	    	$('#tab3').css({
                'color':'red'
            });
	    	$('#tab4').css({
                'color':'black'
            });
	    	$('#tab5').css({
                'color':'black'
            });
	    	title.innerText = '제재목록'
	    	$("#memS").hide();
    		$("#ListTable").hide();
    		$("#DecTable1").hide();
    		$("#DecTable2").hide();
    		$("#DecTable3").hide();
    		$("#dec").hide();
    		$("#decS").hide();
    		$("#decM").hide();
	    });
	    
	    $('#tab4').click(function(){
	    	$('#tab1').css({
                'color':'black'
            });
	    	$('#tab2').css({
                'color':'black'
            });
	    	$('#tab3').css({
                'color':'black'
            });
	    	$('#tab4').css({
                'color':'red'
            });
	    	$('#tab5').css({
                'color':'black'
            });
	    	title.innerText = '관리자목록'
	    	$("#memS").hide();
    		$("#ListTable").hide();
    		$("#DecTable1").hide();
    		$("#DecTable2").hide();
    		$("#DecTable3").hide();
    		$("#dec").hide();
    		$("#decS").hide();
    		$("#decM").hide();
	    });
	    
	    $('#tab5').click(function(){
	    	$('#tab1').css({
                'color':'black'
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
                'color':'red'
            });
	    	title.innerText = '카테고리목록'
	    	$("#memS").hide();
    		$("#ListTable").hide();
    		$("#DecTable1").hide();
    		$("#DecTable2").hide();
    		$("#DecTable3").hide();
    		$("#dec").hide();
    		$("#decS").hide();
    		$("#decM").hide();
	    });
        
        $('#a1').click(function(){
        	document.getElementById("a1").style = "box-shadow: inset 0 -6px 0 gray; cursor:pointer;";
        	document.getElementById("a2").style = "cursor:pointer;";
        	document.getElementById("a3").style = "cursor:pointer;";
	    	$("#decS").show();
	    	$("#decM").hide();
	    	$("#DecTable1").show();
	    	$("#DecTable2").hide();
	    	$("#DecTable3").hide();
	    	
        });
        
		$('#a2').click(function(){
			document.getElementById("a1").style = "cursor:pointer;";
        	document.getElementById("a2").style = "box-shadow: inset 0 -6px 0 gray; cursor:pointer;";
        	document.getElementById("a3").style = "cursor:pointer;";
	    	$("#decS").show();
	    	$("#decM").hide();
	    	$("#DecTable1").hide();
	    	$("#DecTable2").show();
	    	$("#DecTable3").hide();
        });
        
		$('#a3').click(function(){
			document.getElementById("a1").style = "cursor:pointer;";
        	document.getElementById("a2").style = "cursor:pointer;";
        	document.getElementById("a3").style = "box-shadow: inset 0 -6px 0 gray; cursor:pointer;";
    		$("#decS").hide();
    		$("#decM").show();
    		$("#DecTable1").hide();
	    	$("#DecTable2").hide();
	    	$("#DecTable3").show();
		});
        
    </script>

</html>