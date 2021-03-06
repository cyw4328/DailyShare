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
		    
		    #id, #pw{
		    	width:290px;
		    	height:40px; 
		    	font-size:13px; 
		    	padding-left: 10px; 
		    	border: 1px solid gray; 
		    	border-radius: 3px / 3px;
		    }
		    
		    #logo{
		  		position: absolute;
                top: 5%;
                left: 8%;
                width: 80px;
                height: 80px;
		    	/* border: 1px solid black;  */
		    	cursor:pointer;
		    }
		    
		    #msg{
		    	color:red;
		    	font-size:13px;
		    	height:20px;
		    	margin-top:5px;
		    	text-align: center;
		    }
        </style>
    </head>
    <body class="no-drag">
        <div id="wrap">
            <div id="header">
            <div id="logo" onclick="location.href='./MainPageShs'"><img src="/postImageFolder/LoGo.PNG" alt="SiteLogo" width="80" height="80"></div>
                <div class="container"></div>
            </div>
            <div id="banner">
                <div class="container"><h2>DAILY SHARE</h2></div>
            </div>
            <div id="contents">
                <div class="container">
                	<form id="loginSubmit" action="login" method="post">
                		<input type="hidden" id="snsName" name="snsName"/>
                		<input type="hidden" id="snsEmail" name="snsEmail"/>
                        <table>
                            <!--id-->
                            <tr>
                                <td><input type="text" placeholder="ID" id="id" name="userId"></td>
                            </tr>
                            <!--pw-->
                            <tr>
                                <td><input type="password" placeholder="Password"  id="pw" name="userPass"/>
                                <div id="msg">${msg}</div>
                                </td>
                            </tr>
                            <!--login-->
                            <tr>
                                <td><input type="submit"  style="background-color: black; cursor:pointer; font-size: 16; width:290px;height:40px; color:white; border-radius: 3px / 3px;"  value="로그인"/></td>
                            </tr>
                            <!-- 구글 -->
                            <tr>
                                <td><input id="btnGoogle" type="button"  style="background-color: black; cursor:pointer; font-size: 16; width:290px;height:40px; color:white; border-radius: 3px / 3px;"  value="Google Login"/></td>
                            </tr>
                            <!-- // 구글 -->
                            <!--회원가입/아이디,비밀번호찾기-->
                            <tr>
                                <td>
                                    <a target="_blank" style="font-size: 13px; color: cornflowerblue; cursor:pointer;">회원가입</a>
                                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                    <a target="_blank" style="font-size: 13px; color: cornflowerblue; cursor:pointer;">아이디</a><a target="_blank" style="font-size: 13px; color: cornflowerblue; cursor:pointer;">·비밀번호 찾기</a>
                                </td>
                            </tr>
                        </table>
                	</form>
                </div>
            </div>
            <div id="footer">
                <div class="container"></div>
            </div>
        </div>
    </body>

    <script>
    
        /*회원가입/아이디,비밀번호찾기 링크*/
        var ahr = document.getElementsByTagName('a');
        var win;
        ahr[0].addEventListener('click',function(){
            location.href='./shs'
        });

        ahr[1].addEventListener('click',function(){
            location.href='./IdSearch'
        });

        ahr[2].addEventListener('click',function(){
            location.href='./PwSearch'
        });
        
        /* 구글 */
        var btnGoogle = $('#btnGoogle');
        btnGoogle.click(function(e){
        	var gauth = gapi.auth2.getAuthInstance();
        	
        	/* 구글 로그인 성공 */
        	gauth.signIn().then(function(response){
        		console.log('구글 로그인');
        		var profile = gauth.currentUser.get().getBasicProfile();
        		
        		console.log('email ' + profile.getEmail());
        		console.log('name ' + profile.getName());
        		
        		$('#snsName').val(profile.getName());
        		$('#snsEmail').val(profile.getEmail());
        		$('#loginSubmit').submit();
        	});
        });
        
		function ggStartApp(){
        	gapi.load('auth2', function(){
        		auth2 = gapi.auth2.init({
        			client_id: '129429202482-inm4p4ghvpr97o58ffn3f03ob4h049vn.apps.googleusercontent.com',
        			scope:'profile'
        		});
        	});
        }
		
		/* JavaScript용 Google SDK 설정 */
        (function(d,s,id){
	         var js, fjs = d.getElementsByTagName(s)[0];
	         if(d.getElementById(id)) {return;}
	         js = d.createElement(s); js.id = id;
	         js.src = "https://apis.google.com/js/api:client.js?onload=ggStartApp";
	         fjs.parentNode.insertBefore(js,fjs);
        }(document, 'script', 'google-jssdk'));
        
        /*// 구글 */
    </script>
	<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
</html>