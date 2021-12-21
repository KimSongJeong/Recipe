<%@page import="model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ȸ������</title>
<link rel="stylesheet" href="Handmade.css">
<script src="jquery-3.6.0.min.js"></script>
<style>

.joinForm {
  position:absolute;
  width:350px;
  height:750px;
  padding: 30px, 20px;
  background-color:#ffffff;
  top:40%;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 10px;
  margin-top: 10%;
}

td{
  font-size: 15px;
  font-weight: 600;
  color: rgb(54, 54, 54);
}

.input1 {
	margin-left: 20px;
	width: 300px;
}

.input {
	margin-left: 20px;
}

.next {
	margin-top: 15px;
}

.butn {
	width: 55px;
	padding: 0px 5px;
	margin: 0px;
	background-color: lightgrey;
	color: rgb(78, 76, 76);
	font-size: 11px;
}

.butn2 {
	width: 10%;
	height: 100%;
	border: 0px;
	outline: none;
	float: right;
	border-radius: 5px;
	font-weight: bold;
	background-color: lightgrey;
	color: rgb(78, 76, 76);
	font-size: 12px;
}


.check {
	margin-left: 30px;
	font-size: 13px;
	color:black;
}
</style>

</head>

<body width="100%" height="100%">

	<form action="joinCon" method="post" class="joinForm">
		<br> <a href="login.html"> <span class="backspace"> <
		</span>
		</a>
		<p class="mainname" style="bottom: 50px; margin-top: 0px;">ȸ������</p>
		</div>
		<div>
			<div class="textform">

				<div>
					<input type="text" id="id" name="id" class="id input1"
						placeholder="  ID �Է�"> <input type="button" class="btn4"
						value="�ߺ�üũ" onclick="idCheck()"> <span class="check"
						id="id_check"> </span>

				</div>


				<div>
					<input type="text" id="email" name="email" class="id input1 next"
						placeholder="  �̸��� �Է�"> <input type="button" class="btn4"
						style="margin-top: 15px" value="�ߺ�üũ" onclick="emailCheck()">
					<span class="check" id="email_check"> </span>
				</div>

				<input type="password" id="pw" name="pw" class="id2 input next"
					placeholder="  ��й�ȣ �Է�"> <input type="password"
					id="pw2" onchange="pw_check()" class="id2 input next" placeholder="  ��й�ȣ ���Է�"> 
					
					<input
					type="text" id="nick" name="nick" class="id2 input next"
					placeholder="  �г��� �Է�">

				<div align="center" class="next">
					<input type="radio" id="man" name="gender" value="1" required
						checked /> <label for="man">����</label> <input type="radio"
						id="woman" name="gender" value="0" required /> <label
						for="woman">����</label>
				</div>

                <p class="mainname" style="margin-top: 35px; font-size: 20px;">�� �ǰ���Ȳ�� �ش�Ǵ�<br>�׸��� üũ���ּ���!</p>

                <div align="center" class="tdiv">
                    <table style="margin-top: 5%; margin-bottom: 0%;">
                      <tr class="checkbox" align="left">
                        <td class="td_font_size"><label><input type="checkbox" name="disease" value="�索"><span style="margin-left:8px;">�索</span></label></td>
                        <td><label><input type="checkbox" name="disease" value="������"><span style="margin-left:8px;">������</span></label></td>
                      </tr>
                      <tr class="checkbox" align="left">
                        <td><label><input type="checkbox" name="disease" value="����"><span style="margin-left:8px;">���庴</span></label></td>
                        <td><label><input type="checkbox" name="disease" value="ȣ���"><span style="margin-left:8px;">ȣ��� ��ȯ</span></label></td>
                      </tr>
     <!--                  <tr class="checkbox" align="left">
                        <td><label><input type="checkbox" name="disease" value="�ش����"><span style="margin-left:8px;">�ش����</span></label></td> -->
                    </table>
                  </div>

				<div align="center" >
					<input type="submit" value="�����ϱ�" class="btn3 next">
					<!--  <a href="join2.html" style="color:white;">��������</a>
          </button> -->
				</div>
				</table>
			</div>
		</div>
	</form>

	<script>
	function idCheck(){
		var input = document.getElementById("id");
		
		$.ajax({
			type:"post",
			data:{"u_id": input.value},
			url: "idCheckCon",
			dataType:"text",
			success: function(data){
				var idcheck = document.getElementById("id_check");
				if(data == "true"){
					idcheck.innerHTML = "���Ұ����� ���̵��Դϴ� :p";
					idcheck.style.color="red";
					input.focus();
				}
				else{
					idcheck.innerHTML = "��밡���� ���̵��Դϴ� XD";
					idcheck.style.color="blue";
				}
			},
			error: function(){
				alert("���� !!!!");
			}
		});
	}
	
	function emailCheck(){
		var input2 = document.getElementById("email");
		
		$.ajax({
			type:"post",
			data:{"u_email": input2.value},
			url: "emailCheckCon",
			dataType:"text",
			success: function(data1){
				var emailcheck = document.getElementById("email_check");
				if(data1 == "true"){
					emailcheck.innerHTML = "���Ұ����� �̸����Դϴ� :p";
					emailcheck.style.color="red";
					input2.focus();
				}
				else{
					emailcheck.innerHTML = "��밡���� �̸����Դϴ� XD";
					emailcheck.style.color="blue";
				}
			},
			error: function(){
				alert("���� !!!!");
			}
		});
	}
</script>
<script>
	function pw_check(){
		var pw = document.getElementById("pw");
		var pw2 = document.getElementById("pw2");
		
		if(pw.value == pw2.value){
			alert("��й�ȣ�� ��ġ�մϴ�!");
		}else{
			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ٤̤�");
			pw2.focus();
		}
	}
</script>
</body>

</html>