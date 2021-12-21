<%@page import="model.UserDTO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="model.FoodDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.FoodDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	response.setCharacterEncoding("euc-kr");
	UserDTO user = (UserDTO) session.getAttribute("login_User");
	String month = request.getParameter("month");

	ArrayList<FoodDTO> food = new ArrayList<FoodDTO>();
	FoodDAO dao = new FoodDAO();
	
	
	if (month != null) {
		int mon = Integer.parseInt(month);
		food = dao.season_food(mon);
	}else{
		int mon = 1;
		food = dao.season_food(mon);
	}
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="EUC-KR">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="jquery-3.6.0.min.js"></script>
<!-- Title -->
<title>��ö ��깰</title>

<!-- Favicon -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Core Stylesheet -->

<link rel="stylesheet" href="style.css">
<style>
.row {
	display: flex;
}

button {
	all: unset;
}

.btn {
	position: relative;
	left: 40%;
	transform: translateX(-50%);
	margin-bottom: 40px;
	width: 100px;
	height: 40px;
	background: rgb(244, 105, 19);
	color: white;
	font-weight: bold;
	border: none;
	cursor: pointer;
	transition: 0.4s;
	display: inline;
	border-radius: 12px;
	margin-left: 50px;
	font-size: 16px;
	padding: 3px 5px;
}

.btn10 {
	position: relative;
	left: 50%;
	line-height: 60px;
	transform: translateX(-50%);
	width: 60px;
	height: 60px;
	background: #f3f5f8;
	color: rgb(0, 0, 0);
	font-weight: bold;
	border: none;
	/* cursor: pointer; */
	/* transition: 0.4s; */
	/* display: inline; */
	font-size: 15px;
}

.list1 {
	/* visibility: hidden; */
	display: none;
	/* display: ; */
}
</style>
<script src="jquery-3.6.0.min.js"></script>
<script>
	let num1 = 0;
	let num2 = 8;
	$(function() {
		$(".list1").slice(num1, num2).attr("style", "display:flex");
		$("#load").click(function() {
			num1 += 8;
			num2 += 8;
			if (num1 <= $(".list1").length) {
				console.log("Ŭ����");
				$(".list1").slice(num1, num2).attr("style", "display:flex");
			}

			else {
				$("#load").attr("style", "display:none");
				alert("���̻� �����ϴ� !!! ");
			}
		});
	});
</script>

</head>


