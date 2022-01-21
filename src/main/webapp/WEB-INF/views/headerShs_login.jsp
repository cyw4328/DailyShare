<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>

  <style>
   
 *{margin: 0 auto;}

#container{
    width: 1250px;    
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

.menubar li:last-child{ 
    margin-left:6px;

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
    margin-left: 40px;
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

.iconSize{
   width: 20px;
}

.writeBtn{
   float:right; 
   margin-right:10px; 
   background-color:black; 
   color:#FFF; 
   font-weight:bold; 
   border:0px;
   padding:3px 10px;
   border-radius: 20px;
   cursor: pointer;
}

#gongji{
   max-width: 200px;
      text-overflow: ellipsis;
      font-size:13px;
   white-space: nowrap;
   margin-left:0px;
   padding-left:-20px;
   font-weight: normal;
   cursor: pointer;
}
#gongji:hover{
border-bottom:1px solid black;
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
                    <a href="./csj_blogMain?mem_id=${loginId}" id = "myBlogck"><li class="nav01" >MY블로그</li></a>
                    <li class="nav01" ><img src="resources/images/gongji_icon.png" class = "iconSize"></li>
                    <li class="nav01" id="gongji"></li>
                </ul>
            </div>
                <!--로그인 레이어팝업 -->
                

                <span id="logout_icon"><a href="./logoutShs">
                <img src="resources/images/logout_icon.png" class = "iconSize"></a></span>
                
                <span id="login_icon"><a href="./MyAlrimPage"><img src="resources/images/bell_icon.png" class = "iconSize"></a></span>
                <a href="./memberPassCk"><p id="id_shs">${loginId}</p></a>
            <a href="./csj_writeForm"  target ="_blank" ><button class ="writeBtn">글쓰기</button></a>
            <a href="./managerPage"  target ="_blank" class="adminLink" ><button class ="writeBtn">관리자페이지</button></a>
            
        </nav>
        
        
    </div>
    <hr style="position: absolute; width: 100%; left: 0px; top: 85px; border-top : 1px solid rgb(226, 226, 226);">


</div>
</body>
<script>


$('.adminLink').children().hide();


var login = '${loginId}';

if(login == null ||login == ''){
   $('#myBlogck').hide();
   $('.writeBtn').hide();
   
   $('#logout_icon').html('<a href="./shs"><img src="resources/images/icon_join.png" class = "iconSize"></a>');
   $('#login_icon').html('<a href="./loginPage"><img src="resources/images/icon_login.PNG" class = "iconSize"></a>');
};

if(login != null || login != ''){
   
   $.ajax({
      type:'GET',
      url:'adminCk',
      data:{"adminLogin":login},
      dataType:'JSON',
      success:function(data) {
         console.log(data.adminCk);
         if(data.adminCk==1){
            console.log('관리자회원');
            $('.adminLink').children().show();
         }
         
         
      },
      error:function(e) {
         console.log(e);
      }
   });
}


$.ajax({
    type:'POST',
    url:'MainGongJi',
    data:{},
    dataType:'JSON',
    success:function(data) {
       console.log(data.gongji);
       GongJi(data.gongji);
  
    },
    error:function(e) {
       console.log(e);
    }
 });
 
function GongJi(gongji) {
	var content = '';

	for (var i = 0; i < 1; i++) {
		
			content += '<a href="./csj_detail?board_num='+gongji[i].board_num+'&mem_id='+gongji[i].mem_id+'" style="cursor:hand">'+gongji[i].board_subject+'</a>';
	}/* gongji[i].board_subject */
	$('#gongji').append(content);
};
 
 
 

</script>

</html>