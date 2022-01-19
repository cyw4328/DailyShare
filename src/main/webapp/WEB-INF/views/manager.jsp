<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
        <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
		<link rel="stylesheet" href="resources/css/common.css" type="text/css">
		<script src="resources/js/jquery.twbsPagination.js"></script>
        
        <link rel="icon" href="./icon.png">
        <style type="text/css">
            
            /*드래그 금지*/
            .no-drag {-ms-user-select: none; -moz-user-select: -moz-none; -webkit-user-select: none; -khtml-user-select: none; user-select:none;} 

		    #left{
		    	position :static;
                border: 1px solid black;
                width: 250px;
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
				height: 50px;
                margin-top: 10px; 
                margin-left: 160px;
                text-align: center;
                line-height: 50px; 
                background: black;
                color: white; 
                cursor:pointer;
		    }	    
		    #tab1{
		    	position :relative;
                border: 1px solid black;
                width: 250px;
				height: 50px;
                margin-top: 10px; 
                margin-left: 160px;
                line-height: 50px; 
                text-align: left;
                padding-left: 10px;
                cursor:pointer;
                color:red;
		    }
		    #tab2,#tab3,#tab4,#tab5{
		    	position :relative;
                border: 1px solid black;
                width: 250px;
				height: 50px;
                margin-left: 160px;
                line-height: 50px; 
                text-align: left;
                padding-left: 10px;
                cursor:pointer;
		    }		    
		    #title{
		    	position :static;
                margin-top: -400px; 
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
                margin-top: -20px; 
                margin-left: 450px;
                height: 5px;
 			    background-color: gray;
		    }
		    #memS{
		    	position :relative;
                margin-top: 15px; 
                margin-left: 1050px;
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
		    #adm{
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
		    #admin{
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
	        #decMEnr{
	        	width:60px;
		    	height:40px; 
		    	font-size:16px; 
		    	border-radius: 5px / 5px;
		    	background:black;
		    	color: white; 
		    	cursor:pointer;
	        }
	        #admMEnr{
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
        	<a target="_blank" id="a1" style="color: black; box-shadow: inset 0 -6px 0 gray; cursor:pointer;">접수된신고</a>
        	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        	<a target="_blank" id="a2" style="color: black; cursor:pointer;">처리된신고</a>
        	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        	<a target="_blank" id="a3" style="color: black; cursor:pointer;">항목관리</a>
		</div>
		<div id="hr"><hr/></div>
		
		<!-- 검색 select 박스 추가 -->
		<div  id="memS">
			<form action="search_mem" method="GET" name="search_mem">
				<select name="SearchType" id="type" style="height: 25px;">
					<option selected value="all">전체</option>
					<option value="mem_id">아이디</option>
					<option value="mem_name">이름</option>
				</select>
				<input type="text" name="keyword">
				<input type="button" id="btnSearch" onclick="SearchList()" value="검색">
			</form>
		</div>
		
		<div id="decS">
		<form action="search_dec" method="GET" name="search_dec">
			<select name="SearchType" style="height:25px;" id="type">
				<option selected value="all">전체</option>
				<option value="mem_id">신고자아이디</option>
				<option value="dec_target">신고된아이디</option>
				<option value="dec_name">신고항목</option>
			</select>
			<input type="text" name="deckeyword">
			<input type="button" id="decSearch" onclick="decSearchList()" value="검색">
        </form>
		</div>
		<div id="decM">
		<form action="enr_decM" method="GET" name="enr_decM">
			<input type="text" placeholder="새로 등록할 항목" name="decMkeyword" style="width : 300px; font-size:16px; height:30px;  border-radius: 5px / 5px;">
			<input type="button" id="decMEnr" onclick="decMSearchList()" value="등록">
        </form>
		</div>
		<div id="adm">
		<form action="enr_adm" method="GET" name="enr_adm">
			<input type="text" placeholder="새로 등록할 관리자아이디" name="admkeyword" style="width : 300px; font-size:16px; height:25px;  border-radius: 5px / 5px;">
      		<input type="button" id="admMEnr" onclick="admSearchList()" value="등록">
      		<div  id="alert-success-adm"  style="color: green; font-size:13px;">관리자 등록이 가능한 아이디 입니다.</div>
      		<div  id="alert-danger-adm"  style="color: red; font-size:13px;">회원정보를 찾을 수 없습니다.</div>
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
				</tr>
			</thead>
			<tbody id="memlist"></tbody>
			<tr>
				<td colspan="5" id="paging" >
					<div class="container" style="width:700px;">                           
		               <nav aria-label="Page navigation" style="text-align:center;">
		                  <ul class="pagination" id="pagination"></ul>
		               </nav>               
		            </div>
				</td>
			</tr>		
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
				<tbody id="declist1"></tbody>
				<tr>
					<td colspan="6" id="paging" >
						<div class="container" style="width:700px;">                           
			               <nav aria-label="Page navigation" style="text-align:center;">
			                  <ul class="pagination" id="pagination"></ul>
			               </nav>               
			            </div>
					</td>
				</tr>
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
				<tbody id="declist2"></tbody>
				<tr>
					<td colspan="7" id="paging" >
						<div class="container" style="width:700px;">                           
			               <nav aria-label="Page navigation" style="text-align:center;">
			                  <ul class="pagination" id="pagination"></ul>
			               </nav>               
			            </div>
					</td>
				</tr>
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
				<tbody id="declist3"></tbody>
				<tr>
					<td colspan="4" id="paging" >
						<div class="container" style="width:700px;">                           
			               <nav aria-label="Page navigation" style="text-align:center;">
			                  <ul class="pagination" id="pagination"></ul>
			               </nav>               
			            </div>
					</td>
				</tr>
			</table>
		</div>
		
		<div id="admin">
			<table>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>관리자삭제</th>
				</tr>
				<c:if test="${admin eq null || size == 0}">
				<tr><td colspan="5">관리자 정보가 없습니다.</td></tr>
				</c:if>
				<c:forEach items="${admin}" var="admin">
				<tr>
					<td>${admin.mem_id}</td>
					<td>${admin.mem_name}</td>
					<td>${admin.mem_email}</td>
					<td>${admin.mem_phone}</td>
					<td>${admin.adm_auth}</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		
    </body>

    <script>

  //검색 ajax
	function SearchList(){
		$.ajax({
			type: 'GET',
			url : 'SearchList',
			data : $("form[name=search_mem]").serialize(),
			success : function(result){
				console.log("확인");
				//테이블 초기화
				$('#memlist').empty();
				if(result.length>=1){
					var str = '';
					result.forEach(function(item){
						var date = new Date(item.mem_date);
						str='<tr>'
						str += "<td>"+item.mem_id+"</td>";
						str+="<td>"+item.mem_name+"</td>";
						str+="<td>"+item.mem_email+"</td>";
						str+="<td>"+item.mem_phone+"</td>";
						str+="<td>"+date.getFullYear()+"-"+("0"+(date.getMonth()+1)).slice(-2)+"-"+("0" + date.getDate()).slice(-2)+"</td>";
						str+="</tr>";
						$('#memlist').append(str);
						
		
	        		})				 
				}
			}
		})
	};
    
    
	var currPage = 1;
	var totalPage = 2;
	
	listCall(currPage,5);
	
	function more(){ //다음 페이지로 넘겼을 때
		currPage++;
		console.log('currPage',currPage);
		if(currPage>totalPage){
			$('button').attr('disabled',true);
		}else{
			listCall(currPage, 5);			
		}
	}
	
	function listCall(page, cnt){				
		
		$.ajax({
			type:'GET',
			url:'memlist',
			data:{'page':page,'cnt':cnt},
			dataTyps:'JSON',
			success: function(data){
				console.log(data);
				totalPage = data.pages;
				listDraw(data.list);
				
				$('#pagination').twbsPagination({
					startPage: currPage,//현재 페이지
					totalPages: totalPage,//만들수 있는 총 페이지 수
					visiblePages:5, //[1][2][3]... 이걸 몇개 까지 보여줄 것인지
					onPageClick:function(evt,page){//해당 페이지 번호를 클릭했을때 일어날 일들
						console.log(evt); //현재 일어나는 클릭 이벤트 관련 정보들
						console.log(page);//몇 페이지를 클릭 했는지에 대한 정보
						listCall(page, 5);
					}
				});
								
			},
			error:function(e){
				console.log(e);
			}
		});		
	}
	
	
	function listDraw(list){ //리스트를 불러올때 하단 생성
		var content = '';	
		list.forEach(function(item, mem_id){
			var date = new Date(item.mem_date);
			content += '<tr>';
			content += '<td>'+item.mem_id+'</td>';
			content += '<td>'+item.mem_name+'</td>';
			content += '<td>'+item.mem_email+'</td>';
			content += '<td>'+item.mem_phone+'</td>';
			content += '<td>'+date.getFullYear()+"-"+("0"+(date.getMonth()+1)).slice(-2)+"-"+("0" + date.getDate()).slice(-2)+'</td>';
			content += '</tr>';	
		});
		//console.log(content);
		$('#memlist').empty();
		$('#memlist').append(content);		
	}
 

	