<body style="font-family: 'allfonts'">

	<!-- ������ ��ǥ �̹��� -->
	<div id="preloader" algin="center">
		<i class="circle-preloader"></i> <img src="img/core-img/salad.png"
			alt="">
	</div>

	<!-- �˻�â -->
	<div class="search-wrapper">
		<!-- Close Btn -->
		<div class="close-btn">
			<i class="fa fa-times" aria-hidden="true"></i>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<form action="#" method="post">
						<input type="search" name="search"
							placeholder="Type any keywords...">
						<button type="submit">
							<i class="fa fa-search" aria-hidden="true"></i>
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- ##### ��� ���� �κ�/ ���� ���� ���ÿ� ##### -->
	<header class="header-area">




		<!-- �޴����� ���� -->
		<div class="delicious-main-menu">
			<div class="classy-nav-container breakpoint-off">
				<div class="container">
					<!-- �޴� / ������ -->
					<nav class="classy-navbar justify-content-between"
						id="deliciousNav">

						<!-- �ΰ� -->
						<a class="nav-brand" href="main.jsp"><img
							src="img/core-img/logo.png" alt=""></a>

						<!-- Navbar Toggler -->
						<div class="classy-navbar-toggler">
							<span class="navbarToggler"><span></span><span></span><span></span></span>
						</div>

						<!-- �޴� / ����� ȭ�� 3�� ��ư ���� -->
						<div class="classy-menu">

							<!-- �޴� / ����� ȭ�� 3�� ��ư �ݱ� -->
							<div class="classycloseIcon">
								<div class="cross-wrap">
									<span class="top"></span><span class="bottom"></span>
								</div>
							</div>

							<!-- �޴� ���� -->
							<div class="classynav">
								<ul>

									<!-- �� �� �޴� -->

									<%
									if (user != null) {
									%>
									

									<li><a href="custom_ingredient.jsp">���� ��õ</a></li>
									<%
									}
									%>

									<li><a href="Season_products.jsp">��ö �����</a></li>
									<li><a href="Disease_high_blood_pressure.jsp">���� ����</a></li>
									<li><a href="Guide.jsp">�̿� �ȳ�</a></li>
									<%
									if (user == null) {
									%>
									<!-- �α��� -->
									<li><a href="login.html"
										style="background-color: rgb(236, 236, 236);">�α���</a></li>

									<!-- ȸ������ -->
									<li><a href="join.jsp"
										style="background-color: rgb(236, 236, 236);">ȸ������</a></li>

									<!-- �˻� -->
									<%
									} else {
									%>
									<li id="mypage"><a href="member_info.jsp">���� ������</a></li>
									<li><a href="logout.jsp"
										style="background-color: rgb(236, 236, 236);">�α׾ƿ�</a></li>
									<%
									}
									%>
									<li>
										<div class="search-btn"
											onclick="location.href='search_main_page.jsp'">
											<i class="fa fa-search" aria-hidden="true"
												style="font-size: 30px;"></i>
										</div>
									</li>
							</div>
							<!-- �޴����� �� -->
						</div>

					</nav>
				</div>
			</div>
		</div>
		<!-- �޴����� �� -->
	</header>
	<!-- ##### ��� ���� �κ� / �������� ���ÿ� ##### -->
	<form action="SeasonfoodCon" method="post">
		<!-- ���� ��-->
		<hr>
		<div align="center">
			<table class=>
				<tr>
					<ul style="text-align: center;">
						<td><span class="test_font" style="font-weight: bold;">
								<%if (month == null){ %> 1 <%} else{ %> <%=month %> <%} %>
						</span> <span class="test_font"
							style="font-weight: bold; margin-right: 30px;">���� ����깰</span></td>
						<td><select class="test_dropdown" style="background: violet;"
							name="month">
								<option value="1">1��</option>
								<option value="2">2��</option>
								<option value="3">3��</option>
								<option value="4">4��</option>
								<option value="5">5��</option>
								<option value="6">6��</option>
								<option value="7">7��</option>
								<option value="8">8��</option>
								<option value="9">9��</option>
								<option value="10">10��</option>
								<option value="11">11��</option>
								<option value="12">12��</option>
						</select></td>
						<td><input type="submit" value="����" class="btn10"></td>
					</ul>
				</tr>
			</table>
		</div>
	</form>




	<!-- ##### ���� ������ ��õ ���� ##### -->
	<hr>

	<section class="small-receipe-area ">
		<div class="container">
			<h5 align="center" style="margin-bottom: 50px;"></h5>
			<div class="row">

				<% for (int i=0; i < food.size(); i++){	%>
				<!-- ������/ ����� �� ����-->
				<div class="col-12 col-sm-6 col-lg-4 list1">
					<div class="single-small-receipe-area d-flex">
						<!-- Receipe Thumb -->

						<div class="receipe-thumb" style="padding: 0px">
							<img style="height: 100px;"
								src="<%= food.get(i).getFood_image() %>" alt="">
						</div>
						<!-- Receipe Content -->
						<div class="receipe-content " style="padding-left: 10px">
							<br>
							<!-- ���� ���� ǥ��-->
							<span class="test_font" style="font-weight:bold; font-size:15px"> <% if(food.get(i).getFood_good() != null){%>
								<%= food.get(i).getFood_good()%> <%}%>
							</span>
							<!-- ���� ��-->
							<span class="test_font"
								style="font-weight: bold; font-size: 20px; color: black;"><%= food.get(i).getFood_name() %></span>
							<a class="test_font"
								style="font-size: 11px; padding: 2px 3px; width: fit-content; background-color: #ececec; border-radius: 5px"
								href="ingredient_page.jsp?name=<%= URLEncoder.encode(food.get(i).getFood_name(), "euc-kr")%>">�󼼺���</a>
						</div>
					</div>
				</div>
				<!-- ������/����� �� ����-->

				<% } %>




			</div>
			<p>

				<button id="load" class="btn">������</button>
				<%-- 			<% if (food != null){ %>
			<script>
			$("#load").css("visibility","hidden");
			</script>
			<%} %> --%>
			</p>


			<!-- �ǵ���� �ϴ� �� -->
		</div>
		</div>



		</div>

		</div>

		</div>


		</div>
		</div>
		</div>
		<!-- ##### Blog Area End ##### -->

		<!-- ���� ���ۺκ� -->
		<!-- ##### Footer Area Start ##### -->
		<footer class="footer-area">
			<div class="container h-100">
				<div class="row h-100">
					<div
						class="col-12 h-100 d-flex flex-wrap align-items-center justify-content-between">
						<!-- Footer Logo -->
						<div class="footer-logo">
							<a href="main.jsp"><img src="img/core-img/logo.png" alt=""></a>
						</div>
						<!-- Copywrite -->
						<p>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Dr.R &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							| Project Team : 2X4=8 | Made By - ksj,kmj,hjg, kdh
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
					</div>
				</div>
			</div>
		</footer>
		<!-- ##### Footer Area Start ##### -->






		<!-- ##### All Javascript Files ##### -->
		<!-- jQuery-2.2.4 js -->
		<script src="js/jquery/jquery-2.2.4.min.js"></script>
		<!-- Popper js -->
		<script src="js/bootstrap/popper.min.js"></script>
		<!-- Bootstrap js -->
		<script src="js/bootstrap/bootstrap.min.js"></script>
		<!-- All Plugins js -->
		<script src="js/plugins/plugins.js"></script>
		<!-- Active js -->
		<script src="js/active.js"></script>
</body>

</html>