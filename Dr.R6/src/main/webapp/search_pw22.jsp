<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>��й�ȣ ã�� ������</title>
    <link rel="stylesheet" href="Handmade.css">
<style>
  td{
    padding-right: 60px;
    padding-left: 60px;
  }

</style>

</head>

<body width="100%" height="100%">
  
  <form action="pwSeekCon" method="post" class="loginForm">

    <br>
    <a href="login.html" >
        <span class="backspace"> < </span>
      </a>
    <p class="mainname">��й�ȣ ã��</p>
        <table>
          <tr>
            <td class="s_">
              <a href="search_id.html">���̵�</a>
            </td>
            <td>
              <a href="search_pw.html">��й�ȣ</a>
            </td>
          </tr>

        </table>
        <div class="idForm" align="center">
          <input type="text" class="id" name = "id" placeholder="  ���̵� �Է�">
          <br>
          <br>
          <input type="text" class="id" name = "email" placeholder="  �̸��� �Է�">
            <input type="submit" class="btn2" value="��й�ȣ ã��"><br>
            <span class="check"><%=request.getAttribute("message") %></span><br>
            <span class="check"><%=request.getAttribute("seekpw") %></span><br>

            
            
            
          </div>
        </form>
    </body>
</html>