<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
        <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
        <link rel="icon" href="./icon.png">
        <style type="text/css">
            
            /*드래그 금지*/
            .no-drag {-ms-user-select: none; -moz-user-select: -moz-none; -webkit-user-select: none; -khtml-user-select: none; user-select:none;} 

            /*레이아웃*/
            * {margin: 0; padding: 0;}
            #wrap {text-align: center; font-size: 30px; color: #fff;}
            #header {height: 140px; line-height: 140px; background: #ffe1e4;}
            #banner {height: 80px; line-height: 100px; background: #fbd6e3; color: black; font-size: 16px;}
            #contents {height: 450px; line-height: 450px; background: #ead5ee;}
            #footer {height: 220px; line-height: 220px; background: #d6ebfd;}
                .container {width: 1100px; height: inherit; margin: 0 auto; background: rgba(0,0,0,0.1);}

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
		    
		    #pwCheck, #pw{
		    	width:290px;
		    	height:40px; 
		    	font-size:13px; 
		    	padding-left: 10px; 
		    	border: 1px solid gray; 
		    	border-radius: 3px / 3px;
		    }
		    
        </style>
    </head>
    <body class="no-drag">
        <div id="wrap">
            <div id="header">
                <div class="container">header</div>
            </div>
            <div id="banner">
                <div class="container">비밀번호 찾기</div>
            </div>
            <div id="contents">
                <div class="container">
                	<form action="PwChange" method="post">
                        <table>
                            <!--pw-->
                            <tr>
                                <td><input type="password" placeholder="새로운 비밀번호"  id="pw" name="userPass"/></td>
                            </tr>
                            <!--pwCheck-->
                            <tr>
                                <td><input type="password" placeholder="비밀번호 확인"  id="pwCheck" name="userPassCheck"/>

      							</td>
                            </tr>
                            <!--change-->
                            <tr>
                                <td><input type="submit"  style="background-color: black; margin:auto; display:block; cursor:pointer; font-size: 16; width:80px;height:40px; color:white; border-radius: 7px / 7px;"  value="확인"/></td>
                            </tr>
                        </table>
                	</form>
                </div>
            </div>
            <div id="footer">
                <div class="container">footer</div>
            </div>
        </div>
    </body>

    <script>
    
    
    </script>

</html>