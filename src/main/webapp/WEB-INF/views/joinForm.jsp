<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
   <link rel="stylesheet" type="text/css" href="resources/css/commonHS.css">
   <style></style>
</head>
<body>
<div class="container">
        <form action="/joinForm">
            <h2>Daily Share</h2>
                <Table>
                    <tr>
                        <th>ID</th>
                        <td><input type="text" name="id" class = "joinCL" placeholder="6~20글자를 입력하세요" style="border-bottom: 1px solid #ccc;"/><button>중복체크</button></td>
                        
                    </tr>
                    <tr>
                        <th>PW</th>
                        <td><input type="password" name="pw" class = "joinCL" placeholder="6~20글자를 입력하세요" style="border-bottom: 1px solid #ccc;"/></td>
                    </tr>
                    <tr>
                        <th>PW 확인</th>
                        <td><input type="password" name="repw" class = "joinCL"  style="border-bottom: 1px solid #ccc;"/></td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td><input type="text" name="name" class = "joinCL"  style="border-bottom: 1px solid #ccc;"/></td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td><input type="text" name="phone" class = "joinCL"  placeholder=" '-' 를 입력해 주세요 "  style="border-bottom: 1px solid #ccc;"/></td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td><input type="text" name="email" class = "joinCL" style="border-bottom: 1px solid #ccc; "/><button id="mailCheck">메일발송</button></td>
                    </tr>
                    <tr>
                        <th>인증번호</th>
                        <td><input type="text" name="ecode" class = "joinCL"  style="border-bottom: 1px solid #ccc;" /><button>인증확인</button></td>
                    </tr>
                    <tr>
                        <th>블로그이름</th>
                        <td><input type="text" name="bname" class = "joinCL"  style="border-bottom: 1px solid #ccc;"/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="checkbox" checked>개인정보동의(필수)</td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="회원가입" id="btn-join"></td>
                    </tr>
            </Table>
        </form>
        </div>
        <!-- 인증번호 확인 -->
      <div class="alert alert-success" id="alert-success-email">인증번호가 일치합니다.</div>
      <div class="alert alert-danger" id="alert-danger-email">인증번호가 일치하지 않습니다.</div>
    </div>

</body>
<script>
$("#alert-success-email").hide();
$("#alert-danger-email").hide();



var check = false;

//회원가입 버튼 클릭
$("#btn-join").on("click", function(e) {
   e.preventDefault();
   var id = $("input[name='id']").val();
   var pw = $("input[name='pw']").val();
   var repw = $("input[name='repw']").val();
   var name = $("input[name='name']").val();
   var phone = $("input[name='phone']").val();

   var bname = $("input[name='bname']").val();
   
   
   console.log("회원가입_아이디: "+id);
   console.log("회원가입_이름: "+name);
   console.log("회원가입_비밀번호: "+pw);
   
   
   //아이디,비밀번호 유효성 검사
   if (id == null || id == "") { 
      alert("아이디를 입력해주세요");
      return false;
   } 
   if (pw == null || pw == "") { 
      alert("비밀번호를 입력해주세요");
      return false;
   } 
   if (repw == null || repw == "") { 
      alert("비밀번호 확인을 입력해주세요");
      return false;
   } 
   if (name == null || name == "") { 
      alert("이름을 입력해주세요");
      return false;
   } 
   if (phone == null || phone == "") { 
      alert("전화번호를 입력해주세요");
      return false;
   } 

   if (check == false) { 
      alert("인증번호를 확인 해주세요");
      return false;
   } 

   if (bname == null || bname == "") { 
      alert("블로그 이름을 입력해주세요");
      return false;
   } 
   
   $("form").submit();
   
   
});

asdf
//인증번호를 저장할 변수
var code = "";

      //인증번호 이메일 전송
$("#mailCheck").on("click",function(e){
   console.log('버튼확인');
   
   e.preventDefault();
   var email = $("input[name='email']").val();
   var ecode = $("input[name='ecode']");
   
   $.ajax({
      type:"GET",
      url : "mailCheck",
      data : {email : email},
      contentType :"text/plain;charset=UTF-8",
      success : function(data){ //인증번호를 가져옴
         
         //checkBox.val(''); // 기존에 값이 있었으면 지워줌
         $("#alert-success-email").hide();
         $("#alert-danger-email").hide();
         check = false;
         code = data; // 인증번호를 변수에 저장
      }
   });
});

</script>
</html>