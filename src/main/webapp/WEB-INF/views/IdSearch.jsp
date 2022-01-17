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
		    
		    #name, #phone, #email{
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
		    	border: 1px solid black; 
		    	cursor:pointer;
		    }
		    
		    #alert-danger-ids{
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
            <div id="logo" onclick="location.href='./HomePage'"><img src="./Logo1.png" alt="SiteLogo" width="80" height="80"></div>
                <div class="container"></div>
            </div>
            <div id="banner">
                <div class="container">아이디 찾기</div>
            </div>
            <div id="contents">
                <div class="container">
                	<form action="IdS" method="POST" onsubmit="return submitCheck();">
                        <table>
                            <!--이름-->
                            <tr>
                                <td><input type="text" placeholder="이름" id="name" name="userName"/></td>
                            </tr>
                            <!--전화번호-->
                            <tr>
                                <td><input type="text" placeholder="전화번호"  id="phone" name="userPhone"/></td>
                            </tr>
                            <!--이메일-->
                            <tr>
                                <td><input type="text" placeholder="이메일"  id="email" name="userEmail"/>
                                <div class="alert alert-danger" id="alert-danger-ids">입력하지 않은 항목이 있습니다.</div>
                                </td>
                            </tr>
                            <!--아이디 찾기-->
                            <tr>
                                <td><input type="submit"  style="background-color: black; margin:auto; display:block; cursor:pointer; font-size: 16; width:80px;height:40px; color:white; border-radius: 7px / 7px; "  value="확인"/></td>
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
    $("#alert-danger-ids").hide();
    var check = false;
    var inputName ="";
    var inputPhone ="";
    var inputEmail ="";
    $("input[name='userName']").keyup(function() {
    	inputName = $("input[name='userName']").val();
    	if (inputName != "" && inputPhone != "" && inputEmail != "") {
    			$("#alert-danger-ids").hide();
    			check = true;
    		} else {
    			$("#alert-danger-ids").show();
    			check = false;
    		}
    }); 
    
    $("input[name='userPhone']").keyup(function() {
    	inputPhone = $("input[name='userPhone']").val();
    	if (inputName != "" && inputPhone != "" && inputEmail != "") {
    			$("#alert-danger-ids").hide();
    			check = true;
    		} else {
    			$("#alert-danger-ids").show();
    			check = false;
    		}
    }); 
    
    $("input[name='userEmail']").keyup(function() {
    	inputEmail = $("input[name='userEmail']").val();
    	if (inputName != "" && inputPhone != "" && inputEmail != "") {
    			$("#alert-danger-ids").hide();
    			check = true;
    		} else {
    			$("#alert-danger-ids").show();
    			check = false;
    		}
    }); 

    
   		 function submitCheck() {
    	   if(check != true) {
    		   
    	   		return false;
			}	
    	  		return true
    	}
    </script>

</html>