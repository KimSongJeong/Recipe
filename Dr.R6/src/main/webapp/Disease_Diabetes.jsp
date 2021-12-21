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
    <title>���� ���� - �索</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="style.css">

</head>

<body >
    <!-- ������ ��ǥ �̹��� -->
    <div id="preloader" algin="center">
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
        <div class="delicious-main-menu" style="font-family:'allfonts';">
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
        <ul style="text-align: center; ">
            <a class="test_font" style="font-size: 20px;" href="Disease_high_blood_pressure.jsp">������</a>
            &nbsp&nbsp
            <a class="test_font" style="font-size: 20px; border-bottom: 2px solid #adadad;" href="Disease_Diabetes.jsp">�索��</a>
            &nbsp&nbsp
            <a class="test_font" style="font-size: 20px;" href="Disease_respiratory.jsp">ȣ�����ȯ</a>
            &nbsp&nbsp
            <a class="test_font" style="font-size: 20px;  " href="Disease_gastroenteritis.jsp">���庴</a>
        </ul>
    </div>
<br>
    <div>
        <ul style="text-align: center;">
            <a class="test_font1" style="font-size: 17px; border-bottom: 2px solid #adadad;" href="Disease_Diabetes.jsp">����</a>
            &nbsp&nbsp
            &nbsp&nbsp
            
            <a class="test_font1" style="font-size: 17px; " href="Disease_Diabetes_food.jsp">�����</a>
            &nbsp&nbsp
            &nbsp&nbsp

            <a class="test_font1" style="font-size: 17px;" href="Disease_Diabetes_recipe.jsp">������</a>
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
                                <img src="img/blog-img/dang.jpg" alt="">
                                <br><br>
                                <h3 class="test_font">�索��</h3>

                                <hr>
                                <br>
                            </class>


                            <!-- �ǵ���� �ϴ� �� -->
                            <h4 class="test_font" style="font-size: 25px; margin-bottom: 30px;">�� ����</h4>
                                <div style="color: black; text-align: left;">
                                    <p style="color: black">    �索���� ���忡�� �к�Ǵ� �ν����� ������ �Ǵ� ��������� �����ϰų� �������� �����ϰ� �̿���� �������ν� ������ �� ���� �����ָ� �ʷ��ϴ� ��ȯ�̴�.
                                        �索���� ġ��� ������ �������� �����ϰ� �պ����� ���� �� �߻��� �����ñ�Ű���ؼ� �Ļ�����, �๰���, ������ �Բ� �ڱ������ ��ȭ��Ű�µ� �ִ�.</p>
                            </div>
                        </div>
                            
    
                            <!-- Single Blog Area -->
                            <div class="single-blog-area mb-80">
                                <!-- Thumbnail -->
                                <div class="blog-thumbnail">
                                    <img src="img/blog-img/dang0.jpg" alt="">
                                </div>
                                <!-- Content -->
                                <div class="blog-content">
                                    <p style="color: black">�������� �索���α��� ������������ �������� �����߼��� ���̰� �ֽ��ϴ�. IDF�� ������ 2019�� �索�� �����ڴ� ������������ 6�� 6õ���� ���� �������� ����Ǿ����ϴ�.
                                        �̷��� �������� �索�� �����߼������� �츮 ���� �索�� ������ �������� ���̰��ֽ��ϴ�. �츮������ �索�� ȯ�ڴ� 500������ �Ѿ��, �索 ���� �ܰ��� ȯ�� ���� ���� 
                                        1300�������� ���� �α��� 1/3 �����Դϴ�.
                                    </p>
                                </div>
                            </div>
    
                            <!-- Single Blog Area -->
                            <div class="single-blog-area mb-80">
                                <!-- Thumbnail -->
                                <h4 class="test_font" style="font-size: 25px;">���̿��</h4>
                                <ol >
                                    <li><p style="color: black">1�� 3�� ������ �Ļ�� ������ ��Ģ������ �Ѵ�.</p></li>
                                    <li><p style="color: black">�ܼ����� ���븦 �����Ѵ�.</p></li>
                                    <li><p style="color: black">����, ��ȭ����, �ݷ����׷��� ���븦 �����Ѵ�.</p></li>
                                    <li><p style="color: black">������ ���� ������ ��ǰ�� ���븦 ���δ�.</p></li>
                                    <li><p style="color: black">���ڿ��� ���븦 �����Ѵ�.</p></li>
                                    <li><p style="color: black">�����Ұ� ���� ������ ��ǰ (ä��, ���)�� �����Ѵ�.</p></li>
                                </ol>
                            </div>
                                    


                                </div>
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