////////////////////////////////////////////////////////////////////////////////////////////////	
	/*
	//검색 ajax
	function SearchList(){
		$.ajax({
			type: 'GET',
			url : 'SearchList1',
			data : $("form[name=search_dec]").serialize(),
			success : function(result){
				console.log("확인");
				//테이블 초기화
				$('#declist').empty();
				if(result.length>=1){
					var str = '';
					result.forEach(function(item){
						var date = new Date(item.dec_date);
						str='<tr>'
						str += "<td>"+item.dec_num+"</td>";
						str+="<td>"+item.mem_id+"</td>";
						str+="<td>"+item.target_id+"</td>";
						str+="<td>"+item.dec_name+"</td>";
						str+="<td>"+date.getFullYear()+"-"+("0"+(date.getMonth()+1)).slice(-2)+"-"+("0" + date.getDate()).slice(-2)+"</td>";
						str+="<td>"+item.dec_cont+"</td>";
						str+="</tr>";
						$('#declist1').append(str);
						
		
	        		})				 
				}
			}
		})
	};
    */
    /*
	var currPage = 1;
	var totalPage = 2;
	
	listCall(currPage,5);
	
	function more(){ //다음 페이지로 넘겼을 때
		currPage++;
		console.log('currPage',currPage);
		if(currPage>totalPage){
			$('button').attr('disabled',true);
		}else{
			listCall(currPage, 5);			
		}
	}
	
	function listCall(page, cnt){				
		
		$.ajax({
			type:'GET',
			url:'declist1',
			data:{'page':page,'cnt':cnt},
			dataTyps:'JSON',
			success: function(data){
				console.log(data);
				totalPage = data.pages;
				listDraw(data.list);
				
				$('#pagination').twbsPagination({
					startPage: currPage,//현재 페이지
					totalPages: totalPage,//만들수 있는 총 페이지 수
					visiblePages:5, //[1][2][3]... 이걸 몇개 까지 보여줄 것인지
					onPageClick:function(evt,page){//해당 페이지 번호를 클릭했을때 일어날 일들
						console.log(evt); //현재 일어나는 클릭 이벤트 관련 정보들
						console.log(page);//몇 페이지를 클릭 했는지에 대한 정보
						listCall(page, 5);
					}
				});
								
			},
			error:function(e){
				console.log(e);
			}
		});		
	}
	
	
	function listDraw(list){ //리스트를 불러올때 하단 생성
		var content = '';	
		list.forEach(function(item, mem_id){
			var date = new Date(item.mem_date);
				content='<tr>'
				content+= "<td>"+item.dec_num+"</td>";
				content+="<td>"+item.mem_id+"</td>";
				content+="<td>"+item.target_id+"</td>";
				content+="<td>"+item.dec_name+"</td>";
				content+="<td>"+date.getFullYear()+"-"+("0"+(date.getMonth()+1)).slice(-2)+"-"+("0" + date.getDate()).slice(-2)+"</td>";
				content+="<td>"+item.dec_cont+"</td>";
				content+="</tr>";	
		});
		//console.log(content);
		$('#declist1').empty();
		$('#declist1').append(content);		
	}
	*/
