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
		#image_container:empty:before{
  			content: attr(placeholder);
 			display: block;
 			color: grey;
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
		
		.img_file{
			max-width:300px;
			max-height:300px;
			z-index:none;
		}
	</style>
</head>
<body>
	<form action="csj_write" method="post" enctype="multipart/form-data">
		
		<table>
		  <tr>
		  	<th>
		  		${loginId}
		  	</th>
		    <th>
				<select name="menu">
					<c:forEach items="${menu}" var="menu">
						<option value="${menu.menu_num}">${menu.menu_name}</option>			
					</c:forEach>
				</select>
		    </th>
		    <th>
		    	<button id="post_submit">완료</button>
		    </th>
		  </tr>
		  <tr>
		    <td colspan="3">
		    	<input id="board_sub" placeholder="제목을 입력하세요" type="text" name="board_subject"/>
		    </td>
		  </tr>
		  <tr>
		    <td colspan="3">
		    	<textarea id="board_cont" placeholder="내용을 입력하세요" name="board_cont" hidden="true" ></textarea>
		    	<div id="multiple_container" contenteditable="true" placeholder="내용을 입력하세요."></div>
		    </td>
		  </tr>
		  <tr>
		    <td>
		    	#<input placeholder="태그" type="text" name="tag_content"/>
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
			var html = '<a href=\"javascript:void(0);\" onclick=\"deleteImageAction('+index+')\" id=\"img_id_'+index+'\"><img src=\"'+e.target.result+'\"data-file="'+f.name+'" class="img_file" title="Click to remove"></a>';
			$("#multiple_container").append(html);
			index++;
			
		}
		reader.readAsDataURL(f);
		
		
		
	});
};



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





$('#post_submit').click( function() {
/* 	console.log($('#image_container').html()); */
	$('#board_cont').html($('#image_container').html());
/* 	console.log($('#board_cont').html()); */
});


</script>
</html>