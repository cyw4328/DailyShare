<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>  
        <script src="resources/js/jquery.twbsPagination.js"></script>
    <style>
    	/*드래그 금지*/
         .no-drag {-ms-user-select: none; -moz-user-select: -moz-none; -webkit-user-select: none; -khtml-user-select: none; user-select:none;} 
    	
    	#tab5{
    		font-weight: bold;
    		color: orange;
    	}   
    	.adminl{
			position: absolute;
			left: 300px;
			top: 150px;
			max-width: 300px;
	        text-overflow: ellipsis;
	        white-space: nowrap;
	        color: black;
	        font-size: 14px;

    	}
    	
    	table, td, tr {
    		border: 1px solid black;
    		text-align: center;
    		border-collapse: collapse;
    		width: 100px;
    	}
    	
     	.admin_re{
			position: absolute;
		    left: 900px;
		    top: 167px;    	
    	} 
    	
    	
    	
    </style>
</head>
<body class="no-drag">
<%@ include file="headerShs_login.jsp"%>
<%@ include file="AdminMyPageShs.jsp" %>

	<!-- 등록 창 -->
	<div class="admin_re">
		<form action="admin_r" method="GET" name="admin_reg">
			<input type="text" name="keyword" id="admin_text" value="">
			<input type="button" id="admin_re" onclick="admin_regist()" value="등록">
			<input type="button" id="admin_de" onclick="admin_delete()" value="삭제">
	    </form>
	</div>



	<div class="adminl">
		<table>
			<thead>
				<td>아이디</td>
				<td>이름</td>
				<td>이메일</td>
				<td>전화번호</td>
				<!-- <td>관리자 삭제</td> -->
			</thead>
			
			<tbody id="adlist"></tbody>
			<tr>
				<td colspan="6" id="paging">
		            <div class="container" style="width:850px;">                        
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

		function admin_regist() {
			
			var adminT = $('#admin_text').val();
			
			console.log($('#admin_text').val());
			
			$.ajax({
				type: 'GET',
				url: 'AdRegist',
				data: {'adminT' : adminT},
				dataType: 'JSON',
				success: function (data) {
					console.log(data);
					alert("등록 완료");
				},
				error: function (e) {
					alert("등록 실패");
				}				
			});	
			
				location.reload();
		};


		
		function admin_delete() {
			
			var adminT = $('#admin_text').val();
			
			console.log($('#admin_text').val());
			
			$.ajax({
				type: 'GET',
				url: 'AdRegistDW',
				data: {'adminT' : adminT},
				dataType: 'JSON',
				success: function (data) {
					console.log(data);
					alert("삭제 완료");
				},
				error: function (e) {
					alert("삭제 실패");
				}				
			});	
			
				location.reload();
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
				url:'adlist',
				data:{'page':page,'cnt':cnt},
				dataTyps:'JSON',
				success: function(data){
					console.log(data);
					totalPage = data.pages;
					listDraw(data.adlist);
					
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
		
		function listDraw(adlist){ //리스트를 불러올때 하단 생성
			var content = '';	
			adlist.forEach(function(item, mem_id){
				//console.log(idx,item);
				content += '<tr>';
				content += '<td>'+item.mem_id+'</td>';
				content += '<td>'+item.mem_name+'</td>';
				content += '<td>'+item.mem_email+'</td>';
				content += '<td>'+item.mem_phone+'</td>';
				//content += '<td>'+'<input type="button" id="AdRegi" onclick="AdRegistDW()" value="삭제">'+'</td>';
				//content += '<td>'+'<a href="./AdRegistDW?adminT=${member.mem_id}" id="deletad">삭제</a>'+'</td>';
				content += '</tr>';	
			});
			//console.log(content);
			$('#adlist').empty();
			$('#adlist').append(content);		
		}

		
		$('#deletad').click(function () {
			alert("삭제 완료");
		})
		
		const headTxt = document.getElementById('headTxt');
		headTxt.innerText = '관리자목록';

</script>
</html>