////////////////////////////////////////////////////////////////////////////////////////////////	
	/*
	//검색 ajax
	function SearchList(){
		$.ajax({
			type: 'GET',
			url : 'SearchList2',
			data : $("form[name=search_dec]").serialize(),
			success : function(result){
				console.log("확인");
				//테이블 초기화
				$('#declist').empty();
				if(result.length>=1){
					var str = '';
					result.forEach(function(item){
						var date = new Date(item.sol_date);
						str='<tr>'
						str += "<td>"+item.dec_num+"</td>";
						str+="<td>"+item.mem_id+"</td>";
						str+="<td>"+item.target_id+"</td>";
						str+="<td>"+item.dec_name+"</td>";
						str+="<td>"+date.getFullYear()+"-"+("0"+(date.getMonth()+1)).slice(-2)+"-"+("0" + date.getDate()).slice(-2)+"</td>";
						str+="<td>"+item.sol_state+"</td>";
						str+="<td>"+item.sol_admin+"</td>";
						str+="</tr>";
						$('#declist2').append(str);

		
	        		})				 
				}
			}
		})
	};
    
    
	var currPage = 1;
	var totalPage = 2;
	
	listCall(currPage,5);
	
	function more(){ //다음 페이지로 넘겼을 때
		currPage++;
		console.log('currPage',currPage);
		if(currPage>totalPage){
			$('button').attr('disabled',true);
		}else{
			listCall(currPage, 5);			
		}
	}
	
	function listCall(page, cnt){				
		
		$.ajax({
			type:'GET',
			url:'declist2',
			data:{'page':page,'cnt':cnt},
			dataTyps:'JSON',
			success: function(data){
				console.log(data);
				totalPage = data.pages;
				listDraw(data.list);
				
				$('#pagination').twbsPagination({
					startPage: currPage,//현재 페이지
					totalPages: totalPage,//만들수 있는 총 페이지 수
					visiblePages:5, //[1][2][3]... 이걸 몇개 까지 보여줄 것인지
					onPageClick:function(evt,page){//해당 페이지 번호를 클릭했을때 일어날 일들
						console.log(evt); //현재 일어나는 클릭 이벤트 관련 정보들
						console.log(page);//몇 페이지를 클릭 했는지에 대한 정보
						listCall(page, 5);
					}
				});
								
			},
			error:function(e){
				console.log(e);
			}
		});		
	}
	
	
	function listDraw(list){ //리스트를 불러올때 하단 생성
		var content = '';	
		list.forEach(function(item, mem_id){
			var date = new Date(item.mem_date);
			content += '<tr>';
			content += '<td>'+item.mem_id+'</td>';
			content += '<td>'+item.mem_name+'</td>';
			content += '<td>'+item.mem_email+'</td>';
			content += '<td>'+item.mem_phone+'</td>';
			content += '<td>'+date.getFullYear()+"-"+("0"+(date.getMonth()+1)).slice(-2)+"-"+("0" + date.getDate()).slice(-2)+'</td>';
			content += '</tr>';	
		});
		//console.log(content);
		$('#declist2').empty();
		$('#declist2').append(content);		
	}
	
	
////////////////////////////////////////////////////////////////////////////////////////////////	
	
	//검색 ajax
	function SearchList(){
		$.ajax({
			type: 'GET',
			url : 'SearchList3',
			data : $("form[name=search_dec]").serialize(),
			success : function(result){
				console.log("확인");
				//테이블 초기화
				$('#declist').empty();
				if(result.length>=1){
					var str = '';
					result.forEach(function(item){
						var date = new Date(item.mem_date);
						str='<tr>'
						str += "<td>"+item.dec_code+"</td>";
						str+="<td>"+item.dec_name+"</td>";
						str+="<td>"+item.dec_blind+"</td>";
						str+="<td></td>";
						str+="</tr>";
						$('#declist3').append(str);
		
	        		})				 
				}
			}
		})
	};
    
    
	var currPage = 1;
	var totalPage = 2;
	
	listCall(currPage,5);
	
	function more(){ //다음 페이지로 넘겼을 때
		currPage++;
		console.log('currPage',currPage);
		if(currPage>totalPage){
			$('button').attr('disabled',true);
		}else{
			listCall(currPage, 5);			
		}
	}
	
	function listCall(page, cnt){				
		
		$.ajax({
			type:'GET',
			url:'declist3',
			data:{'page':page,'cnt':cnt},
			dataTyps:'JSON',
			success: function(data){
				console.log(data);
				totalPage = data.pages;
				listDraw(data.list);
				
				$('#pagination').twbsPagination({
					startPage: currPage,//현재 페이지
					totalPages: totalPage,//만들수 있는 총 페이지 수
					visiblePages:5, //[1][2][3]... 이걸 몇개 까지 보여줄 것인지
					onPageClick:function(evt,page){//해당 페이지 번호를 클릭했을때 일어날 일들
						console.log(evt); //현재 일어나는 클릭 이벤트 관련 정보들
						console.log(page);//몇 페이지를 클릭 했는지에 대한 정보
						listCall(page, 5);
					}
				});
								
			},
			error:function(e){
				console.log(e);
			}
		});		
	}
	
	
	function listDraw(list){ //리스트를 불러올때 하단 생성
		var content = '';	
		list.forEach(function(item, mem_id){
			var date = new Date(item.mem_date);
			content += '<tr>';
			content += '<td>'+item.mem_id+'</td>';
			content += '<td>'+item.mem_name+'</td>';
			content += '<td>'+item.mem_email+'</td>';
			content += '<td>'+item.mem_phone+'</td>';
			content += '<td>'+date.getFullYear()+"-"+("0"+(date.getMonth()+1)).slice(-2)+"-"+("0" + date.getDate()).slice(-2)+'</td>';
			content += '</tr>';	
		});
		//console.log(content);
		$('#declist3').empty();
		$('#declist3').append(content);		
	}
	
	*/
	
	
	
    
    	const title = document.getElementById('title');
    	var ahr = document.getElementsByTagName('a');
    	$("#dec").hide();
    	$("#decS").hide();
    	$("#decM").hide();
    	$("#DecTable1").hide();
    	$("#DecTable2").hide();
    	$("#DecTable3").hide();
    	$("#admin").hide();
    	$("#adm").hide();
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
	    	$("#admin").hide();
	    	$("#adm").hide();
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
    		$("#admin").hide();
        	$("#adm").hide();
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
    		$("#admin").hide();
        	$("#adm").hide();
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
    		$("#admin").show();
        	$("#adm").show();
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
    		$("#admin").hide();
        	$("#adm").hide();
	    });
        
        $('#a1').click(function(){
        	document.getElementById("a1").style = "color: black; box-shadow: inset 0 -6px 0 gray; cursor:pointer;";
        	document.getElementById("a2").style = "color: black; cursor:pointer;";
        	document.getElementById("a3").style = "color: black; cursor:pointer;";
	    	$("#decS").show();
	    	$("#decM").hide();
	    	$("#DecTable1").show();
	    	$("#DecTable2").hide();
	    	$("#DecTable3").hide();
	    	
        });
        
		$('#a2').click(function(){
			document.getElementById("a1").style = "color: black; cursor:pointer;";
        	document.getElementById("a2").style = "color: black; box-shadow: inset 0 -6px 0 gray; cursor:pointer;";
        	document.getElementById("a3").style = "color: black; cursor:pointer;";
	    	$("#decS").show();
	    	$("#decM").hide();
	    	$("#DecTable1").hide();
	    	$("#DecTable2").show();
	    	$("#DecTable3").hide();
        });
        
		$('#a3').click(function(){
			document.getElementById("a1").style = "color: black; cursor:pointer;";
        	document.getElementById("a2").style = "color: black; cursor:pointer;";
        	document.getElementById("a3").style = "color: black; box-shadow: inset 0 -6px 0 gray; cursor:pointer;";
    		$("#decS").hide();
    		$("#decM").show();
    		$("#DecTable1").hide();
	    	$("#DecTable2").hide();
	    	$("#DecTable3").show();
		});
        
    </script>

</html>