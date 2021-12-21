
<%@page import="model.RecipeDTO"%>
<%@page import="model.MyfoodDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Random"%>
<%@page import="model.FoodDAO"%>
<%@page import="model.FoodDTO"%>
<%@page import="java.util.Date"%>
<%@page import="model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<%
UserDTO user = (UserDTO) session.getAttribute("login_User");
Date time = new Date();
int month = time.getMonth() + 1;
session.setAttribute("month", month);

FoodDAO dao = new FoodDAO();
FoodDTO season = dao.seasonal_food(month);

ArrayList<FoodDTO> food1 = new ArrayList<FoodDTO>();
ArrayList<FoodDTO> food2 = new ArrayList<FoodDTO>();
ArrayList<RecipeDTO> recipe = new ArrayList<RecipeDTO>();

if (user != null) {
	recipe = (ArrayList<RecipeDTO>)session.getAttribute("recipe");
	food1 = (ArrayList<FoodDTO>) session.getAttribute("food1");
	food2 = (ArrayList<FoodDTO>) session.getAttribute("food2");
	

} else {
	food2 = dao.season_food(month);
}



%>
<!-- <script>
	if (user != null) {
		$("#mypage").attr("style", "display:flex");
	} else
		$("#mypage").attr("style", "display:none");
</script> -->



<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="euc-kr">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Title -->
<title>Dr.R</title>


<!-- Favicon -->
<link rel="icon" href="img/core-img/salad.png">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="style.css">
<script src="jquery-3.6.0.min.js"></script>
<style>
.row {
	display: flex;
}

#btn {
	position: relative;
	/* left: 40%; */
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
	margin-left: 20px;
	font-family: 'allfonts';
}
</style>

</head>




