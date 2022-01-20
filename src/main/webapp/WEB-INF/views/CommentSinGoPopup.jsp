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
    	background-color : white;
    	border: 1px solid gray;
    }
    #SingoPopupHead{
    font-size: 40px;
    text-align: center;
    position: absolute;
    top: 20px;
    left: 180px;
    }
    .SingoCode{
    	position: absolute;
    	left: 150px;
    	top: 270px
    }
    #singoCom{
    	position: absolute;
    	left: 430px;
    	top: 430px;
    	width: 100px;
    	height: 40px;
    	background-color: black;
    	color: white;
    }
    #SingoUser{
    	position: absolute;
    	left: 60px;
    	top: 120px;
    	font-size: 18px;
    }
      #SingoCont{
    	position: absolute;
    	left: 78px;
    	top: 170px;
    	font-size: 18px;
    }
      #SingoSelec{
    	position: absolute;
    	left: 200px;
    	top: 230px;
    	font-size: 20px;
    }
        #closebtn{
    	position: absolute;
    	left: 500px;
    	top: 20px;
    }
    #btn{
    	width: 20px;
    	height: 10px;
    	border: none;
    	font-size: 25px;
    }
    </style>
</head>
<body>

	<div id="SingoPopup">
		<form action="CommentSingo" method="POST">
			<table>
				<tr>
					<th id="SingoPopupHead">[신고하기]</th><td id="closebtn"><button id="btn">X</button></td>
				</tr>
				<tr>
					<td id="SingoUser">
						작성자 : ${comList.mem_id }
						<input type="hidden" value="${comList.mem_id }" name="dec_targetId"/>
						<input type="hidden" value="${comList.com_num }" name="dec_targetNum"/>
					</td>
				</tr>
				<tr>
					<td id="SingoCont">내용 : ${comList.com_cont}</td>
				</tr>
				<tr>
					<td id="SingoSelec"><b>사유선택</b></td>
				</tr>
				<tr>
					<td class="SingoCode">

					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="보내기" id="singoCom"/>
					</td>
				</tr>
				
			</table>
		</form>
	</div>

</body>
<script>

$.ajax({
	type:'POST',
	url:'SingoCode',
	data:{}, // {}안에 아무것도 안넣으면 다보여줘라 라는 뜻
	dataType:'JSON',
	success:function(data) {
		console.log(data.Code);
		listDraw(data.Code);
	},
	error:function(e) {
		console.log(e);
	}
});

function listDraw(Code) {
	var content = '';
	
	for (var i = 0; i < Code.length; i++) {
					

		content += '<input type="radio" value="'+Code[i].dec_code+'"name="dec_code"/>'+Code[i].dec_name+'<br/>';
			
			
	}
	$('.SingoCode').append(content);
};


</script>
</html>