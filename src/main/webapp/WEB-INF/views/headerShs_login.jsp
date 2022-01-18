<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>

  <style>
   
 *{margin: 0 auto;}

#container{
    width: 1200px;    
}

#header{
    height: 60px;
    background-color: white;
    padding-top: 27px ; 
}

#logo{
    width: 100px;
    text-align: center;
    float: left;
    font-weight: bold;
    font-size: 25px;
}

#header nav {
    text-align: center;
    padding-top: 10px; 
    
    
}



.menubar .nav01 {
    list-style: none;
    float: left;
    text-align: center;
    color: #363636; 
    font-weight: bold;
    position: relative;
    top: 0px;
    left: 0px;
    width: 80px;

}


.menubar li ul { 
    background: rgb(109,109,109); 

}


.menubar li:hover{ 
    color: rgb(0, 112, 163);
    cursor: pointer;
}



#header .nav01 a{
    color: #363636;   
}



#header .nav01 a:visited{
    color: #363636;
}


.nav01:first-child{
    margin-left: 50px;
}



#serch{
    width: 148px;
    border-bottom: solid 1px #333333;
    height: 21px;
    float: right;
    margin-right:34px;
    border-left: 0;
    border-right: 0;
    border-top: 0;
       
}

/*로그인 회원가입 아이콘*/
#login_icon{
    width: 34px;
    height: 34px;
    margin-left: 16px;
    float: right;
    font-size: 12px;
    text-align: center;
    cursor: pointer;
    
}

#logout_icon{
    display: block;
    width: 34px;
    height: 34px;
    margin-left: 16px;
    float: right;
    text-align: center;
    cursor: pointer;
    font-size: 12px;
 }

#id_shs{
	float: right;
	cursor: pointer;
}

#id_shs:hover{
border-bottom:1px solid #black;
}

   
   </style>
</head>


<body style="overflow-x: hidden">
    <div id="container">
    <div id="header">
        <div id="logo"><a href="./MainPageShs" style="color: black;">LOGO</a></div>
        <nav>
            <div class="menubar"> 

                <ul>
                    <li class="nav01" onclick="location.href='./FeedPage'">피드</li>
                    <li class="nav01" onclick="location.href='./ForumBoard'">포럼</li>
                    <li class="nav01">MY블로그</li>
                </ul>
            </div>
                <!--로그인 레이어팝업 -->
                

                <a id="logout_icon" href="logoutShs">
                <img src="./img/jang_icon.jpg" onMouseOver="this.src='./img/jang_icon02.jpg'"
                onMouseOut="this.src='./img/jang_icon.jpg'"></a>
                
                <a id="login_icon"><img src="./img/login_icon.jpg" onMouseOver="this.src='./img/login_icon01.jpg'"
                    onMouseOut="this.src='./img/login_icon.jpg'"></a>
                
                <p id="id_shs">${loginId}</p>

            
        </nav>
        
        
    </div>
    <hr style="position: absolute; width: 100%; left: 0px; top: 80px; border-top : 1px solid rgb(226, 226, 226);">
    <div id="main">
        <div id="wrap">

        </div>
    </div>

</div>
</body>
	
</header>

</body>

</html>