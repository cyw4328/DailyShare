<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Daily Share</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
	</style>
</head>
<body>
	<table >
		<tr>
			<th>나를 구독중인 아이디</th>
			<th>구독 여부</th>
		</tr>
		<c:forEach items="${subList}" var="list" >
			<tr>
				<td>${list.mem_id}</td>
				<td>
					<input id="${list.sub_num}" type="button" value="구독하기" />

					<script>
						var $mem_id = '${list.mem_id}';
						var id ='#'+${list.sub_num};
						
						
						console.log('스크립트 테스트');
						$.ajax({
							type:'get',
							url:'csjSubCall',
							data:{'sub_id':$mem_id},
							dataType:'JSON',
							success: function(data) {
								if (data.result>0) {
									$(id).val('구독중');
								}
							},
							error: function(e) {
								console.log(e);
							}
							
						})

					</script>
				</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
<script>

</script>
</html>