<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    
    <!-- <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script> -->
    
      <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
      <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
      <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>  
      <script src="resources/js/jquery.twbsPagination.js"></script>
    
    
    <style>
    	table, td, th{
    		border: 1px solid black;
    		text-align: center;
    		border-collapse: collapse;
    	}
    
    
    </style>
</head>
<body>

	<!-- 검색 select 박스 추가 -->
	<div>
		<form action="search_mem" method="GET" name="search_mem">
			<select name="SearchType" id="type">
				<option selected value="all">전체</option>
				<option value="mem_id">아이디</option>
				<option value="mem_name">이름</option>
			</select>
			<input type="text" name="keyword">
			<input type="button" id="btnSearch" onclick="getSearchList()" value="검색">
		</form>
	</div>



	<table>
		<thead>
			<td>아이디</td>
			<td>이름</td>
			<td>이메일</td>
			<td>전화번호</td>
			<td>회원탈퇴 여부</td>
			<td>회원제재 상태</td>
		</thead>
		
		<tbody id="list"></tbody>
		<tr>
			<td colspan="10" id="paging">
	            <div class="container">                           
	               <nav aria-label="Page navigation" style="text-align:center">
	                  <ul class="pagination" id="pagination"></ul>
	               </nav>               
	            </div>
			</td>
		</tr>

	</table>
</body>
<script>

		//검색 ajax
		function getSearchList(){
			$.ajax({
				type: 'GET',
				url : 'getSearchList',
				data : $("form[name=search_mem]").serialize(),
				success : function(result){
					console.log("확인");
					//테이블 초기화
					$('#list').empty();
					if(result.length>=1){
						result.forEach(function(item){
							str='<tr>'
							str += "<td>"+item.mem_id+"</td>";
							str+="<td>"+item.mem_name+"</td>";
							str+="<td>"+item.mem_email+"</td>";
							str+="<td>"+item.mem_phone+"</td>";
							str+="<td>"+item.mem_out+"</td>";
							str+="<td>"+item.mem_san+"</td>";
							str+="</tr>";
							$('#list').append(str);
		        		})				 
					}
				}
			})
		}



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
				url:'list',
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
				//console.log(idx,item);
				content += '<tr>';
				content += '<td>'+item.mem_id+'</td>';
				content += '<td>'+item.mem_name+'</td>';
				content += '<td>'+item.mem_email+'</td>';
				content += '<td>'+item.mem_phone+'</td>';
				content += '<td>'+item.mem_out+'</td>';
				content += '<td>'+item.mem_san+'</td>';
				content += '</tr>';	
			});
			//console.log(content);
			$('#list').empty();
			$('#list').append(content);		
		}



</script>
</html>