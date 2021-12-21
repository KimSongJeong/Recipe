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

    <!-- Title -->
    <title>질병 정보 - 고혈압</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="style.css">

</head>

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
            <a class="test_font" style="font-size: 20px;border-bottom: 2px solid #adadad;" href="Disease_high_blood_pressure.jsp">고혈압</a>
            &nbsp&nbsp
            <a class="test_font" style="font-size: 20px; " href="Disease_Diabetes.jsp">당뇨병</a>
            &nbsp&nbsp
            <a class="test_font" style="font-size: 20px;" href="Disease_respiratory.jsp">호흡기질환</a>
            &nbsp&nbsp
            <a class="test_font" style="font-size: 20px;  " href="Disease_gastroenteritis.jsp">위장병</a>
        </ul>
    </div>
    <br>
    <div>
        <ul style="text-align: center;">
            <a class="test_font1" style="font-size: 17px; border-bottom: 2px solid #adadad; " href="Disease_high_blood_pressure.jsp">정보</a>
            &nbsp&nbsp
            &nbsp&nbsp

            <a class="test_font1" style="font-size: 17px; " href="Disease_high_blood_pressure_food.jsp">
                식재료</a>
            &nbsp&nbsp
            &nbsp&nbsp

            <a class="test_font1" style="font-size: 17px;" href="Disease_high_blood_pressure_recipe.jsp">
                레시피</a>
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
                                <img src="img/blog-img/go.jpg" alt="">
                                <br><br>
                                <h3 class="test_font">고혈압</h3>

                                <hr>
                                <br>
                            </class>


                            <!-- 건드려야 하는 곳 -->
                            <h4 class="test_font" style="font-size: 25px; margin-bottom: 30px;">상세 정보</h4>
                                <div style="color: black; text-align: left;">
                                    <p style="color: black">    고혈압은 수축기 혈압이나 이완기 혈압 (혹은 둘 다)이 지속적으로 상승된 상태를 말하며 성인의 경우 안정 시에 두 번 이상 측정한 혈압이 140/90 mmHg 이상인 경우에 고혈압으로 진단한다. DASH (Dietary approach to stop hypertension) diet 최근 미국에서 실시한 임상 연구에서 고혈압 환자들에게 과일, 채소, 저지방 유제품등 칼슘, 포타슘, 마그네슘이 풍부하고 염분, 지방 및 포화지방이 제한된 DASH diet 을 실시함으로써 혈압을 현저하게 저하시킬 수 있었다고 보고되었다.</p>
                            </div>
                        </div>
                            
    
                            <!-- Single Blog Area -->
                            <div class="single-blog-area mb-80">
                                <!-- Thumbnail -->
                                <div class="blog-thumbnail">
                                    <img src="img/blog-img/go0.jpg" alt="">
                                </div>
                                <!-- Content -->
                                <div class="blog-content">
                                    <p style="color: black">고혈압을 예방하기 위해서는 고혈압의 위험요인 중 조절 불가능한 연령과 가족력(회색동그라미)을 제외한 조절가능한 요인을 바로잡는 것입니다. 조절 가능한 요인(노란색 동그라미)들은 생활습관(체중줄이기, 운동하기, 싱겁게 먹기, 금연하기, 절주하기, 스트레스 덜 받기 등)을 개선함으로써 조절할 수 있습니다.
                                    </p>
                                </div>
                            </div>
    
                            <!-- Single Blog Area -->
                            <div class="single-blog-area mb-80">
                                <!-- Thumbnail -->
                                <h4 class="test_font" style="font-size: 25px;">식이요법</h4>
                                <ol >
                                    <li><p style="color: black">간을 할 때 쓰는 소금이나 간장의 양을 평소 사용량의 절반으로 줄이도록 한다.</p></li>
                                    <li><p style="color: black">식초, 레몬즙, 오렌지즙 등의 신맛을 내는 소스를 이용한다.</p></li>
                                    <li><p style="color: black">겨자, 후추, 와사비 등의 향신료를 이용한다.</p></li>
                                    <li><p style="color: black">생선을 요리해서 먹을 때에는 조림보다는 구이로 조리하며, 간을 미리 하지 않고 찍어 들도록 한다.</p></li>
                                    <li><p style="color: black">식탁위에 소금, 간장, 젓갈, 장아찌 등의 고염식품을 따로 놓지 않는다.</p></li>
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