<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>Daily Share</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
		#container_wrap{
			position:relative;
			width: 1400px;
			height: 1500px;
			/* border:2px solid red; */ 
			margin: 0 auto;
		}
		#form_wrap{
			position:relative;
			width: 900px;
			/* height: 90%; */
			/* border:1px solid black; */
			margin: 0 auto;
		}
		#category_wrap{
			position:relative;
			width: 100%;
			height: 100px;
			
		}
		#category_wrap select{
			position:absolute;
			min-width: 100px;
			height: 35px;
			border-radius:5px;
			left: 0px;
			bottom: 0px;
			font-size: 15px;
		}
		#category_wrap img{
			position:absolute;
			max-width:40px;
			cursor: pointer; 
			top: 10px;
		}
		#category_wrap input[type="button"]{
			position:absolute;
			border-radius:5px;
			width:80px;
			height:35px;
			right: 0px;
			bottom: 0px;
			background-color: gray;
			color: white;
			font-size: 15px;
		}
		#sub_wrap{
			position:relative;
			height: 70px;
			border-bottom:2px solid gray;
		}
		#sub_wrap input{
			position:absolute;
			border:none;
			/* border-bottom:2px solid gray; */
			width: 100%;
			height: 70px;
			font-size: 25px;
			
		}
		#sub_wrap input::placeholder{
			font-size: 25px;
			
		}
		#sub_wrap input:focus{
			outline:none;
			/* outline-bottom:2px solid gray; */
		}
		
		#multiple_container{
	 		position:relative;
	 		width: 100%;
	 		min-height: 600px;
	 		border-bottom:2px solid gray;

	 	}
	 	#multiple_container p{
	 		text-align: center;
	 	}
	 	#multiple_container:empty:before{
		  content: attr(placeholder);
		  display: block;
		  color: gray;
		}

	 	
		
		#content_wrap{
			display:none;
			position: relative;
			width: 100%;
			min-height:600px;
			/* border:2px solid red; */
			
		}
		
	 	#board_cont{
	 		display:none;
			border: 1px solid black;
			width: 100%;
			min-height: 600px;
			resize: none;
			overflow: hidden;
		}
	 	
	 	
	 	#etc_wrap{
	 		position: relative;
	 		width: 100%;
	 		height: 80px;
	 		
	 	}
	 	#tag_wrap{
	 		position: absolute;
	 		max-width: 700px;
	 		min-height:50px;
	 		/* border:2px solid green; */
	 		left: 0px;
	 	}
	 	#file_wrap{
	 		position: absolute;
	 		/* border:2px solid blue; */
	 		left: 80%;
	 	}
	 	#scope_wrap{
	 		position: absolute;
	 		/* border:2px solid yellow; */
	 		right: 0px;
	 	}
	 	
	 	#scope_wrap select{
			min-width: 100px;
			height: 35px;
			border-radius:5px;
			font-size: 15px;
		}
	 	
	 	
	 	
	 	
	 	.photo{
	 		cursor: pointer;
	 	}
	 	
	 	.img_file{
			cursor: pointer;
		}
		
	 	
	 	
	 	
	 	
	 	
	 	
	 	
		
		#content_box{
			border: 0px solid black;
			min-width: 600px;
			min-height: 600px;
		}
		
		

		#post_tag{
			width: 65px;
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
		.hasTag{
			cursor: pointer;
		}
		#tag_had{
			display: inline-block;
		}

		

	</style>
</head>
<body>
	<div id="container_wrap">
		<%@ include file="csjBlogHead.jsp" %>
		<form id="post_form" action="csj_postUpdate" method="post" enctype="multipart/form-data">
		<div id="form_wrap">
			<div id=category_wrap>
				<img src="resources/images_csj/backimage.png" onclick="javascript:history.back();">
				<select name="menu_num">
								<c:forEach items="${menu}" var="menu">
									<c:if test="${menu.menu_num eq boardDetail.menu_num}">
										<option value="${menu.menu_num}" selected="selected">${menu.menu_name}</option>			
									</c:if>
									<c:if test="${menu.menu_num ne boardDetail.menu_num}">
										<option value="${menu.menu_num}">${menu.menu_name}</option>			
									</c:if>
								</c:forEach>
				</select>
				<input  id="post_submit" type="button" value="??????"/>
			</div>
			
			
			<input type="hidden" name="board_num" value="${board_num}"/>
			<div id="sub_wrap">
				<input id="board_sub" placeholder="&nbsp;????????? ???????????????" type="text" name="board_subject" value="${boardDetail.board_subject}"/>
			</div>
			
			<div id="multiple_container" contenteditable="true" placeholder="????????? ???????????????" onkeydown="resize(this)" onkeyup="resize(this)">
				<c:if test="${not empty photos.size()}">
					<c:forEach items="${photos}" var="photo">
						<p class="photo" ondblclick="photoDel('${photo.photo_newName}','${photo.photo_num}')" id="${photo.photo_num}">
							<img src="/postImageFolder/${photo.photo_newName}" style="max-width:300px;max-height:250px;z-index:none;"/>
						</p>			
					</c:forEach>
				</c:if>
				${boardDetail.board_cont}
				
			</div>
			<!-- ?????? textarea ??? ????????? -->
			<div id="content_wrap">
				<input id="delPhotoNum" type="hidden" name="delPhotoNum" value="0">
				<textarea  id="board_cont" placeholder="????????? ???????????????" name="board_cont" onkeydown="resize(this)" onkeyup="resize(this)"></textarea>
			</div>
			
			
			
			
			<div id="etc_wrap">
				<div id="tag_wrap">
					#<input id="post_tag" placeholder="?????? ??????" type="text" />
					<input id="post_tagNum" type="hidden" name="tag_num" value="0"/>
					<div id="tag_had"></div>
				</div>
				<div id="file_wrap">
					<div id="input_imgBox">	    		
			    		<!-- <input id="input_img" type="file" name="photos" multiple="multiple" accept="image/*" onchange="imgPrev(event);"/> -->
			    		
			    		<label id="file_label" for="input_img">
			    			<img id="board_file" alt="" src="resources/images_csj/folderimg.png"/>
			    			<div>
				    			?????? : <span id="photoNum" >0</span>			    			
			    			</div>
			    		</label>
			    		
			    		
			    		<input id="input_img" type="file" name="photos" multiple="multiple" accept="image/*" onchange="handleImgFileSelect(event);" /> 
					</div>
				</div>
				<div id="scope_wrap">
					<select name="board_scope">
						<option value="0">????????????</option>
						<option value="1">????????????</option>		
					</select>
				</div>
			
			</div>
		</div>
		</form>
	</div>	

	
