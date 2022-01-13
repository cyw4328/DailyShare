<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
		#board_cont{
			width: 800px;
			height: 800px;
			resize: none;
		}
		#board_sub{
			width: 800px;
		}
		
		table, td, th, tr {
		border: 1px solid black;
		border-collapse: collapse; 
		}
		#board_file{
			width: 50px;
			height: 50px;
		}
	</style>
</head>
<body>
	<form action="csj_write" method="post">
		
		<table>
		  <tr>
		    <th>
				<select name="menu">
					<c:forEach items="${menu}" var="menu">
						<option value="${menu.menu_num}">${menu.menu_name}</option>			
					</c:forEach>
				</select>
		    </th>
		    <th colspan="2">
		    	<button>완료</button>
		    </th>
		  </tr>
		  <tr>
		    <td colspan="3">
		    	<input id="board_sub" placeholder="제목을 입력하세요" type="text" name="board_subject"/>
		    </td>
		  </tr>
		  <tr>
		    <td colspan="3">
		    	<textarea id="board_cont" placeholder="내용을 입력하세요"></textarea>
		    </td>
		  </tr>
		  <tr>
		    <td>
		    	#<input placeholder="태그" type="text" name="tag_content"/>
		    </td>
		    <td>
		    	<a>
		    		<img id="board_file" alt="" src="https://png.pngtree.com/png-vector/20190215/ourmid/pngtree-vector-folder-icon-png-image_539922.jpg">
		    	</a>
		    </td>
		    <td>
		    	<select name="csj_menu">
						<option value="1">전체보기</option>
						<option value="2">나만보기</option>		
				</select>
		    </td>
		  </tr>
		</table>
	</form>






	
</body>
<script>
</script>
</html>