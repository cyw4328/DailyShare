<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <style>
    	table, td, th{
    		border: 1px solid black;
    		text-align: center;
    		border-collapse: collapse;
    	}
    
    
    </style>
</head>
<body>
	<table>
		<td>아이디</td>
		<td>이름</td>
		<td>이메일</td>
		<td>전화번호</td>
		<td>회원탈퇴 여부</td>
		<td>회원제재 상태</td>
		
		<c:forEach var="members" items="${list}">
			<tr>
				<td>${members.mem_id}</td>
				<td>${members.mem_name}</td>
				<td>${members.mem_email}</td>
				<td>${members.mem_phone}</td>
				<td>${members.mem_out}</td>
				<td>${members.mem_san}</td>
			</tr>
		</c:forEach>
		
		
	</table>
</body>
<script>
</script>
</html>