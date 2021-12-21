<%@page import="model.UserDTO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="model.RecipeDTO"%>
<%@page import="model.FoodDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
 <%
	UserDTO user = (UserDTO) session.getAttribute("login_User");
 
 	ArrayList<FoodDTO> food = new ArrayList<FoodDTO>();
 	food = (ArrayList<FoodDTO>)session.getAttribute("search_food");
 	ArrayList<RecipeDTO> recipe = new ArrayList<RecipeDTO>();
 	recipe = (ArrayList<RecipeDTO>)session.getAttribute("search_recipe");

 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Title -->
    <title>검색 상세 페이지</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="style.css">

<style>
.row {
	display: flex;
}
.btn {
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
	margin-left: 100px;
	font-family: 'allfonts';
}

.list1 {
	/* visibility: hidden; */
	display: none;
	/* display: ; */
}
.list2 {
	/* visibility: hidden; */
	display: none;
	/* display: ; */
}
.left{
            text-align: left;
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
                    console.log("클릭됨");
                    $(".list1").slice(num1, num2).attr("style", "display:flex");
                }

                else {
                	$("#load").attr("style", "display:none");
                    alert("더이상 없습니다 !!! ");
                }
            });
        });
        
        let num3 = 0;
        let num4 = 6;
        $(function () {
            $(".list2").slice(num3, num4).attr("style", "display:flex");
            $("#load2").click(function () {
                num1 += 6;
                num2 += 6;
                if (num1 < $(".list2").length) {
                    console.log("클릭됨");
                    $(".list2").slice(num1, num2).attr("style", "display:flex");
                }

                else {
                	$("#load2").attr("style", "display:none");
                    alert("더이상 없습니다 !!! ");
                }
            });
        });
    </script>
