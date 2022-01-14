<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
		#multiple_container{
			width: 800px;
			height: 800px;
			border: 1px solid black;
		}
		#multiple_container:empty:before{
  			content: attr(placeholder);
 			display: block;
 			color: grey;
		}
		
		#post_tag{
			width: 50px;
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
	
	<form id="post_form" action="csj_postUpload" method="post" enctype="multipart/form-data">
	<table>
	 	<tr>
	  		<th colspan="2">
	  			${loginId}
	  		</th>
	    	<th>
				<select name="menu_num">
					<c:forEach items="${menu}" var="menu">
						<option value="${menu.menu_num}">${menu.menu_name}</option>			
					</c:forEach>
				</select>
	    	</th>
	    	<th>
	    		<input  id="post_submit" type="button" value="완료"/>
	    	</th>
	  	</tr>
	  	<tr>
	    	<td colspan="4">
	    		<input id="board_sub" placeholder="제목을 입력하세요" type="text" name="board_subject"/>
	    	</td>
	  	</tr>
	  	<tr>
	    	<td colspan="4">
	    		<textarea id="board_cont" placeholder="내용을 입력하세요" name="board_cont" hidden="true" ></textarea>
	    		<div id="multiple_container" contenteditable="true" placeholder="내용을 입력하세요."></div>
	    	</td>
	  	</tr>
	  	<tr>
	    	<td colspan="2">
				#<input id="post_tag" placeholder="태그" type="text" />
				<input id="post_tagNum" type="hidden" name="tag_num" value=""/>
	    	</td>
	    	<td>
	    		<img id="board_file" alt="" src="resources/images_csj/folderimg.png">
	    		<!-- <input id="input_img" type="file" name="photos" multiple="multiple" accept="image/*" onchange="imgPrev(event);"/> -->
	    		<input id="input_img" type="file" name="photos" multiple="multiple" accept="image/*" onchange="handleImgFileSelect(event);"/> 
	    	</td>
	    	<td>
	    		<select name="board_scope">
					<option value="0">전체보기</option>
					<option value="1">나만보기</option>		
				</select>
	    	</td>
	  	</tr>
	</table>
	</form>
	






	
</body>
<script>
var img_files = [];

function handleImgFileSelect(e){
	$("#multiple_container").children($('a')).remove();
	img_files=[];
	
	var files = e.target.files;
	var fileArr = Array.prototype.slice.call(files);
	
	var index = 0;
	fileArr.forEach(function(f){
		if(!f.type.match('image.*')){
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}
		img_files.push(f);
		
		var reader = new FileReader();
		reader.onload = function(e){
			var html = '<a href=\"javascript:void(0);\" ondblclick=\"imgSelect('+index+')\" id=\"img_id'+index+'\"><img style="max-width:200px;max-height:200px;z-index:none;position:relative;" src=\"'+e.target.result+'\"data-file="'+f.name+'" class="img_file" title="Click to remove"></a>';
			$("#multiple_container").append(html);
			index++;
			
		}
		reader.readAsDataURL(f);
		
		
		
	});
};


function imgSelect(index) {
	console.log(index);
	var img_id = '#img_id'+index;
	console.log($(img_id));
	$(img_id).remove();
	
}



/* function imgPrev(event) { 
	var reader = new FileReader(); 
	reader.onload = function(event) {
			var img = document.createElement("img");
			var img_style = 'max-width:300px;max-height:300px;z-index:none';
			console.log( event.target.files);
			img.setAttribute("src", event.target.result);
			img.setAttribute('style', img_style);
			document.querySelector("div#multiple_container").appendChild(img); 
		}; 
		console.log(event.target.files[1]);
		reader.readAsDataURL(event.target.files[0]); 
} */




var i =0;
$('#post_submit').click( function() {
/* 	console.log($('#image_container').html()); */
	$('#board_cont').html($('#multiple_container').html());
	if ($('#board_sub').val() == "") {
		alert('제목을 입력하세요.');
		$('#board_sub').focus();
	}else if ($('#board_cont').text() == "") {
		alert('내용을 입력하세요.');
		$('#multiple_container').focus();
	}else {
		$('#post_form').submit();
	}
/* 	console.log($('#board_cont').html()); */
});

$('#post_tag').keydown(function(key) {
	if (key.keyCode == 13) {
		console.log('엔터 입력');
		var tag_cont = $('#post_tag').val();
		if(tag_cont != "" && tag_cont != " " && tag_cont != "   " && tag_cont != "   "){
			$('#post_tag').parent().append('&nbsp;<span style="color:grey;font-size:15px;">#'+tag_cont+'</span>');
			$('#post_tag').after('<input id="tag'+i+'" type="hidden" name="tag_content'+i+'" value="'+tag_cont+'"/>');
			i++;
			$('#post_tagNum').val(i);
			console.log(i);
			$('#post_tag').val('');
		}
	}
});

</script>
</html>