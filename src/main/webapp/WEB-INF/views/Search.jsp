<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
        <title></title>
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
                height: 200px; 
                margin: 0 auto;
                position: relative;
                border: 1px solid black; 
                width: 500px;
            }

            th, td{ 
                border-collapse: collapse;
                padding :1px;
                text-align : center;
		    }
		    
		    button{
		    	background-color: black; 
		    	margin:auto; 
		    	display:block; 
		    	cursor:pointer; 
		    	font-size: 16; 
		    	width:80px;
		    	height:40px; 
		    	color:white; 
		    	border-radius: 7px / 7px;
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
            <div id="logo" onclick="location.href='./HomePage'"><img src="./Logo1.png" alt="SiteLogo" width="80" height="80"></div>
                <div class="container"></div>
            </div>
            <div id="banner">
                <div class="container">${title}</div>
            </div>
            <div id="contents">
                <div class="container">
						<table>
							<tr>
								<td>${msg}</td>
							</tr>
							<tr>	
								<th valign= "top">${search}</th>		
							</tr>			
						</table>	
                     <button id="btn">확인</button>                            
                </div>
            </div>
            <div id="footer">
                <div class="container"></div>
            </div>
        </div>
    </body>

    <script>
		$('#btn').click(function() {
			var PwS = '<%=(String)session.getAttribute("PwS")%>';
	
	          if(PwS !="null"){ 
	        	  if("${title}" == "아이디 찾기"){
	        		  location.href='./loginPage';
	        	  }else{
	        		  console.log("세션확인")        		  
		        	  location.href='./PSN'
	        	  }
	          }
	          else{
	        	  location.href='./loginPage';
	          }
		});
	          
    </script>

</html>