</body>
<script>


/* ?????? ?????? */
var delPhoto;
var p=0;
function photoDel(photo,idx) {
	console.log(photo+"?????? ?????? ??????");
	var id='#'+idx;
	console.log(id);
	console.log($(id));
	$(id).remove();
	delPhoto='<input type="hidden" name="photo_newName'+p+'" value="'+photo+'"/>';
	$('#content_wrap').append(delPhoto);
	p++
	$('#delPhotoNum').val(p);
}

var img_files = [];

function handleImgFileSelect(e){
	$('.newFile').remove();
	img_files=[];
	
	var files = e.target.files;
	var fileArr = Array.prototype.slice.call(files);
	
	var minHeight = $('#multiple_container').css('min-height').split('px');
	var height = parseInt(minHeight[0]);
	
	var index = 0;
	fileArr.forEach(function(f){
		if(!f.type.match('image.*')){
			alert("???????????? ????????? ???????????? ???????????????.");
			return;
		}
		img_files.push(f);
		console.log(img_files.length);
		var reader = new FileReader();
		reader.onload = function(e){
			var html = '<p class="newFile"><a href=\"javascript:void(0);\" ondblclick=\"imgSelect('+index+')\" id=\"img_id'+index+'\"><img style="max-width:500px;max-height:700px;z-index:none;position:relative;" src=\"'+e.target.result+'\"data-file="'+f.name+'" class="img_file" title="dblClick to remove"></a></p>';
			$('#multiple_container').append(html);
			index++;
			
		}
		//$('#multiple_container').css('min-height',height+300*index);

		reader.readAsDataURL(f);
		
		$('#photoNum').html(img_files.length);
		
	});
};


function imgSelect(index) {
	var img_id = '#img_id'+index;
	minHeight = $('#multiple_container').css('min-height').split('px');
	height = parseInt(minHeight[0]);
	img_files.splice(index,1);
	
	$(img_id).remove();
	//$('#multiple_container').css('min-height',height-300);
	console.log(img_files.length);
	
	$('#photoNum').html(img_files.length);
	

	
}

var i =0;

/* ????????? ?????? submit */
$('#post_submit').click( function() {
	console.log($('#multiple_container').text());
	console.log($('#multiple_container').html());
	$('#board_cont').html($('#multiple_container').text());
	if ($('#board_sub').val() == "") {
		alert('????????? ???????????????.');
		$('#board_sub').focus();
	}else if ($('#board_cont').val() == "") {
		alert('????????? ???????????????.');
		$('#multiple_container').focus();
	}else {
		$('#post_form').submit();
	}
/* 	console.log($('#board_cont').html()); */
});


/* ?????? ????????? ???????????? */
$('#post_tag').keydown(function(key) {
	if (key.keyCode == 13) {
		console.log('?????? ??????');
		var tag_cont = $('#post_tag').val();
		if(tag_cont != "" && tag_cont != " " && tag_cont != "   " && tag_cont != "   "){
			$('#post_tag').parent().append('<span style="color:grey;font-size:15px;">#'+tag_cont+'</span>&nbsp;');
			$('#post_tag').after('<input id="tag'+i+'" type="hidden" name="tag_content'+i+'" value="'+tag_cont+'"/>');
			i++;
			$('#post_tagNum').val(i);
			console.log(i);
			$('#post_tag').val('');
		}
	}
});


var $board_num = ${boardDetail.board_num};
/* ?????? ???????????? */
 
tagCall();
function tagCall() {
console.log("tagCall ??????");
$.ajax({
		type:'get',
		url:'csj_tagCall',
		data:{'board_num':$board_num},
		dataType:'JSON',
		success: function(data) {
			console.log(data.tags);
			tagDraw(data.tags);
		},
		error: function(e) {
			console.log(e);
		}
		
	});
	
}

function tagDraw(tags) {
	$('#tag_had').empty();
	var content = '';
	if (tags.length>0) {
		for (var i = 0; i < tags.length; i++) {
			console.log(String(tags[i]));
			content = '&nbsp;<span class="hasTag" ondblclick="tagDel(\''+tags[i]+'\')" style="color:grey;font-size:15px;">#'+tags[i]+'</span>'
			$('#tag_had').append(content);
		}
	}
	
 	
}


/* ?????? ?????? */
function tagDel(tag) {
	console.log(tag);
		$.ajax({
		type:'get',
		url:'csj_tagDel',
		data:{'tag_content':tag,'board_num':$board_num},
		dataType:'JSON',
		success: function(data) {
			console.log(data.result);
				tagCall();				
		},
		error: function(e) {
			console.log(e);
		}
		
	});
}



function resize(obj) {
	  obj.style.height = "1px";
	  obj.style.height = (12+obj.scrollHeight)+"px";
	  
	}



</script>
</html>