</head>
<body style="font-family: 'allfonts'">
    <!-- Preloader -->
    <div id="preloader">
        <i class="circle-preloader"></i>
        <img src="img/core-img/salad.png" alt="">
    </div>

    <!-- ##### 헤더 시작 부분/ 삭제 하지 마시오 ##### -->
    <header class="header-area">




        <!-- 메뉴관련 시작 -->
        <div class="delicious-main-menu">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- 메뉴 / 디자인 -->
                    <nav class="classy-navbar justify-content-between" id="deliciousNav">

                        <!-- 로고 -->
                        <a class="nav-brand" href="main.jsp"><img src="img/core-img/logo.png" alt=""></a>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <!-- 메뉴 / 모바일 화면 3줄 버튼 생성 -->
                        <div class="classy-menu">

                            <!-- 메뉴 / 모바일 화면 3줄 버튼 닫기 -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                           <!-- 메뉴 묶음 -->
							<div class="classynav">
								<ul>

									<!-- 그 외 메뉴 -->

									<%
									if (user != null) {
									%>
									

									<li><a href="custom_ingredient.jsp">맞춤 추천</a></li>
									<li><a href="food_filter.jsp">식재료 필터</a></li>
									<%
									}
									%>

									<li><a href="Season_products.jsp">제철 식재료</a></li>
									<li><a href="Disease_high_blood_pressure.jsp">질병 정보</a></li>
									<li><a href="Guide.jsp">이용 안내</a></li>
									<%
									if (user == null) {
									%>
									<!-- 로그인 -->
									<li><a href="login.html"
										style="background-color: rgb(236, 236, 236);">로그인</a></li>

									<!-- 회원가입 -->
									<li><a href="join.jsp"
										style="background-color: rgb(236, 236, 236);">회원가입</a></li>

									<!-- 검색 -->
									<%
									} else {
									%>
									<li id="mypage"><a href="member_info.jsp">마이 페이지</a></li>
									<li><a href="logout.jsp"
										style="background-color: rgb(236, 236, 236);">로그아웃</a></li>
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
							<!-- 메뉴묶음 끝 -->
                        </div>

                    </nav>
                </div>
            </div>
        </div>
        <!-- 메뉴관련 끝 -->
    </header>
    <!-- ##### 헤더 종료 부분 / 삭제하지 마시오 ##### -->
    
    
    <!-- ##### 식재료 검색 결과 ##### -->
    <hr>
    <div align="center"> <!-- form태그는 가운데정렬이 되지 않아 div로 한번 감쌋음 -->
        <form action="UsearchCon" method="post">
        <div class="test_search_all">
            <input type="text" name="search" placeholder="검색어를 입력해주세요." class="test_search">
            <button type = "submit" class="test_search_button"><i class="fa fa-search"></i></button>
        </div>
        </form>
    <hr>
</div>



    <br>
    <br>
    <div align="center" class="test_font" style="font-size: 25px; font-weight: bold;">
        <span style="color: black;">식재료 검색 결과</span>
    </div>
    
	<section class="small-receipe-area" >
        <div class="container">
           
            <h5 align="center" style="margin-bottom: 50px;"></h5>
            <div class="row">

                <!-- Small Receipe Area -->
                <% 
				if(food != null){
				for(int i = 0; i < food.size(); i++) {
				%>
				<div class="col-12 col-sm-6 col-lg-4 list1">
					<div class="single-small-receipe-area d-flex">
						<!-- Receipe Thumb -->

						<div class="receipe-thumb" style="padding: 0px">
							<img style="height: 100px;"
								src="<%= food.get(i).getFood_image() %>" alt="">
						</div>
						<!-- Receipe Content -->
						<div class="receipe-content "
							style="padding-left: 10px; text-align: left;">
							<br>
							<!-- 좋은 질병 표시-->
							<span class="test_font" style="font-weight:bold;"> <% if(food.get(i).getFood_good() != null){%>
								<%= food.get(i).getFood_good()%> <%}%>
							</span>
							<!-- 음식 명-->
							<span class="test_font"
								style="font-weight: bold; font-size: 20px; color: black;"><%= food.get(i).getFood_name() %></span>
							<a class="test_font"
								style="font-size: 11px; padding: 2px 3px; width: fit-content; background-color: #ececec; border-radius: 5px"
								href="ingredient_page.jsp?name=<%=URLEncoder.encode(food.get(i).getFood_name(), "euc-kr")%>">상세보기</a>
						</div>
					</div>
				</div>

				<% }} %>
</div>
			</div>
			
                </div>
            </div>
            
        </section>

    <!-- ##### 식재료 검색 종료 ##### -->

         <!-- ##### 레시피 검색 결과 ##### -->
        <hr>

        <br>
        <br>
        <div align="center" class="test_font" style="font-size: 25px; font-weight: bold;">
            <span style="color: black;">레시피 검색 결과</span>
        </div>
        
        <section class="small-receipe-area section-padding-80-0">
                <div class="container">
                <div class="row">
    
                     <% 
				if(recipe != null){
				for(int i = 0; i < recipe.size(); i++) {
				%>
				<div class="col-12 col-sm-6 col-lg-4 list2">
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
							<!-- 좋은 질병 표시-->
							<span class="test_font" style="font-weight:bold;"> <% if(recipe.get(i).getRecipe_method() != null){%>
								<%= recipe.get(i).getRecipe_method()%> <%}%>
							</span>
							<!-- 음식 명-->
							<span class="test_font"
								style="font-weight: bold; font-size: 20px; color: black;"><%= recipe.get(i).getRecipe_name() %></span>
							<a class="test_font"
								style="font-size: 11px; padding: 2px 3px; width: fit-content; background-color: #ececec; border-radius: 5px"
								href="recipe_page.jsp?name=<%=URLEncoder.encode(recipe.get(i).getRecipe_name(), "euc-kr")  %>">상세보기</a>
						</div>
					</div>
				</div>

				<% }} %>
    </div>
			</div>
			<p align="center">
				<button id="load2" class="btn">더보기</button>
			</p>
                    
    
                   
    
                  
                </div>
            </div>
        </section>
    
        <!-- ##### 레시피 검색 결과 ##### -->


    





<!-- 포터 시작부분 -->
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









<!-- js 파일 로드 -->
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