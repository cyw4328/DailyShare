<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>Daily Share</title>
   <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
   <style>

   </style>

<body>


<span class ="foliSpan" ><input class="followBtn" id="${item.sub_num}" type="button" value="구독하기" /></span>
<span class ="UnfoliSpan" ><input class="UnfoliBtn" id="${item.sub_num}" type="button" value="구독중" />


</span>
			
			
<script>
$('.UnfoliSpan').hide();


//var BtnVal = '';
$('.followBtn').click(function (){
	//BtnVal = $(this).val();
	console.log('스크립트 테스트'+BtnVal);
	$('.UnfoliSpan').show();
	$('.foliSpan').hide();
	
		  $.ajax({
			type:'post',
			url:'followDelShs',
			data:{},
			dataType:'JSON',
			success: function(data) {
				console.log(data.result);
				
			},
			error: function(e) {
				console.log(e);
			}
			
		});  
		
		
		
	/* $.ajax({
	type:'post',
	url:'followDelShs',
	data:{},
	dataType:'JSON',
	success: function(data) {
		console.log(data.result);
		
	},
	error: function(e) {
		console.log(e);
	}
	
});   */
}); 


$('.UnfoliBtn').click(function (){
	//console.log($(this).parent().prev().text());
	BtnVal = $(this).val();
	console.log('스크립트 테스트'+BtnVal);
	$('.UnfoliSpan').hide();
	$('.foliSpan').show();

}); 


	














		

	

</script>
</html>