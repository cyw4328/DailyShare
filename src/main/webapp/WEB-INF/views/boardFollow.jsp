<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <link rel="stylesheet" href="resources/common.css">
    <style>
    </style>
</head>
<body>


			<span class ="foliSpan" ><input class="followBtn" id="${item.sub_num}" type="button" value="구독하기" /></span>
			<span class ="UnfoliSpan" ><input class="UnfoliBtn" id="${item.sub_num}" type="button" value="구독중" /></span>
			
			
</body>
<script>



//구독하기
var mem_id = 'test04';
//var mem_id = ${boardDetail.mem_id}; --> board 에 대한 작성자

$('.UnfoliSpan').hide();

$('.followBtn').click(function (){
	BtnVal = $(this).val();
	console.log('스크립트 테스트'+BtnVal);
	$('.UnfoliSpan').show();
	$('.foliSpan').hide();
	
		   $.ajax({
			type:'post',
			url:'followPlusShs',
			data:{'mem_id':mem_id},
			dataType:'JSON',
			success: function(data) {
				console.log(data.result);
				 if(data.result==0){
						$('.UnfoliSpan').show();
						$('.foliSpan').hide();
				 }
				
			},
			error: function(e) {
				console.log(e);
			}
			
		});  
		
		
}); 



//구독취소
$('.UnfoliBtn').click(function (){
	BtnVal = $(this).val();
	console.log('스크립트 테스트'+BtnVal);
	$('.UnfoliSpan').hide();
	$('.foliSpan').show();
	
 	$.ajax({
		type:'post',
		url:'followDelShs',
		data:{'mem_id':mem_id},
		dataType:'JSON',
		success: function(data) {
			console.log(data.result);
			if(data.result==0){
				$('.UnfoliSpan').hide();
				$('.foliSpan').show();
		 }
		},
		error: function(e) {
			console.log(e);
		}
		
	});   

}); 



</script>
</html>