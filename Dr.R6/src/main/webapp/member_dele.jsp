<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ȸ�� Ż��</title>
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
      <p class="mainname" style="bottom: 50px; margin-top: 0px;">ȸ��Ż��</p>

    <p class="p1">���� Ż���Ͻðڽ��ϱ�?</p>

    <p class="p2">- Ż�� ���Ŀ��� ���� ������ ����, ������ Ȯ���� �� <br>&nbsp&nbsp&nbsp �����ϴ�.</p>
    <p class="p2">- ����� �����ϰų� �������� �������� ����� �� �̿���� <br>&nbsp&nbsp&nbsp ����, ȯ�ҵ��� �ʽ��ϴ�.</p>
    <p class="p2">- �������� ó����ħ ��5��(���������� ���� �� �̿�Ⱓ)<br>&nbsp&nbsp&nbsp �� ���� Ư���� ���, �ѽ������� ���������� �����մϴ�.</p>

        <div class="idForm" align="center">

          <input type="password" class="id" placeholder="  ��й�ȣ �Է�" style="margin-top: 10%;" name="pw">
          
          
          <input type="submit" class="btn3" style="margin-top: 10%;"  value="Ȯ��">
          </div>
        </form>


    </body>
</html>