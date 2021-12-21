<%@page import="model.MyrecipeDAO"%>
<%@page import="model.RecipeDTO"%>
<%@page import="model.RecipeDAO"%>
<%@page import="model.FoodDAO"%>
<%@page import="model.FoodDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.MyfoodDTO"%>
<%@page import="model.MyfoodDAO"%>
<%@page import="model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
UserDTO user = (UserDTO)session.getAttribute("login_User");
MyfoodDAO mf = new MyfoodDAO();
FoodDAO food = new FoodDAO();

ArrayList<String> dis = (ArrayList<String>)session.getAttribute("dis");
ArrayList<FoodDTO> food1 = new ArrayList<FoodDTO>();
ArrayList<FoodDTO> food2 = new ArrayList<FoodDTO>();
ArrayList<RecipeDTO> recipe = new ArrayList<RecipeDTO>();

recipe = (ArrayList<RecipeDTO>)session.getAttribute("recipe");
food1 = (ArrayList<FoodDTO>) session.getAttribute("food1");
food2 = (ArrayList<FoodDTO>) session.getAttribute("food2");


String[] nf;
nf = mf.select_not(user.getU_id());

int size = 0;

for (int i=0, j=1; i<5; i++, j++) {
	if(nf[i] != null){
		size++;
	}
}
int insert_idx=0; 
for (int i=0; i<5; i++) {
	if(nf[i] == null){
		insert_idx= i;
		break;
	}
}

if (size != 0){
	/* ���Դ� ���� ������ !  */
	food1 = food.food_custom(dis, mf.select_not(user.getU_id()));
	food2 = food.food_custom_season(dis, mf.select_not(user.getU_id()), (int)session.getAttribute("month"));
	session.setAttribute("food1", food1);
	session.setAttribute("food2", food2);
}else{
	/* ���Դ� ���� ������ ! */
	food1 = food.food_custom(dis);
	food2 = food.food_custom_season(dis, (int)session.getAttribute("month"));
	session.setAttribute("food1", food1);
	session.setAttribute("food2", food2);
}

RecipeDAO rec = new RecipeDAO();

recipe = rec.custom_recipe(dis, food1);
session.setAttribute("recipe", recipe);

MyrecipeDAO dao3 = new MyrecipeDAO();
ArrayList<Integer> myrecipe = dao3.select_recipe(user.getU_id());
session.setAttribute("Myrecipe", myrecipe);
session.setAttribute("notfood", mf.select_not(user.getU_id()));
%>



<!DOCTYPE html>
<html lang="en">

<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
<title>�˷���, ���Դ� ����</title>

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
/* 	position: relative; */
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

.food_tb {
	margin-top: 20px;
	background-color: rgb(240, 240, 240);
	border-radius: 11px;
}

.foodlist {
	width: 350px;
	text-align: center;
	border-radius: 10px;
	background-color: rgb(240, 240, 240);
}

.out {
	width: 50px;
	text-align: center;
	background-color: rgb(151, 188, 206);
	color: white;
	border-radius: 10px;
}

.foodlist_text {
	width: 350px;
	height: 50px;
	border-radius: 10px;
	border: rgba(0, 0, 0, 0);
	text-align: center;
}

.in {
	width: 50px;
	text-align: center;
	background-color: rgb(255, 94, 0);
	color: white;
	border-radius: 10px;
}
</style>
<script src="jquery-3.6.0.min.js"></script>
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

	<!-- ���� ��-->
	<hr>
	<br>
	<br>
	<div align="center">
		<div>
			<span class="test_font"
				style="font-weight: bold; font-size: 25px; color: rgb(85, 133, 89);">�˷���</span>
			<span class="test_font"
				style="font-weight: bold; font-size: 25px; color: rgb(65, 64, 64);">��
				���Դ�</span> <span class="test_font"
				style="font-weight: bold; font-size: 25px; color: rgb(65, 64, 64);">�����</span>
			<span class="test_font"
				style="font-weight: bold; font-size: 25px; color: rgb(65, 64, 64);">��
				�Է��ϼ���!</span>
		</div>

		<div align="center" style="margin-top: 3%; margin-bottom: 3%;">
			<span class="test_font"
				style="font-weight: bold; font-size: 17px; color: rgb(97, 97, 97);">
				<span><span style="font-weight:bold; color:black;">Dr.R</span>�� <%=user.getU_name() %>���� �Է��� ����Ḧ ������ ���� �����
					�����帳�ϴ�.
			</span>
			</span>
		</div>



		<!-- �Էµ� ����� ��� -->
		<% for (int i = 0 ; i< 5; i++) {
		if(nf[i]!=null){%>
		<form action="delete_notCon" method="post">
		<div align="center" style="margin-top: 50px;">
			<table class="test_font food_tb list">
				<tr>
					<td class="foodlist"><span class="test_font"
						style="font-size: 17px; font-weight: bold;"> 
							<%= nf[i] %>
					</span>
					<!-- �����ϰ��� �ϴ� ����� �̸��� ���������ؼ��� span�� name���ΰ� �ƴ϶� hidden�� ���,
					�ֳĸ� �̹�� �ƴϸ� �� null�� �� ���� �Ⱥ����� -->
					<input type="hidden" name="not" value="<%= nf[i] %>"></td>
					<input type="hidden" name="index" value="<%=i%>"></td>
					<td class="out">
						<!-- ���� ��� ����� ��-->
						<button>-</button>
					</td>
				</tr>
			</table>
		</div>
		</form>
		<%} %>
		<%} %>



		<!-- ���ο� ����� �Է��ϴ� ��-->
		<%if (size != 5) { %>
		<form action="update_notCon" method="post">
			<table class="test_font food_tb" style="margin-top:100px; margin-bottom:100px;">
				<tr>
					<td class="foodlist"><input type="text" class="foodlist_text"
						name="notfood" style="font-size: 17px; font-weight: 600;"
						placeholder="�߰��� ����Ḧ �Է��ϼ���" name="foodname"> </input>
						</td>
						<input type="hidden" name="size" value="<%=insert_idx%>">
					<td class="in"><button style="font-size: 17px; font-weight: 600;">�Է�</button></td>
				</tr>
			</table>
		</form>
		<!-- ���� 5�� �� �ԷµǸ� �Է�â ����� ����� ¾��!! -->
		<%}else { %>
		<div style="margin-bottom:100px"></div>
		<%} %>
		<p>
					<button class="btn" onclick="location.href='custom_ingredient.jsp'">���Ȯ��</button>
				</p>
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