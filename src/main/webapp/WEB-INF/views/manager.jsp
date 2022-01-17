<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>  
        <script src="resources/js/jquery.twbsPagination.js"></script>
        <style type="text/css">
            
            /*드래그 금지*/
            .no-drag {-ms-user-select: none; -moz-user-select: -moz-none; -webkit-user-select: none; -khtml-user-select: none; user-select:none;} 

		    #left{
		    	position :absolute;
                border: 1px solid black;
                width: 240px;
				height: 80px;
                margin-top: 70px; 
                margin-left: 160px;
                text-align: center;
                line-height: 80px; 
                text-align: left;
                padding-left: 10px;
       
		    }
		    
		    #write{
		    	position :absolute;
                border: 1px solid black;
                width: 250px;
				height: 40px;
                margin-top: 170px; 
                margin-left: 160px;
                text-align: center;
                line-height: 35px; 
                background: black;
                color: white; 
                cursor:pointer;
		    }
		    
		    #tab1{
		    	position :absolute;
                border: 1px solid black;
                width: 240px;
				height: 40px;
                margin-top: 230px; 
                margin-left: 160px;
                text-align: center;
                line-height: 35px; 
                color: black; 
                text-align: left;
                padding-left: 10px;
                cursor:pointer;
                color:red;
		    }
		    #tab2{
		    	position :absolute;
                border: 1px solid black;
                width: 240px;
				height: 40px;
                margin-top: 272px; 
                margin-left: 160px;
                text-align: center;
                line-height: 35px; 
                color: black; 
                text-align: left;
                padding-left: 10px;
                cursor:pointer;
		    }
		    #tab3{
		    	position :absolute;
                border: 1px solid black;
                width: 240px;
				height: 40px;
                margin-top: 314px; 
                margin-left: 160px;
                text-align: center;
                line-height: 35px; 
                color: black; 
                text-align: left;
                padding-left: 10px;
                cursor:pointer;
		    }
		    #tab4{
		    	position :absolute;
                border: 1px solid black;
                width: 240px;
				height: 40px;
                margin-top: 355px; 
                margin-left: 160px;
                text-align: center;
                line-height: 35px; 
                color: black; 
                text-align: left;
                padding-left: 10px;
                cursor:pointer;
		    }
		    #tab5{
		    	position :absolute;
                border: 1px solid black;
                width: 240px;
				height: 40px;
                margin-top: 396px; 
                margin-left: 160px;
                text-align: center;
                line-height: 35px; 
                color: black; 
                text-align: left;
                padding-left: 10px;
                cursor:pointer;
		    }
		    #title{
		    	position :absolute;
                margin-top: 70px; 
                margin-left: 450px;
                text-align: center;
                line-height: 35px; 
                color: black; 
                text-align: left;
                padding-left: 10px;
                font-size: 20px;
		    }
		    #hr{
		    	position :absolute;
		    	width: 900px;
                margin-top: 110px; 
                margin-left: 450px;
                text-align: center;
                line-height: 35px; 
                color: black; 
                text-align: left;
                padding-left: 10px;
		    }
		    #select{
		    	position :absolute;
                margin-top: 125px; 
                margin-left: 1050px;
                text-align: center;
                line-height: 35px; 
                color: black; 
                text-align: left;
                padding-left: 10px;
		    }
		    
		    #ListTable{
		    	position :absolute;
		    	width: 900px;
				height: 400px;
                margin-top: 180px; 
                margin-left: 450px;
                text-align: center;
                line-height: 35px; 
                color: black; 
                text-align: center;
                padding-left: 10px;
		    }
		    
		    table, th, td{
				border : 1px solid black;
				border-collapse : collapse;
				padding : 5px 10px;
				text-align: center;
			}
			
			table{
				width : 900px;
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
		<div id="hr"><hr></div>
		<div id="select">
		<form action="search_mem" method="GET" name="search_mem">
			<select name="SearchType" id="type">
				<option selected value="all">전체</option>
				<option value="mem_id">아이디</option>
				<option value="mem_name">이름</option>
			</select>
			<input type="text" name="keyword">
			<input type="button" id="btnSearch" onclick="MemSearchList()" value="검색">
        </form>
		</div>
		<div id="ListTable">
			<table>
				<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>가입날짜</th>
					<th>회원탈퇴여부</th>
					<th>회원제재상태</th>
				</tr>
				</thead>
				<tbody id="list"></tbody>
				<tr>
					<td colspan="7" id="paging">
						<div class="container">                           
			               <nav aria-label="Page navigation" style="text-align:center">
			                  <ul class="pagination" id="pagination"></ul>
			               </nav>               
			            </div>
					</td>
				</tr>
			</table>
		</div>
		
		
    </body>

    <script>

    
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
	    	const title = document.getElementById('title');
	    	title.innerText = '회원목록'
	    	$("#select").show();
	    	$("#search").show();
	    	$("#ListTable").show();	
	    	location.href='./MemberList'
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
	    	const title = document.getElementById('title');
	    	title.innerText = '신고목록'
	    	$("#select").hide();
    		$("#search").hide();
    		$("#ListTable").hide();
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
	    	const title = document.getElementById('title');
	    	title.innerText = '제재목록'
	    	$("#select").hide();
    		$("#search").hide();
    		$("#ListTable").hide();
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
	    	const title = document.getElementById('title');
	    	title.innerText = '관리자목록'
	    	$("#select").hide();
    		$("#search").hide();
    		$("#ListTable").hide();
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
	    	const title = document.getElementById('title');
	    	title.innerText = '카테고리목록'
	    	$("#select").hide();
    		$("#search").hide();
    		$("#ListTable").hide();
	    });
        
	    
	    function MemSearchList(){
			$.ajax({
				type: 'GET',
				url : 'MemSearchList',
				data : $("form[name=search_mem]").serialize(),
				success : function(result){
					console.log("확인");
					//테이블 초기화
					$('#list').empty();
					if(result.length>=1){
						result.forEach(function(item){
								str += '<tr>';
								str += '<td>'+item.mem_id+'</td>';
								str += '<td>'+item.mem_name+'</td>';
								str += '<td>'+item.mem_email+'</td>';
								str += '<td>'+item.mem_phone+'</td>';
								str += '<td>'+item.mem_date+'</td>';
								str += '<td>'+item.mem_out+'</td>';
								str += '<td>'+item.mem_san+'</td>';
								str += '</tr>';
							$('#list').append(str);
		        		})				 
					}
				}
			})
		}
		
		var currPage = 1;
		var totalPage =2;
		
		listCall(currPage,10);
		
		function more(){
			currPage++;
			console.log('currPage',currPage);
			if(currPage > totalPage){
				$('button').attr('disabled',true);	
			}else{
				listCall(currPage,10);
			}
		}
		
		function listCall(page, cnt){
			
			$.ajax({
				type:'GET',
				url:'list',
				data:{'page':page,'cnt':cnt},
				dataType:'JSON',
				success: function(data){
					console.log(data);
					totalPage = data.pages;
					listDraw(data.list);
					
					$('#pagination').twbsPagination({
						startPage:currPage,//현재 페이지
						totalPages:totalPage,//만들수 있는 총 페이지 수
						visiblePages:5,//[1][2][3]...이걸 몇개 까지 보여줄 것인지
						onPageClick:function(evt,page){//해당 페이지 번호를 클릭했을때 일어날 일들
							console.log(evt);
							console.log(page);
							listCall(page,10);
						}
					});

				},
				error:function(e){
					console.log(e);
				}
			});
			
		function listDraw(list){//배열 안에 있는 내용을 표로 그리는 함수
			var content ='';
			list.forEach(function(item, idx){
				content += '<tr>';
				content += '<td>'+item.mem_id+'</td>';
				content += '<td>'+item.mem_name+'</td>';
				content += '<td>'+item.mem_email+'</td>';
				content += '<td>'+item.mem_phone+'</td>';
				content += '<td>'+item.mem_date+'</td>';
				content += '<td>'+item.mem_out+'</td>';
				content += '<td>'+item.mem_san+'</td>';
				content += '</tr>';	
			});
			$("#list").empty();
			$("#list").append(content);
		
			}
		}
    </script>

</html>