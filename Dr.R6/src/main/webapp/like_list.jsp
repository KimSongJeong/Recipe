<%@page import="java.net.URLEncoder"%>
<%@page import="model.RecipeDTO"%>
<%@page import="model.RecipeDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.MyrecipeDAO"%>
<%@page import="model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    UserDTO user = (UserDTO) session.getAttribute("login_User");
    
    ArrayList<Integer> myrecipe = (ArrayList<Integer>)session.getAttribute("Myrecipe");
    
    RecipeDAO dao = new RecipeDAO();
    
    ArrayList<RecipeDTO> recipe = dao.search_recipe(myrecipe);
    
    %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="euc-kr">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Title -->
    <title>�� ���</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="style.css">
<style>
    .row{
        display:flex;
    }
</style>
</head>




<body style="font-family: 'allfonts'">
    <!-- Preloader -->
    <div id="preloader">
        <i class="circle-preloader"></i>
        <img src="img/core-img/salad.png" alt="">
    </div>

    <!-- �˻�â -->
    <div class="search-wrapper">
        <!-- Close Btn -->
        <div class="close-btn"><i class="fa fa-times" aria-hidden="true"></i></div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <form action="#" method="post">
                        <input type="search" name="search" placeholder="Type any keywords...">
                        <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
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
                    <nav class="classy-navbar justify-content-between" id="deliciousNav">

                        <!-- �ΰ� -->
                        <a class="nav-brand" href="main.jsp"><img src="img/core-img/logo.png" alt=""></a>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <!-- �޴� / ����� ȭ�� 3�� ��ư ���� -->
                        <div class="classy-menu">

                            <!-- �޴� / ����� ȭ�� 3�� ��ư �ݱ� -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
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

    <!-- ##### �� ��� ##### -->
    <hr>
    <section class="small-receipe-area section-padding-80-0">
        <div class="container">
            <h5  class="test_font" align="center" style="font-size: 25px;"><%=user.getU_name() %>
                <span>���� ���� �丮�� �Դϴ� :P</span>
            </h5>
            <h5  align="center"  style="margin-bottom: 50px;"></h5>
            <div class="row">

    <!-- ##### ���� ������ ��õ ���� ##### -->
    <hr>
    <section class="small-receipe-area section-padding-80-0">
        <div class="container">
            <div class="row">

                <% 
				if(recipe != null){
				for(int i = 0; i < recipe.size(); i++) {
				%>
				<div class="col-12 col-sm-6 col-lg-4 list1">
					<div class="single-small-receipe-area d-flex">
						<!-- Receipe Thumb -->

						<div class="receipe-thumb" style="padding: 0px">
							<img style="height: 100px;"
								src="<%= recipe.get(i).getRecipe_img() %>" alt="">
						</div>
						<!-- Receipe Content -->
						<div class="receipe-content "
							style="padding-left: 10px; text-align: left;">
							<br>
							<!-- ���� ���� ǥ��-->
							<span class="test_font" style="font-weight:bold; font-size:15px"> <% if(recipe.get(i).getRecipe_method() != null){%>
								<%= recipe.get(i).getRecipe_method()%> <%}%>
							</span>
							<!-- ���� ��-->
							<span class="test_font"
								style="font-weight: bold; font-size: 20px; color: black;"><%= recipe.get(i).getRecipe_name() %></span>
							<a class="test_font"
								style="font-size: 11px; padding: 2px 3px; width: fit-content; background-color: #ececec; border-radius: 5px"
								href="recipe_page.jsp?name=<%=URLEncoder.encode(recipe.get(i).getRecipe_name(), "euc-kr")  %>">�󼼺���</a>
						</div>
					</div>
				</div>

				<% }} %>

    <!-- ##### �� ��� ���� ##### -->


<!-- ���� ���ۺκ� -->
    <!-- ##### Footer Area Start ##### -->
    <footer class="footer-area">
        <div class="container h-100">
            <div class="row h-100">
                <div class="col-12 h-100 d-flex flex-wrap align-items-center justify-content-between">
<!-- Footer Logo -->
<div class="footer-logo">
    <a href="main.jsp"><img src="img/core-img/logo.png" alt=""></a>
</div>
                    <!-- Copywrite -->
                    <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Dr.R &copy;<script>document.write(new Date().getFullYear());</script> | Project Team name : 2X4=8 | Made By - ksj,kmj,hjg, kdh 
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
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