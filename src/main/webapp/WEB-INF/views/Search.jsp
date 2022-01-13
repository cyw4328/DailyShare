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
            #wrap {text-align: center; font-size: 30px; color: #fff;}
            #header {height: 140px; line-height: 140px; background: #ffe1e4;}
            #banner {height: 80px; line-height: 100px; background: #fbd6e3; color: black; font-size: 16px;}
            #contents {height: 450px; line-height: 450px; background: #ead5ee;}
            #footer {height: 220px; line-height: 220px; background: #d6ebfd;}
                .container {width: 1100px; height: inherit; margin: 0 auto; background: rgba(0,0,0,0.1);}

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

		    
        </style>
    </head>
    <body class="no-drag">
        <div id="wrap">
            <div id="header">
                <div class="container">header</div>
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
								<th valign= "top">${IdS}${PwS}</th>		
							</tr>			
						</table>	
                     <button id="btn" onclick="location.href='./loginPage'">확인</button>                            
                </div>
            </div>
            <div id="footer">
                <div class="container">footer</div>
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