<body style="font-family: 'allfonts'">
	<!-- Preloader -->
	<div id="preloader">
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
					<!-- �˻� ��  -->
					<form action="UsearchCon" method="post">
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
									<li><a href="food_filter.jsp">����� ����</a></li>
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
	<hr>

	<section class="hero-area">
		<div class="hero-slides owl-carousel" align="center" style="padding: 50px 10px;">
			<!-- Single Hero Slide -->

			<!-- <div class="row"> -->

			<div class="single-hero-slide bg-img"
				style="background-image: url(<%=season.getFood_image()%>
            ); height:500px; width:90%;">

				<div class="container h-100">

					<!-- ���� ���� ��� ��ġ��-->
					<div class="row h-100 align-items-center" align="left">

						<div class="col-12 col-md-9 col-lg-7 col-xl-6">
							<!-- ���� ���� �Ӽ� -->
							<div class="hero-slides-content" style="margin-left: 50px;"
								data-animation="fadeInUp" data-delay="100ms">
								<!-- ������ ����� ��õ ��� 
                                ��ö ������ �������� �����Ͽ� �ش� ����� �󼼳��� ����ϱ�
                                span�±� ���� ������ �ش� ������ �ٲ��ָ� �� -->
								<h1 data-animation="fadeInUp" data-delay="300ms"
									style="color: white;">������ �����</h1>
								<h2 data-animation="fadeInUp" data-delay="300ms"><%=season.getFood_name()%></h2>
								<h6 data-animation="fadeInUp" data-delay="300ms"
									style="color: white;">
									��ö :
									<%=season.getFood_month()%>��
								</h6>
								<p data-animation="fadeInUp" data-delay="700ms"
									style="color: aliceblue;">
									<%=season.getFood_content()%>
								</p>
								<!-- ��ư�� ������ ������ �̵��� �� ����� �̸� �ѱ�� url �����ϱ� -->
								<a href="ingredient_page.jsp?name=<%=season.getFood_name()%>"
									class="btn delicious-btn" data-animation="fadeInUp"
									data-delay="1000ms">���� ����</a>
							</div>
						</div>
					</div>
				</div>
			</div>
	</section>

	<!-- ##### ������ ����� ��õ ���� ##### -->














	<!-- ##### ���� ������ ��õ ���� ##### -->
	<hr>
	<section class="small-receipe-area section-padding-80-0" style=" padding-top:0px;">
		<!-- �̰� �α��� ������ �г����� ��µǰ� , �α��� ���ϸ� �α��� �� ���񽺸� �̿��� �� �ִٴ� ���� ��� -->
		<div class="container">
			<%
			if (user == null) {
			%>
			<h5 class="test_font" align="center" style="font-size: 25px; margin-top:40px;">
				<span>�α����� �Ͻø� �ǰ��� ���� ������ ��õ�ص����!</span>
			</h5>
			<div align="center">
				<button id="btn" style="margin-left: 100px;"
					onclick="location.href='login.html'">�α���</button>
			</div>
			<%
			} else {
			%>
			<table>
			<div align="center" style="margin-top: 7%; margin-bottom: 7%;">
				<h5 class="test_font" align="center"
					style="font-size: 22px; margin-bottom: 3%;">�˷����� ���Դ� ����Ḧ
					�Է��ϼ��� :)</h5>
				<button id="btn" style="margin-left: 100px;"
						onclick="location.href='food_filter.jsp'">�Է��ϱ�</button>
					
					<hr>
					<h5 class="test_font" align="center"
					style="font-size: 22px; margin-top: 7%; margin-bottom: 3%;">����� �� ����Ḧ
					�Է��ϼ��� :)</h5>
				<button id="btn" style="margin-left: 100px;"
						onclick="location.href='ref_food.jsp'">�Է��ϱ�</button>
			</div>
			
			<hr>
			<br>

			<h5 class="test_font" align="center" style="font-size: 25px;"><span style="color:darkgreen;"><%=user.getU_name()%></span>
				<span>���� �ǰ��� ���� ������ ��õ�ص���� :D</span>
			</h5>
			<h5 align="center" style="margin-bottom: 50px;"></h5>
			<div class="row">

				<%
				int number_of_rec = 0;
				int ran = 0;
				if (food1.size() >= 3) {
					number_of_rec = 3;
				} else {
					number_of_rec = food1.size();
				}
				for (int i = 0; i < number_of_rec; i++) {
					int j = (new Random().nextInt(food1.size()));
					if (ran == j) {
						i--;
						continue;
					} else {
						ran = j;
					}
				%>
				<!-- ������/ ����� �� ����-->
				<div class="col-12 col-sm-6 col-lg-4 list1">
					<div class="single-small-receipe-area d-flex">
						<!-- Receipe Thumb -->

						<div class="receipe-thumb" style="padding: 0px">
							<img style="height: 100px;"
								src="<%=food1.get(j).getFood_image()%>" alt="">
						</div>
						<!-- Receipe Content -->
						<div class="receipe-content " style="padding-left: 10px">
							<br>
							<!-- ���� ���� ǥ��-->
							<span class="test_font" style="font-weight:bold; font-size:15px; color:red;"> <%
 if (food1.get(j).getFood_good() != null) {
 %> <%=food1.get(j).getFood_good()%> <%
 }
 %>
							</span>
							<!-- ���� ��-->
							<span class="test_font"
								style="font-weight: bold; font-size: 20px; color: black;"><%=food1.get(j).getFood_name()%></span>
							<a class="test_font"
								style="font-size: 11px; padding: 2px 3px; width: fit-content; background-color: #ececec; border-radius: 5px"
								href="ingredient_page.jsp?name=<%=food1.get(j).getFood_name()%>">�󼼺���</a>
						</div>
					</div>
				</div>
				<!-- ������/����� �� ����-->
<div class="col-12 col-sm-6 col-lg-4 list1">
					<div class="single-small-receipe-area d-flex">
						<!-- Receipe Thumb -->

						<div class="receipe-thumb" style="padding: 0px">
							<img style="height: 100px;"
								src="<%= recipe.get(j).getRecipe_img() %>" alt="">
						</div>
						<!-- Receipe Content -->
						<div class="receipe-content "
							style="padding-left: 10px; text-align: left;">
							<br>
							<!-- ���� ���� ǥ��-->
							<span class="test_font" style="font-weight:bold; font-size:15px;"> <% if(recipe.get(j).getRecipe_method() != null){%>
								<%= recipe.get(j).getRecipe_method()%> <%}%>
							</span>
							<!-- ���� ��-->
							<span class="test_font"
								style="font-weight: bold; font-size: 20px; color: black;"><%= recipe.get(j).getRecipe_name() %></span>
							<a class="test_font"
								style="font-size: 11px; padding: 2px 3px; width: fit-content; background-color: #ececec; border-radius: 5px"
								href="recipe_page.jsp?name=<%=recipe.get(j).getRecipe_name()  %>">�󼼺���</a>
						</div>
					</div>
				</div>


				<%
				}
				%>
				<!-- ������/����� �� ����-->
			</div>
			<div align="center">
				<button id="btn" style="margin-left: 100px;"
					onclick="location.href='custom_ingredient.jsp'">������</button>
			</div>
			<!-- ##### ���� ������ ��õ ���� ##### -->
			<%
			}
			%>









			<!-- ##### ��ö ����� ��õ ���� ##### -->
			<section class="small-receipe-area section-padding-80-0">
				<hr>
				<br> <br>
				<div class="container">
					<%
					if (user == null) {
					%>
					<h5 class="test_font" align="center" style="font-size: 25px;"><span><%=month%>���� ��ö ����Ό�� :D</span>
					</h5>
					<%
					} else {
					%>
					<h5 class="test_font" align="center" style="font-size: 25px;"><span style="color:darkgreen;"><%=user.getU_name()%></span>
						���� �ǰ��� ���� ��õ�ص帮�� <br><span><%=month%>���� ��ö ����Ό�� :D</span>

					</h5>
					<%
					}
					%>
					<h5 align="center" style="margin-bottom: 50px;"></h5>
					<div class="row">

						<%
						int j = 0;
						if (food2.size() < 6) {
							j = food2.size();
						} else {
							j = 6;
						}
						for (int i = 0; i < j; i++) {
						%>
						<!-- ������/ ����� �� ����-->
						<div class="col-12 col-sm-6 col-lg-4 list1">
							<div class="single-small-receipe-area d-flex">
								<!-- Receipe Thumb -->

								<div class="receipe-thumb" style="padding: 0px">
									<img style="height: 100px;"
										src="<%=food2.get(i).getFood_image()%>" alt="">
								</div>
								<!-- Receipe Content -->
								<div class="receipe-content " style="padding-left: 10px">
									<br>
									<!-- ���� ���� ǥ��-->
									<span class="test_font" style="font-weight:bold; font-size:15px"> <%
 if (food2.get(i).getFood_good() != null) {
 %> <%=food2.get(i).getFood_good()%> <%
 }
 %>
									</span>
									<!-- ���� ��-->
									<span class="test_font"
										style="font-weight: bold; font-size: 20px; color: black;"><%=food2.get(i).getFood_name()%></span>
									<a class="test_font"
										style="font-size: 11px; padding: 2px 3px; width: fit-content; background-color: #ececec; border-radius: 5px"
										href="ingredient_page.jsp?name=<%=food2.get(i).getFood_name()%>">�󼼺���</a>
								</div>
							</div>
						</div>
						<!-- ������/����� �� ����-->

						<%
						}
						%>
						<!-- ������/����� �� ����-->
					</div>
					<!-- <<div align="center"><button id="btn" style="margin-left: 100px;" onclick="location.href='custom_ingredient.html'">������</button></div>
 -->
					<div align="center">
						<%
						if (user == null) {
						%>
						<button id="btn" style="margin-left: 100px;"
							onclick="location.href='Season_products.jsp?month=<%=month%>'">������</button>
					</div>
					<%
					} else {
					%>
					<button id="btn" style="margin-left: 100px;"
						onclick="location.href='custom_season_ingredient.jsp?month=<%=month%>'">������</button>
					<%
					}
					%>
				</div>
			</section>


			<!-- ##### ��ö ����� ��õ ���� ##### -->








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









			<!-- js ���� �ε� -->
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