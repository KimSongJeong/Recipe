<%@page import="model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
	UserDTO user = (UserDTO) session.getAttribute("login_User");
    %>
<!DOCTYPE html>
<html lang="en">

<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Title -->
    <title>질병 정보 - 위장병</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="style.css">

</head>
    <style>
        #menu1 ul{
            width: 500px;
            margin: 0 auto;
            overflow: hidden;
        }
        #menu1 ul li{
            float:left;
            width: 25%;
            height: 100px;
            line-height: 60px;
            text-align: center;
        }
        #menu1 ul li a{
            display: block;
        }
        #menu1 ul li a:hover{
            color: rgb(0, 0, 0);
        }
        .tit{
            color: green;
            text-align: center;
            font-size: 17px;
            font-weight: bold;
        }
    </style>

<body>
    <!-- 레시피 대표 이미지 -->
    <div id="preloader" algin="center">
        <i class="circle-preloader"></i>
        <img src="img/core-img/salad.png" alt="">
    </div>

    <!-- 검색창 -->
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

    <!-- ##### 헤더 시작 부분/ 삭제 하지 마시오 ##### -->
    <header class="header-area">




       <!-- 메뉴관련 시작 -->
        <div class="delicious-main-menu" style="font-family:'allfonts';">
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

    <!-- 질병 탭-->
    <hr>
   <div>
        <ul style="text-align: center; ">
            <a class="test_font" style="font-size: 20px;" href="Disease_high_blood_pressure.jsp">고혈압</a>
            &nbsp&nbsp
            <a class="test_font" style="font-size: 20px;" href="Disease_Diabetes.jsp">당뇨병</a>
            &nbsp&nbsp
            <a class="test_font" style="font-size: 20px;" href="Disease_respiratory.jsp">호흡기질환</a>
            &nbsp&nbsp
            <a class="test_font" style="font-size: 20px;  border-bottom: 2px solid #adadad; " href="Disease_gastroenteritis.jsp">위장병</a>
        </ul>
    </div>
	<br>
	<div>
        <ul style="text-align: center;">
            <a class="test_font1" style="font-size: 17px; border-bottom: 2px solid #adadad; " href="Disease_gastroenteritis.jsp">정보</a>
            &nbsp&nbsp
            &nbsp&nbsp
            
            <a class="test_font1" style="font-size: 17px;" href="Disease_gastroenteritis_food.jsp">식재료</a>
            &nbsp&nbsp
            &nbsp&nbsp

            <a class="test_font1" style="font-size: 17px; " href="Disease_gastroenteritis_recipe.jsp">레시피</a>
        </ul>

    </div>


    <hr>




    <!-- ##### Blog Area Start ##### -->
    <div class="blog-area section-padding-80" align="center">
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-8">
                    <div class="blog-posts-area">

                        <!-- Single Blog Area -->
                        <div class="single-blog-area mb-80">
                            <!-- Thumbnail -->
                            <class class="blog-thumbnail">
                                <img src="img/blog-img/we.jpg" alt="">
                                <br><br>
                                <h3 class="test_font">위장병</h3>

                                <hr>
                                <br>
                            </class>


                            <!-- 건드려야 하는 곳 -->
                            <h4 class="test_font" style="font-size: 25px; margin-bottom: 30px;">상세 정보</h4>
                                <div style="color: black; text-align: left;">
                                <p style="color: black">위장병은 위에서 발생하는 병을 말한다. 위장병의 종류는 위궤양, 위염 등이 있다. 발병 원인은 주로 불규칙한 식사 습관, 지나치게 자극적인 음식 및 잦은 알코올 섭취인데 이러한 병이 계속 될 경우 암 유발의 원인이 될 수도 있다.</p>
                        </div>
                    </div>
                            <!-- Single Blog Area -->

                            <div class="single-blog-area mb-80">
                                <!-- Thumbnail -->
                                <h4>생활습관</h4>
                                <ol>
                                    <li><p style="color: black">규칙적인 식사습관을 유지한다.</p></li>
                                    <li><p style="color: black">부드러운 음식, 섬유질이 많은 음식을 섭취하고, 조미료의 사용은 가능한 자제한다.</p></li>
                                    <li><p style="color: black">평소 소화가 안되거나 자극적인 음식은 피한다.</p></li>
                                    <li><p style="color: black">음식은 꼭꼭 씹어 먹고 천천히 먹는다.</p></li>
                                    <li><p style="color: black">기호식품이 증상을 악화시키는 경우 피한다.</p></li>
                                    <li><p style="color: black">위장 질환의 원인이 되는 약물은 가급적 피하는 것이 좋다.</p></li>
                                    <li><p style="color: black">과중한 스트레스를 피한다.</p></li>
                                    <li><p style="color: black">적당한 운동은 위장 기능을 돕는다.</p></li>
                                </ol>
                            </div>


                                </div>
                                <!-- 건드려야 하는 곳 -->












                            </div>
                    </div>
                        


                    </div>

                    </div>

                </div>

                
            </div>
        </div>
    </div>
    <!-- ##### Blog Area End ##### -->











                            <!-- 포터 시작부분 -->
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
                                                <script>document.write(new Date().getFullYear());</script> | Project
                                                Team : 2X4=8 | Made By - ksj,kmj,hjg, kdh
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