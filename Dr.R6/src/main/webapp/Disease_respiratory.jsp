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
    <title>질병 정보 - 호흡기 질환</title>

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
        p{
            color: black;
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
            <a class="test_font" style="font-size: 20px; border-bottom: 2px solid #adadad;" href="Disease_respiratory.jsp">호흡기질환</a>
            &nbsp&nbsp
            <a class="test_font" style="font-size: 20px;  " href="Disease_gastroenteritis.jsp">위장병</a>
        </ul>
    </div>
	<br>
	<div>
        <ul style="text-align: center;">
            <a class="test_font1" style="font-size: 17px; border-bottom: 2px solid #adadad;" href="Disease_respiratory.jsp">정보</a>
            &nbsp&nbsp
            &nbsp&nbsp

            <a class="test_font1" style="font-size: 17px;" href="Disease_respiratory_food.jsp">식재료</a>
                &nbsp&nbsp
            &nbsp&nbsp

            <a class="test_font1" style="font-size: 17px;" href="Disease_respiratory_recipe.jsp">레시피</a>
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
                                <img src="img/blog-img/ho.jpg" alt="">
                                <br><br>
                                <h3 class="test_font">호흡기질환</h3>

                                <hr>
                                <br>
                            </class>


                            <!-- 건드려야 하는 곳 -->
                            <h4 class="test_font" style="font-size: 25px; margin-bottom: 30px;">상세 정보</h4>
                                <div style="color: black; text-align: left;">
                                <p class="tit test_font">폐렴</p>
                                <p>흔히 ‘폐렴균’이라고 하는 여러 균들이 다양한 경로를 통해서 호흡기계로 들어올 수 있다. 이 균들이 자라나서 염증을 일으켜 정상적인 호흡계통의 구조물을 파괴한다. 그 결과 기침 및 화농성객담(진한 누런색의 끈적한 기관지분비물)이 생기며 고열 및 오한이 발생할 수 있다. 대개 흉부 엑스선검사로 진단이 되며, 객담을 뱉어 원인균을 알아내는 경우도 있다. 젊은 연령에서는 폐렴초기에 적절한 항생제로 치료하면 합병증 없이 완전히 치유되지만, 진단이나 치료가 늦어지거나 당뇨병, 심장병 등의 지병이 있는 노인들에서는 생존에 지장을 줄 수 있을 정도로 치명적이다.</p>
                                <p class="tit test_font">결핵</p>
                                <p>결핵균은 일반적인 세균과는 성질이 다르다. 매우 천천히 자라지만 한번 질병을 일으키면 또한 천천히 소멸된다. 우리나라는 결핵 발생율이 높은 지역이다. 결핵균을 배출하는 사람과 가까이 접촉할 때 기침이나 대화 도중 공기 중으로 배출된 결핵균을 흡입하면 발병할 수 있다. 아무런 증상이 없는 경우에서부터 기침, 객담, 발열, 체중감소, 객혈 및 전신 무력감 등 양상이 매우 다양하기 때문에 진단이 늦어지는 경우도 많다.
                                    객담에서 결핵균이 증명되면 확진되지만, 결핵이 있더라고 객담으로 균이 나오지 않는 경우도 많아서 이런 경우 흉부 엑스선이나 흉부 CT촬영의 도움을 받기도 한다. 진단이 되면 최소 6개월간 최소 3가지 이상(보통 처음치료시 4가지 약제를 복용함)의 항결핵제를 복용해야 하고, 꾸준하게만 복용한다면 90% 이상 완치될 수 있다.</p>
                                <p class="tit test_font">천식</p>
                                <p>천식은 일반적으로 알레르기 질환이다. 알레르기를 일으키는 유발물질(‘알레르겐’이라고 한다)에 대해서 호흡기계가 비정상적으로 민감한 반응을 보이는 병으로 알레르겐에 노출되었을 때 기관지의 염증 및 수축이 유발한다. 염증 때문에 만성적으로 기침이나 점액의 분비가 많아지게 되고 기관지가 수축되었을 때 숨찬 증상이나 쌕쌕거리는 숨소리가 유발된다. 그러나 다른 증상 없이 장기적으로 지속되고 악화와 호전이 반복되는 기침으로만 나타나는 경우가 있어 진단이 늦어지기도 한다.
                                    흔히 재채기, 맑은 콧물, 눈주위 및 코주위 가려움증, 코막힘 등의 알레르기 비염증상과 동반되는 경우가 많다. 비염있는 환자에서 쌕쌕거림, 기침 등이 있다면 천식일 가능성이 높다. 쌕쌕거리는 증상이 있을 때 병원을 찾는다면 천식으로 바로 진단이 되지만, 기침만 나타나는 경우 폐기능검사, 알레르기 피부반응 검사 및 기관지자극 폐기능검사 등을 통해서 천식을 진단할 수도 있다. 천식으로 인해 심하게 숨이 찬 경우(천식발작) 즉시 응급실이나 가까운 병원을 방문해야 하고, 평소 안정상태 일 때는 스테로이드 흡입제를 꾸준하게 규칙적으로 흡입해야 하고, 의사 처방에 따라 기관지 확장 흡입제를 사용해야 하는 경우도 있다.</p>
                                <p class="tit test_font">만성폐쇄성폐질환(COPD)</p>
                                <p>최근 관심을 많이 받고 있는 질병이다. 90% 이상의 경우 흡연이 원인이다. 만성적으로 흡연과 같은 기관지에 해로운 자극들이 들어오게 되면 기관지에 염증이 유발되고, 결과 정상적인 폐 구조물은 파괴되고 점액을 분비하는 세포들만 비대해지게 된다. 만성적인 기침, 점액성 객담 및 활동시 호흡곤란 등이 주증상이다. 천식은 안정상태에서는 별 증상이 없는 경우가 많지만 COPD는 만성적인 호흡곤란이 특징이다. 진행된 COPD의 경우 흉부 엑스선검사에서 이상소견을 보이며 폐기능검사를 했을 때 폐활량이 감소되어 있는 경우가 많다. 폐기능검사가 정상이어도 위의 증상들이 3개월 이상 있다면 초기 COPD일 가능성이 높다. 무엇보다 금연하는 것이 COPD의 진행을 막는데 가장 중요하며 보조적으로 기관지 확장제를 사용하게 된다.</p>
                                <p class="tit test_font">기관지확장증</p>
                                <p>원인은 다양하지만 어렸을 때 반복적으로 호흡기감염(홍역이나 백일기침 등)을 앓은 후 합병증으로 발생하는 경우가 많다. 기관지가 만성염증에 의해 영구적으로 늘어나 기관지분비물 배출이 잘 안되게 된다. 고인 분비물 때문에 이차적인 세균감염이 자주 생기고 분비물 때문에 기관지가 오히려 좁아져 호흡곤란을 호소할 수 있다. 이차적인 세균감염을 적절하게 치료하지 않으면 세균이 만성적으로 기관지에 존재하여 계속 문제를 일으키므로 객담의 농성으로 바뀌고 양이 많아지면 항생제를 복용하는 것이 좋다. 심한 경우 흉부 엑스선으로도 진단이 되지만 경미한 경우 흉부 CT촬영을 해야 진단된다.                                </p>
                                <p class="tit test_font">간질성 폐질환</p>
                                <p>최근에 드라마 주인공이 앓았던 병으로 많은 관심을 받고 있는 질병이다. 빈도는 위의 질병보다 훨씬 낮지만 원인 및 치료가 확실하지 않아 일단 진단되면 환자들에게 큰 고통을 준다. 우리가 숨을 들이쉴 때 산소를 받아들이고 이산화탄소를 내 보내는 기관인 폐포들 사이사이를 ‘간질’이라고 하는데 간질에는 폐혈관, 신경 및 결체조직이라고 하는 폐포 사이의 연결물질이 있다. 간질성폐질환에서는 간질에 섬유질이 비정상적으로 쌓여서 폐포 확장이 잘 안되게 되고, 진행되면 폐포들이 파괴되어 기능을 하는 폐포가 줄어든다. 결과적으로 조금만 움직여도 몸속 산소가 부족하여 숨이 차게 된다. 그러나 간질성폐질환에는 매우 다양한 병들이 있어 각 병마다 경과나 예후가 다르므로 전문가의 도움을 받아야 하며, 초기에 진단하려면 흉부 CT와 폐기능검사의 도움을 받을 수 있다.</p>
                        </div>
                    </div>
                            <!-- Single Blog Area -->
                            <div class="single-blog-area mb-80">
                                <!-- Thumbnail -->
                                <h4 class="test_font" style="font-size: 25px;">생활습관</h4>
                                <ol >
                                    <li><p style="color: black">코로 호흡을 한다.</p></li>
                                    <li><p style="color: black">식사는 양쪽으로 씹고 30회씩 씹고 넘긴다.</p></li>
                                    <li><p style="color: black">차가운 음료와 음식은 피한다.</p></li>
                                    <li><p style="color: black">뼈를 쉬게 해준다.(위를 향해 자되 8시간 수면을 유지한다)</p></li>
                                    <li><p style="color: black">체조를 느긋하게 하면서 마음의 여유를 찾는다.</p></li>
                                    <li><p style="color: black">햇빛을 자주 쐬어주고, 몸을 따뜻하게 한다.</p></li>
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