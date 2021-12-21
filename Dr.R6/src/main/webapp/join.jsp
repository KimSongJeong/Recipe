<%@page import="model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
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
		<p class="mainname" style="bottom: 50px; margin-top: 0px;">회원가입</p>
		</div>
		<div>
			<div class="textform">

				<div>
					<input type="text" id="id" name="id" class="id input1"
						placeholder="  ID 입력"> <input type="button" class="btn4"
						value="중복체크" onclick="idCheck()"> <span class="check"
						id="id_check"> </span>

				</div>


				<div>
					<input type="text" id="email" name="email" class="id input1 next"
						placeholder="  이메일 입력"> <input type="button" class="btn4"
						style="margin-top: 15px" value="중복체크" onclick="emailCheck()">
					<span class="check" id="email_check"> </span>
				</div>

				<input type="password" id="pw" name="pw" class="id2 input next"
					placeholder="  비밀번호 입력"> <input type="password"
					id="pw2" onchange="pw_check()" class="id2 input next" placeholder="  비밀번호 재입력"> 
					
					<input
					type="text" id="nick" name="nick" class="id2 input next"
					placeholder="  닉네임 입력">

				<div align="center" class="next">
					<input type="radio" id="man" name="gender" value="1" required
						checked /> <label for="man">남자</label> <input type="radio"
						id="woman" name="gender" value="0" required /> <label
						for="woman">여자</label>
				</div>

                <p class="mainname" style="margin-top: 35px; font-size: 20px;">내 건강상황에 해당되는<br>항목을 체크해주세요!</p>

                <div align="center" class="tdiv">
                    <table style="margin-top: 5%; margin-bottom: 0%;">
                      <tr class="checkbox" align="left">
                        <td class="td_font_size"><label><input type="checkbox" name="disease" value="당뇨"><span style="margin-left:8px;">당뇨</span></label></td>
                        <td><label><input type="checkbox" name="disease" value="고혈압"><span style="margin-left:8px;">고혈압</span></label></td>
                      </tr>
                      <tr class="checkbox" align="left">
                        <td><label><input type="checkbox" name="disease" value="위장"><span style="margin-left:8px;">위장병</span></label></td>
                        <td><label><input type="checkbox" name="disease" value="호흡기"><span style="margin-left:8px;">호흡기 질환</span></label></td>
                      </tr>
     <!--                  <tr class="checkbox" align="left">
                        <td><label><input type="checkbox" name="disease" value="해당없음"><span style="margin-left:8px;">해당없음</span></label></td> -->
                    </table>
                  </div>

				<div align="center" >
					<input type="submit" value="가입하기" class="btn3 next">
					<!--  <a href="join2.html" style="color:white;">다음으로</a>
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
					idcheck.innerHTML = "사용불가능한 아이디입니다 :p";
					idcheck.style.color="red";
					input.focus();
				}
				else{
					idcheck.innerHTML = "사용가능한 아이디입니다 XD";
					idcheck.style.color="blue";
				}
			},
			error: function(){
				alert("실패 !!!!");
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
					emailcheck.innerHTML = "사용불가능한 이메일입니다 :p";
					emailcheck.style.color="red";
					input2.focus();
				}
				else{
					emailcheck.innerHTML = "사용가능한 이메일입니다 XD";
					emailcheck.style.color="blue";
				}
			},
			error: function(){
				alert("실패 !!!!");
			}
		});
	}
</script>
<script>
	function pw_check(){
		var pw = document.getElementById("pw");
		var pw2 = document.getElementById("pw2");
		
		if(pw.value == pw2.value){
			alert("비밀번호가 일치합니다!");
		}else{
			alert("비밀번호가 일치하지 않습니다ㅜㅜ");
			pw2.focus();
		}
	}
</script>
</body>

</html>