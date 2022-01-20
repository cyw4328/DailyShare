<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <style>
    #SingoPopup{
    	width: 550px;
    	height: 500px;
    	position: absolute;
    	top: 250px;
    	left: 500px;
    	background-color: blue;
    }
    th{
    font-size: 50px;
    }
    
    </style>
</head>
<body>

	<div id="SingoPopup">
		<form action="Singo" method="POST">
			<table>
				<tr>
					<th>[신고하기]</th>
				</tr>
				<tr>
					<td>작성자</td><td>mem_id</td>
				</tr>
				<tr>
					<td>내용</td><td>board_cont or com_cont</td>
				</tr>
				<tr>
					<td><b>사유선택</b></td>
				</tr>
				<tr>
					<td class="SingoCode">
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="보내기" id="버튼"/>
					</td>
				</tr>
				
			</table>
		</form>
	</div>

</body>
<script>


</script>
</html>