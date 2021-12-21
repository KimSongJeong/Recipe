<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기 페이지</title>
    <link rel="stylesheet" href="Handmade.css">
    <style>
      td{
        padding-right: 60px;
        padding-left: 60px;
      }
    
    </style>
    

</head>

<body width="100%" height="100%">
  
  <form action="idSeekCon" method="post" class="loginForm">

    <br>
    <a href="login.html" >
        <span class="backspace"> < </span>
      </a>
    <p class="mainname">아이디 찾기</p>
        <table>
          <tr>
            <td class="id_s" >
              <a href="search_id.html">아이디</a>
            </td>
            <td class="s_">
              <a href="search_pw3.html">비밀번호</a>
            </td>
          </tr>

        </table>
        <div class="idForm" align="center">
            <input type="text" class="id" name="email" placeholder="  이메일 입력">
            <input type="submit" class="btn2" value="아이디 찾기"><br>
            <span class="check"><%=request.getAttribute("message") %></span><br>
            <span class="check"><%=request.getAttribute("seekid") %></span><br>
            
           <!--   <span class="check"><%=request.getAttribute("email") %></span><br>-->
            
          </div>
        </form>


    </body>
</html>