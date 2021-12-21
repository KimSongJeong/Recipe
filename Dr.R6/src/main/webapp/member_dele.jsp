<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 탈퇴</title>
    <link rel="stylesheet" href="Handmade.css">

<style>
h4{
  font-weight:600;
  color: rgb(54, 54, 54);
  margin-top:10%;
  font-size: 19px;
}

.p1{
  font-weight:600;
  margin-left: 5%;
  color: rgb(71, 71, 71);
  font-size: 15px;
  margin-top: 40px;
}

.p2{
  font-weight:lighter;
  margin-left: 5%;
  color: rgb(66, 66, 66);
  font-size: 13px;
  margin-top: 15px;
}

</style>



</head>


<body width="100%" height="100%">
  
  
  
  
  
  <form action="DeleteCon" method="post" class="info2Form">
    <br>
    <a href="main.jsp" >
        <span class="backspace"> < </span>
      </a>
      <p class="mainname" style="bottom: 50px; margin-top: 0px;">회원탈퇴</p>

    <p class="p1">정말 탈퇴하시겠습니까?</p>

    <p class="p2">- 탈퇴 이후에는 사용된 문서와 사인, 도장을 확인할 수 <br>&nbsp&nbsp&nbsp 없습니다.</p>
    <p class="p2">- 유료로 구입하거나 무상으로 제공받은 요금제 및 이용권은 <br>&nbsp&nbsp&nbsp 복구, 환불되지 않습니다.</p>
    <p class="p2">- 개인정보 처리방침 제5조(개인정보의 보유 및 이용기간)<br>&nbsp&nbsp&nbsp 에 따른 특별한 경우, 한시적으로 개인정보를 보존합니다.</p>

        <div class="idForm" align="center">

          <input type="password" class="id" placeholder="  비밀번호 입력" style="margin-top: 10%;" name="pw">
          
          
          <input type="submit" class="btn3" style="margin-top: 10%;"  value="확인">
          </div>
        </form>


    </body>
</html>