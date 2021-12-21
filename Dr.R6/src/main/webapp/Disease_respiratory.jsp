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
    <title>���� ���� - ȣ��� ��ȯ</title>

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
            <a class="test_font" style="font-size: 20px;" href="Disease_Diabetes.jsp">�索��</a>
            &nbsp&nbsp
            <a class="test_font" style="font-size: 20px; border-bottom: 2px solid #adadad;" href="Disease_respiratory.jsp">ȣ�����ȯ</a>
            &nbsp&nbsp
            <a class="test_font" style="font-size: 20px;  " href="Disease_gastroenteritis.jsp">���庴</a>
        </ul>
    </div>
	<br>
	<div>
        <ul style="text-align: center;">
            <a class="test_font1" style="font-size: 17px; border-bottom: 2px solid #adadad;" href="Disease_respiratory.jsp">����</a>
            &nbsp&nbsp
            &nbsp&nbsp

            <a class="test_font1" style="font-size: 17px;" href="Disease_respiratory_food.jsp">�����</a>
                &nbsp&nbsp
            &nbsp&nbsp

            <a class="test_font1" style="font-size: 17px;" href="Disease_respiratory_recipe.jsp">������</a>
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
                                <h3 class="test_font">ȣ�����ȯ</h3>

                                <hr>
                                <br>
                            </class>


                            <!-- �ǵ���� �ϴ� �� -->
                            <h4 class="test_font" style="font-size: 25px; margin-bottom: 30px;">�� ����</h4>
                                <div style="color: black; text-align: left;">
                                <p class="tit test_font">���</p>
                                <p>���� ����űա��̶�� �ϴ� ���� �յ��� �پ��� ��θ� ���ؼ� ȣ����� ���� �� �ִ�. �� �յ��� �ڶ󳪼� ������ ������ �������� ȣ������� �������� �ı��Ѵ�. �� ��� ��ħ �� ȭ�󼺰���(���� �������� ������ ������к�)�� ����� �� �� ������ �߻��� �� �ִ�. �밳 ��� �������˻�� ������ �Ǹ�, ������ ��� ���α��� �˾Ƴ��� ��쵵 �ִ�. ���� ���ɿ����� ����ʱ⿡ ������ �׻����� ġ���ϸ� �պ��� ���� ������ ġ��������, �����̳� ġ�ᰡ �ʾ����ų� �索��, ���庴 ���� ������ �ִ� ���ε鿡���� ������ ������ �� �� ���� ������ ġ�����̴�.</p>
                                <p class="tit test_font">����</p>
                                <p>���ٱ��� �Ϲ����� ���հ��� ������ �ٸ���. �ſ� õõ�� �ڶ����� �ѹ� ������ ����Ű�� ���� õõ�� �Ҹ�ȴ�. �츮����� ���� �߻����� ���� �����̴�. ���ٱ��� �����ϴ� ����� ������ ������ �� ��ħ�̳� ��ȭ ���� ���� ������ ����� ���ٱ��� �����ϸ� �ߺ��� �� �ִ�. �ƹ��� ������ ���� ��쿡������ ��ħ, ����, �߿�, ü�߰���, ���� �� ���� ���°� �� ����� �ſ� �پ��ϱ� ������ ������ �ʾ����� ��쵵 ����.
                                    ���㿡�� ���ٱ��� ����Ǹ� Ȯ��������, ������ �ִ���� �������� ���� ������ �ʴ� ��쵵 ���Ƽ� �̷� ��� ��� �������̳� ��� CT�Կ��� ������ �ޱ⵵ �Ѵ�. ������ �Ǹ� �ּ� 6������ �ּ� 3���� �̻�(���� ó��ġ��� 4���� ������ ������)�� �װ������� �����ؾ� �ϰ�, �����ϰԸ� �����Ѵٸ� 90% �̻� ��ġ�� �� �ִ�.</p>
                                <p class="tit test_font">õ��</p>
                                <p>õ���� �Ϲ������� �˷����� ��ȯ�̴�. �˷����⸦ ����Ű�� ���߹���(���˷����ա��̶�� �Ѵ�)�� ���ؼ� ȣ���谡 ������������ �ΰ��� ������ ���̴� ������ �˷����տ� ����Ǿ��� �� ������� ���� �� ������ �����Ѵ�. ���� ������ ���������� ��ħ�̳� ������ �к� �������� �ǰ� ������� ����Ǿ��� �� ���� �����̳� �ٽٰŸ��� ���Ҹ��� ���ߵȴ�. �׷��� �ٸ� ���� ���� ��������� ���ӵǰ� ��ȭ�� ȣ���� �ݺ��Ǵ� ��ħ���θ� ��Ÿ���� ��찡 �־� ������ �ʾ����⵵ �Ѵ�.
                                    ���� ��ä��, ���� �๰, ������ �� ������ ��������, �ڸ��� ���� �˷����� ������� ���ݵǴ� ��찡 ����. ���ִ� ȯ�ڿ��� �ٽٰŸ�, ��ħ ���� �ִٸ� õ���� ���ɼ��� ����. �ٽٰŸ��� ������ ���� �� ������ ã�´ٸ� õ������ �ٷ� ������ ������, ��ħ�� ��Ÿ���� ��� ���ɰ˻�, �˷����� �Ǻι��� �˻� �� ������ڱ� ���ɰ˻� ���� ���ؼ� õ���� ������ ���� �ִ�. õ������ ���� ���ϰ� ���� �� ���(õ�Ĺ���) ��� ���޽��̳� ����� ������ �湮�ؾ� �ϰ�, ��� �������� �� ���� ���׷��̵� �������� �����ϰ� ��Ģ������ �����ؾ� �ϰ�, �ǻ� ó�濡 ���� ����� Ȯ�� �������� ����ؾ� �ϴ� ��쵵 �ִ�.</p>
                                <p class="tit test_font">������⼺����ȯ(COPD)</p>
                                <p>�ֱ� ������ ���� �ް� �ִ� �����̴�. 90% �̻��� ��� ���� �����̴�. ���������� ���� ���� ������� �طο� �ڱص��� ������ �Ǹ� ������� ������ ���ߵǰ�, ��� �������� �� �������� �ı��ǰ� ������ �к��ϴ� �����鸸 ��������� �ȴ�. �������� ��ħ, ���׼� ���� �� Ȱ���� ȣ���� ���� �������̴�. õ���� �������¿����� �� ������ ���� ��찡 ������ COPD�� �������� ȣ������ Ư¡�̴�. ����� COPD�� ��� ��� �������˻翡�� �̻�Ұ��� ���̸� ���ɰ˻縦 ���� �� ��Ȱ���� ���ҵǾ� �ִ� ��찡 ����. ���ɰ˻簡 �����̾ ���� ������� 3���� �̻� �ִٸ� �ʱ� COPD�� ���ɼ��� ����. �������� �ݿ��ϴ� ���� COPD�� ������ ���µ� ���� �߿��ϸ� ���������� ����� Ȯ������ ����ϰ� �ȴ�.</p>
                                <p class="tit test_font">�����Ȯ����</p>
                                <p>������ �پ������� ����� �� �ݺ������� ȣ��Ⱘ��(ȫ���̳� ���ϱ�ħ ��)�� ���� �� �պ������� �߻��ϴ� ��찡 ����. ������� ���������� ���� ���������� �þ ������к� ������ �� �ȵǰ� �ȴ�. ���� �к� ������ �������� ���հ����� ���� ����� �к� ������ ������� ������ ������ ȣ������ ȣ���� �� �ִ�. �������� ���հ����� �����ϰ� ġ������ ������ ������ ���������� ������� �����Ͽ� ��� ������ ����Ű�Ƿ� ������ ������ �ٲ�� ���� �������� �׻����� �����ϴ� ���� ����. ���� ��� ��� ���������ε� ������ ������ ����� ��� ��� CT�Կ��� �ؾ� ���ܵȴ�.                                </p>
                                <p class="tit test_font">������ ����ȯ</p>
                                <p>�ֱٿ� ��� ���ΰ��� �ξҴ� ������ ���� ������ �ް� �ִ� �����̴�. �󵵴� ���� �������� �ξ� ������ ���� �� ġ�ᰡ Ȯ������ �ʾ� �ϴ� ���ܵǸ� ȯ�ڵ鿡�� ū ������ �ش�. �츮�� ���� ���̽� �� ��Ҹ� �޾Ƶ��̰� �̻�ȭź�Ҹ� �� ������ ����� ������ ���̻��̸� ���������̶�� �ϴµ� �������� ������, �Ű� �� ��ü�����̶�� �ϴ� ���� ������ ���Ṱ���� �ִ�. ����������ȯ������ ������ �������� ������������ �׿��� ���� Ȯ���� �� �ȵǰ� �ǰ�, ����Ǹ� �������� �ı��Ǿ� ����� �ϴ� ������ �پ���. ��������� ���ݸ� �������� ���� ��Ұ� �����Ͽ� ���� ���� �ȴ�. �׷��� ����������ȯ���� �ſ� �پ��� ������ �־� �� ������ ����� ���İ� �ٸ��Ƿ� �������� ������ �޾ƾ� �ϸ�, �ʱ⿡ �����Ϸ��� ��� CT�� ���ɰ˻��� ������ ���� �� �ִ�.</p>
                        </div>
                    </div>
                            <!-- Single Blog Area -->
                            <div class="single-blog-area mb-80">
                                <!-- Thumbnail -->
                                <h4 class="test_font" style="font-size: 25px;">��Ȱ����</h4>
                                <ol >
                                    <li><p style="color: black">�ڷ� ȣ���� �Ѵ�.</p></li>
                                    <li><p style="color: black">�Ļ�� �������� �ð� 30ȸ�� �ð� �ѱ��.</p></li>
                                    <li><p style="color: black">������ ����� ������ ���Ѵ�.</p></li>
                                    <li><p style="color: black">���� ���� ���ش�.(���� ���� �ڵ� 8�ð� ������ �����Ѵ�)</p></li>
                                    <li><p style="color: black">ü���� �����ϰ� �ϸ鼭 ������ ������ ã�´�.</p></li>
                                    <li><p style="color: black">�޺��� ���� �����ְ�, ���� �����ϰ� �Ѵ�.</p></li>
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