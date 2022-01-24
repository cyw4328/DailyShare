<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Daily Share</title>
        <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
        <link rel="icon" href="./icon.png">
        <style type="text/css">
            
            /*드래그 금지*/
            .no-drag {-ms-user-select: none; -moz-user-select: -moz-none; -webkit-user-select: none; -khtml-user-select: none; user-select:none;} 

            /*레이아웃*/
            * {margin: 0; padding: 0;}
            #wrap {text-align: center; font-size: 30px; color: black; font-size: 16px;}
            #header {height: 140px; line-height: 140px; background: white; color: black; font-size: 16px;}
            #banner {height: 150px; line-height: 250px; background: white; color: black; font-size: 16px;}
            #contents {height: 450px; line-height: 450px; background: white; color: black; font-size: 16px;}
            #footer {height: 220px; line-height: 220px; background: white; color: color: black; font-size: 16px;}
                .container {width: 1100px; height: inherit; margin: 0 auto; background: white; color: black; font-size: 16px;}

            /*테이블*/
            table{
                height: 40px; 
                line-height: 10px; 
                margin: 0 auto;
                position: relative;
            }

            th, td{ 
                border-collapse: collapse;
                padding :1px;
		    }
		    
		    #num{
		    	width:290px;
		    	height:40px; 
		    	font-size:13px; 
		    	padding-left: 10px; 
		    	border: 1px solid gray; 
		    	border-radius: 3px / 3px;
		    }
		    
		    #timer{
		    	color:blue;
		    	margin-left:-40px;
		    }
		    
		    #alert-danger-email{
		    	color:red;
		    	font-size:13px;
		    	height:20px;
		    	margin-top:5px;
		    	text-align: center;
		    }
		    
		    #logo{
		  		position: absolute;
                top: 5%;
                left: 8%;
                width: 80px;
                height: 80px;
		    	border: 1px solid black; 
		    	cursor:pointer;
		    }
        </style>
    </head>
    <body class="no-drag">
        <div id="wrap">
            <div id="header">
            <div id="logo" onclick="location.href='./HomePage'"><img src="/postImageFolder/Logo.PNG" alt="SiteLogo" width="80" height="80"></div>
                <div class="container"></div>
            </div>
            <div id="banner">
                <div class="container">비밀번호 찾기</div>
            </div>
            <div id="contents">
                <div class="container">
                        <table>
                            <!--인증번호-->
                            <tr>
                                <td><input type="text" placeholder="인증번호를 입력하세요." id="num" name="ecode"/><span id="timer"></span>
      							<div class="alert alert-danger" id="alert-danger-email">인증번호를 확인하세요.</div>
                                </td>                          
                            </tr>
                            <!--비밀번호 찾기-->
                            <tr>
                                <td><input type="button"  id="checkBtn" style="background-color: black; margin:auto; display:block; cursor:pointer; font-size: 16; width:80px;height:40px; color:white; border-radius: 7px / 7px; "  value="확인"/></td>
                            </tr>
                        </table>
                </div>
            </div>
            <div id="footer">
                <div class="container"></div>
            </div>
        </div>
    </body>

    <script>
 
    function $ComTimer(){
        //prototype extend
    }

    $ComTimer.prototype = {
        comSecond : ""
        , fnCallback : function(){}
        , timer : ""
        , domId : ""
        , fnTimer : function(){
            var m = Math.floor(this.comSecond / 60) + ":" + (this.comSecond % 60);	// 남은 시간 계산
            this.comSecond--;					// 1초씩 감소
            console.log(m);
            this.domId.innerText = m;
            if (this.comSecond < 0) {			// 시간이 종료 되었으면..
                clearInterval(this.timer);		// 타이머 해제
                alert("인증시간이 초과하였습니다.");
                location.href='./loginPage';
            }
        }
        ,fnStop : function(){
            clearInterval(this.timer);
        }
    };
    
    var AuthTimer = new $ComTimer()
    AuthTimer.comSecond = 180;
    AuthTimer.fnCallback = function(){alert("다시인증을 시도해주세요.")};
    AuthTimer.timer =  setInterval(function(){AuthTimer.fnTimer()},1000);
    AuthTimer.domId = document.getElementById("timer");
    
    $("#alert-danger-email").hide();

    var check = false;
 
  //인증번호를 저장할 변수
    var code = "";
    
    //인증번호 이메일 전송
 
       email = "${PwS}";
       var ecode = $("input[name='ecode']");
       
       $.ajax({
          type:"GET",
          url : "mailCheck",
          data : {email : email},
          contentType :"text/plain;charset=UTF-8",
          success : function(data){ //인증번호를 가져옴
             
             //checkBox.val(''); // 기존에 값이 있었으면 지워줌
             $("#alert-danger-email").hide();
             check = false;
             code = data; // 인증번호를 변수에 저장
             
             
             //console.log(code); //이메일코드 콘솔확인**********************************************
             
             
             
          }
       });

          
          

    //인증코드 입력 시 동일성 확인
    $("input[name='ecode']").keyup(function() {
    	var inputCode = $("input[name='ecode']").val();
    	if (inputCode != "" || code != "") {
    		if (inputCode == code) {
    			$("#alert-danger-email").hide();
    			//$("input[name='ecode']").attr("disabled",true); //인증번호 입력 멈춤
    			check = true;
    		} else {
    			$("#alert-danger-email").show();
    			check = false;
    		}
    	}
    }); 
    
    
    $("#checkBtn").on("click",function(e){
    	if(check == true){
    		location.href='./PwChange'
    	}else{
    		alert("인증번호를 확인해 주세요.");
    		$("#alert-danger-email").show();
    	}
    });   
    
    </script>

</html>