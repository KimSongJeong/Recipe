<%@page import="model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% UserDTO User = (UserDTO)session.getAttribute("login_User"); %>




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="EUC-KR">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>���� ������</title>
    <link rel="stylesheet" href="Handmade.css">

<style>

h4{
  font-weight:600;
  color: rgb(54, 54, 54);
  font-size: 19px;
  margin-bottom: 10px;
}
.my_page{
  font-weight:600;
  color: rgb(22, 22, 22);
  font-size: 19px;
  margin-bottom: 10px;
}

h5{
  font-size: 15px;
  margin-bottom: 7px;
  color: rgb(68, 68, 68);
}


.mi_box{
  background-color: rgb(255, 231, 195);
  height: 120px;
  width: 300px;
  border-radius: 10px;
  margin-top: 20px;
}
</style>

  </head>


<body width="100%" height="100%">
  
  <form action="member_info_change2.html" method="post" class="member_infoForm" style="height:540px;">
    <br>
    <a href="main.jsp" >
        <span class="backspace"> < </span>
      </a>

    <h4 align="center">���� ������</h4>

        <div class="idForm" align="center">

        <div class="mi_box">

          <!-- �� ���̵�� �г����� �����κ��� �޾ƿ���-->
          <br>
          <br>
          
          <h5 style="font-size: 18px;"><%= User.getU_name() %>��</h5>
          <h5><%= User.getU_email() %></h5>
        </div>

        <br><br><br>
        <span><a class="my_page" href="like_list.jsp
          " style="color: rgb(61, 61, 61);">�� ���</a></span>
        <br><br>
        <span><a class="my_page" href="food_filter.jsp" style="color: rgb(61, 61, 61);">����� ����</a></span>
        <br><br>
        <span><a class="my_page" href="member_info_change1.jsp" style="color: rgb(61, 61, 61);">ȸ������ ����</a></span>
        <br><br>
        <span><a class="my_page" href="member_dele.jsp" style="color: rgb(61, 61, 61);">ȸ�� Ż��</a></sp>
        <br><br>
		<span><a class="my_page" href="#
          " style="color: rgb(61, 61, 61);">��� ���</a></span>
        <br><br>
          </div>


    </body>
</html>