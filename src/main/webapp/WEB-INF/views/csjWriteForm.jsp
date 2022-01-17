<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.io.*"%>

<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
	
	 	#multiple_container{
	 		text-align: center;
	 	}
		
		#content_box{
			border: 0px solid black;
			min-width: 600px;
			min-height: 600px;
		}
		
		#board_cont{
			border: 0px solid black;
			width: 100%;
			min-height: 600px;
			resize: none;
			overflow: hidden;
		}
		
		#post_tag{
			width: 50px;
		}
		
		
		#board_sub{
			width: 100%;
		}
		
		table, td, th, tr {
			border: 1px solid black;
			border-collapse: collapse; 
		}
		
		#board_file{
			width: 50px;
			height: 50px;
		}
		
		
		#input_img{
			display: none;
		}
		
		#file_label{
			cursor: pointer;
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
	    		<div id="content_box">
		    		<div id="multiple_container"></div>
		    		<textarea  id="board_cont" placeholder="내용을 입력하세요" name="board_cont" onkeydown="resize(this)" onkeyup="resize(this)"></textarea>
	    		</div>
	    	</td>
	  	</tr>
	  	<tr>
	    	<td colspan="2">
				#<input id="post_tag" placeholder="태그" type="text" />
				<input id="post_tagNum" type="hidden" name="tag_num" value="0"/>
	    	</td>
	    	<td>
	    		<div id="input_imgBox">	    		
		    		<!-- <input id="input_img" type="file" name="photos" multiple="multiple" accept="image/*" onchange="imgPrev(event);"/> -->
		    		
		    		<label id="file_label" for="input_img">
		    			<img id="board_file" alt="" src="resources/images_csj/folderimg.png"/>
		    			&nbsp;사진 : <span >0</span>
		    		</label>
		    		
		    		
		    		<input id="input_img" type="file" name="photos" multiple="multiple" accept="image/*" onchange="handleImgFileSelect(event);" /> 
	    		</div>
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
	$('#multiple_container').children('a').remove();
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
		console.log(img_files.length);
		var reader = new FileReader();
		reader.onload = function(e){
			var html = '<a href=\"javascript:void(0);\" ondblclick=\"imgSelect('+index+')\" id=\"img_id'+index+'\"><img style="max-width:300px;max-height:300px;z-index:none;position:relative;" src=\"'+e.target.result+'\"data-file="'+f.name+'" class="img_file" title="dblClick to remove"></a>';
			$("#multiple_container").append(html);
			index++;
			
		}
		reader.readAsDataURL(f);
		
		$('#file_label').children().html(img_files.length);
		
	});
};


function imgSelect(index) {
	var img_id = '#img_id'+index;

	img_files.splice(index,1);
	
	$(img_id).remove();
	
	console.log(img_files.length);
	
	$('#file_label').children().html(img_files.length);
	

	
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

/* 게시글 작성 submit */
$('#post_submit').click( function() {
/* 	console.log($('#image_container').html()); */
/* 	console.log($('#multiple_container').text());
	console.log($('#multiple_container').html()); */
	/* $('#board_cont').html($('#multiple_container').html()); */
	if ($('#board_sub').val() == "") {
		alert('제목을 입력하세요.');
		$('#board_sub').focus();
	}else if ($('#board_cont').val() == "") {
		alert('내용을 입력하세요.');
		$('#multiple_container').focus();
	}else {
		$('#post_form').submit();
	}
/* 	console.log($('#board_cont').html()); */
});


/* 태그 여러개 전송하기 */
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



function resize(obj) {
	  obj.style.height = "1px";
	  obj.style.height = (12+obj.scrollHeight)+"px";
	  
	}



</script>
</html>