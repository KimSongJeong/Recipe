<%@page import="model.FoodDAO"%>
<%@page import="model.RecipeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.MyfoodDAO"%>
<%@page import="model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
    UserDTO user = (UserDTO)session.getAttribute("login_User");
    MyfoodDAO mf = new MyfoodDAO();
    String[] nf;
    nf = mf.select_no(user.getU_id());

    FoodDAO dao = new FoodDAO();
    
	ArrayList<RecipeDTO> recipe = (ArrayList<RecipeDTO>)session.getAttribute("recipe");
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
<title>����� ����</title>

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
	/* position: relative; */
	/* left: 40%; */
	/* transform: translateX(-50%); */
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
	/* margin-left: 50px; */
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
<script>
        let num1 = 0;
        let num2 = 6;
        $(function () {
            $(".list1").slice(num1, num2).attr("style", "display:flex");
            $("#load").click(function () {
                num1 += 6;
                num2 += 6;
                if (num1 < $(".list1").length) {
                    console.log("Ŭ����");
                    $(".list1").slice(num1, num2).attr("style", "display:flex");
                }

                else {
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

	<!-- ���� ��-->
	<hr>
	<div>
		<ul style="text-align: center;">
			<a class="test_font" style="font-size: 30px;"
				href="custom_ingredient.jsp">�����</a> &nbsp&nbsp
			<a class="test_font"
				style="font-size: 30px; border-bottom: 2px solid #adadad;"
				href="custom_recipe.jsp">������</a>
		</ul>
	</div>
	<br>
	</div>
	<div>
		<ul style="text-align: center;">
			<a class="test_font1" style="font-size: 17px; "
				href="custom_recipe.jsp">�ǰ� ����</a> &nbsp&nbsp &nbsp&nbsp

			<a class="test_font1"
				style="font-size: 17px; border-bottom: 2px solid #adadad;"
				href="ref_food.jsp">����� ����</a>
		</ul>

	</div>
	<br>
	<hr>
	<br>
	<div align="center">
		<div>
			<span class="test_font"
				style="font-weight: bold; font-size: 25px; color: rgb(85, 133, 89);">�����</span>
			<span class="test_font"
				style="font-weight: bold; font-size: 25px; color: rgb(65, 64, 64);">��
			</span> <span class="test_font"
				style="font-weight: bold; font-size: 25px; color: rgb(65, 64, 64);">�����</span>
			<span class="test_font"
				style="font-weight: bold; font-size: 25px; color: rgb(65, 64, 64);">��
				�Է��ϼ���!</span>
		</div>

		<div align="center" style="margin: 3% 0px;">
			<span class="test_font"
				style="font-weight: bold; font-size: 17px; color: rgb(97, 97, 97);">
				<span><span style="font-weight:bold; color:black;">Dr.R</span>�� <%=user.getU_name() %>���� �Է��� ����Ḧ �̿��� <span style="color:#024871; font-weight:bold; font-size:30px;">�ǰ� ���� </span>�丮�����Ǹ�
					�˷������ XD
			</span>
			</span>
		</div>



		<!-- �Էµ� ����� ��� -->
		<% for (int i = 0 ; i< 5; i++) {
      if(nf[i]!=null){%>
		<form action="deleteRefCon" method="post">
			<div align="center" style="margin-top: 50px;">
				<table class="test_font food_tb list">
					<tr>
						<td class="foodlist"><span class="test_font"
							style="font-size: 17px; font-weight: bold;"> <%= nf[i] %>
						</span> <!-- �����ϰ��� �ϴ� ����� �̸��� ���������ؼ��� span�� name���ΰ� �ƴ϶� hidden�� ���,
               �ֳĸ� �̹�� �ƴϸ� �� null�� �� ���� �Ⱥ����� --> <input type="hidden"
							name="no" value="<%= nf[i] %>"></td>
						<input type="hidden" name="index" value="<%=i%>">
						</td>
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
		<form action="updateRefCon" method="post">
			<table class="test_font food_tb"
				style="margin-top: 100px; margin-bottom: 100px;">
				<tr>
					<td class="foodlist"><input type="text" class="foodlist_text"
						name="nofood" style="font-size: 17px; font-weight: 600;"
						placeholder="�߰��� ����Ḧ �Է��ϼ���" name="foodname"> </input></td>
					<input type="hidden" name="size" value="<%=insert_idx%>">
					<td class="in"><button
							style="font-size: 17px; font-weight: 600;">�Է�</button></td>
				</tr>
			</table>
		</form>
		<!-- ���� 5�� �� �ԷµǸ� �Է�â ����� ����� ¾��!! -->
		<%}else { %>
		<div style="margin-bottom: 100px"></div>
		<%} %>
		<hr>
		<h3 style="margin-top:40px;">�Է��� ����ῡ ���� ������� :D</h3>
		<section class="small-receipe-area ">
			<div class="container">
				<h5 align="center" style="margin-bottom: 50px;"></h5>
				<div class="row">
					<%
					String[] ntf = (String[])session.getAttribute("notfood");
				 	for(int i=0; i<ntf.length; i++){
						if(ntf[i] == null)
							ntf[i] = "0";
						System.out.println(ntf[i]);
				 	}
					
		for(int i = 0; i < 5; i++){
			if(nf[i] != null){
				for(int j = 0; j < recipe.size(); j++){
					if(recipe.get(j).getRecipe_name().contains(nf[i])){ 
						if(!recipe.get(j).getRecipe_name().contains(ntf[0]) && !recipe.get(j).getRecipe_name().contains(ntf[1])
								&&	!recipe.get(j).getRecipe_name().contains(ntf[2]) && !recipe.get(j).getRecipe_name().contains(ntf[3])
								&& !recipe.get(j).getRecipe_name().contains(ntf[4])){%>
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
								<%-- <span class="test_font"> <% if(recipe.get(j).getRecipe_method() != null){%>
									<%= recipe.get(j).getRecipe_method()%> <%}%>
								</span> --%>
								<span class="test_font" style="font-weight:bold; font-size:15px"> 
								<% if(dao.search_food(nf[i]).size() != 0) {%>
								<%=dao.search_food(nf[i]).get(0).getFood_good()%> 
								<%} else{%>
								<%= recipe.get(j).getRecipe_method() %>
								<%} %>
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
					<% }}
				}
			}
		}
	%>

				</div>
				<p>
					<button id="load" class="btn">������</button>
				</p>
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