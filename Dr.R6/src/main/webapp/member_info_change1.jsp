<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="EUC-KR">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보 수정1</title>
    <link rel="stylesheet" href="Handmade.css">

<style>
h4{
  font-weight:600;
  color: rgb(54, 54, 54);
  margin-top:10%;
  font-size: 19px;
}
</style>

</head>

<body width="100%" height="100%">

  <form action="UpdataConCheck" method="post" class="loginForm">
    <br>
    <a href="member_info.html" >
        <span class="backspace"> < </span>
      </a>

    <h4 align="center">본인확인을 위해 <br>비밀번호를 입력해주세요.</h4>

        <div class="idForm" align="center">

          <input type="password" name="pw" class="id" placeholder="  비밀번호 입력" style="margin-top: 15%;">
          <input type="submit" class="btn3" style="margin-top: 20%;"  value="확인">
          </div>
        </form>


    </body>
</html>