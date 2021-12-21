<%@page import="model.UserDAO"%>
<%@page import="model.MyrecipeDAO"%>
<%@page import="model.UserDTO"%>
<%@page import="model.CommentDAO"%>
<%@page import="model.CommentDTO"%>
<%@page import="model.RecipeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.RecipeDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   
<%
response.setCharacterEncoding("euc-kr");

UserDTO user = (UserDTO) session.getAttribute("login_User");
UserDAO dao3 = new UserDAO();

String name = request.getParameter("name");
//����� ����
RecipeDAO dao = new RecipeDAO();
RecipeDTO recipe = dao.search_recipe(name);

ArrayList<Integer> myrecipe = (ArrayList<Integer>)session.getAttribute("Myrecipe");
boolean check = false;

if(myrecipe != null){
for(int i=0; i< myrecipe.size(); i++){
   if(myrecipe.get(i) == recipe.getRecipe_code()){
      check = true;
      break;
   }
}
}

System.out.println(check);

/* 
System.out.println(recipe.getRecipe_code());
 */
CommentDAO dao2 = new CommentDAO();
ArrayList<CommentDTO> comment = new ArrayList<CommentDTO>();
if(dao2.comment_select(recipe.getRecipe_code()) != null){
   comment = dao2.comment_select(recipe.getRecipe_code());
}

session.setAttribute("recipe_name", name);
session.setAttribute("recipe_code", recipe.getRecipe_code());

%> 
    
    
<!DOCTYPE html>
<html lang="en">

<head>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        #menu1 ul {
            width: 500px;
            margin: 0 auto;
            overflow: hidden;
        }

        #menu1 ul li {
            float: left;
            width: 25%;
            height: 100px;
            line-height: 60px;
            text-align: center;
        }

        #menu1 ul li a {
            display: block;
        }

        #menu1 ul li a:hover {
            color: gray;
        }

        .like {
            background-color: white;
            padding: 0px 5px;
            border-radius: 10px;
            border: white;
        }
    </style>
    <meta charset="euc-kr">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Title -->
    <title>������ �� ������</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="style.css">
    <script src="jquery-3.6.0.min.js"></script>
<!--     <script>
        $(function () {
            $(".like").click(function () {
                 $("#like").attr("src", "https://image.flaticon.com/icons/png/128/39/39559.png"); 
                location.reload();
            });
        });


    </script> -->
</head>

<body style="font-family:'allfonts'">
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
                                <img src="<%=recipe.getRecipe_img() %>" alt="">
                                <br><br><br>
                                <!-- �̸� -->
                                
                                <h3 class="test_font"><span style="margin-left: 30px;"><%=recipe.getRecipe_name() %></span>
                                <% if(user != null){ 
                                   if(check == true){%>
                                     <button class="like"><a href='deleteRecipeCon?recipe_name=<%=recipe.getRecipe_name() %>'><img id="like"
                                            src="https://image.flaticon.com/icons/png/128/39/39559.png"
                                            style="width:30px; height:30px;"></a></button>
                                     <%} else{ %>
                                    <button class="like"><a href='saveCon?recipe_name=<%=recipe.getRecipe_name() %>'><img id="like"
                                            src="https://image.flaticon.com/icons/png/128/31/31611.png"
                                            style="width:30px; height:30px;"></a></button>
                                     
                                            <%} }%>
                                </h3>
                                <p style="font-size: 17px; color: rgb(130, 78, 0); font-family: allfonts">���� ��� : <%=recipe.getRecipe_method() %>
                                </p>

                                <div>
                                    <br>
                                    <hr>
                                    <br>
                                    <a class="test_font1" style="font-size: 25px;">��� ����</a>
                                    <br>
                                    <br>
                                    <p style="font-size: 17px; color: black;"><%=recipe.getRecipe_food() %>
                                    </p>
                                </div>
                                <br>
                                <hr>

                                <br>
                                <br>





                                <!-- Post Date -->

                            </class>
                            <!-- �ǵ���� �ϴ� �� -->
                            <h4 class="test_font" style="font-size: 25px; margin-bottom: 30px;">��������</h4>
                            <div align="center" style="color: black; text-align: left;">
                                <img alt="" style="width: 100%;"
                                    src="img/<%=recipe.getRecipe_code() %>.png">
                                <br>
                                <img alt="" style="width: 100%;"
                                    src="img/<%=recipe.getRecipe_code() %>-1.png">
                                <br>
                                <img alt="" style="width: 100%;"
                                    src="img/<%=recipe.getRecipe_code() %>-2.png">
                                <br>
                                <% if( recipe.getRecipe_cook1() == null){ %>
                                     <p style="font-size: 17px; color: black;" align="center">���� ������ �غ����Դϴ� ..!
                                    </p>
                                    <%} %>
                            </div>
                            <!-- �ǵ���� �ϴ� �� -->

                            <br><br><br>
                            <p>
					<button class="btn" style="font-weight:bold;" onclick="history.back()">��������</button>
				</p>
                            <br>
                        </div>
                    </div>

                    <!-- ��� ���� -->
                    <hr>
                    <form action="CommentCon?"  method="get">
                        <textarea name = "comment" rows="5" cols="30" style="border: 1px solid gray;"></textarea>
                    <% if(user!= null){ %>
                        <input class="btn" style="vertical-align: top; margin-left: 30px; line-height:90px; font-weight:bold;" type="submit" value="����ۼ�">
                    </form>
                    <%} else{%>
                    <br><span>��� �ۼ� ������ �����ϴ� :(</span>
                    <%} %>
                    <hr>
                    
                    <div align="left">
                    <%  if(!comment.isEmpty()) {
                   for(int i=0; i< comment.size(); i++){ %>
                    <div style="color: #013d79; font-weight:bold;"><%= dao3.search_name(comment.get(i).getCmt_id()) %></div>
                    <div style="color: rgb(54, 53, 53); margin-bottom: 5px;"><%= comment.get(i).getCmt_content() %></div>   
                    <div style="color: darkgray; font-size:10px;"><%= comment.get(i).getCmt_time() %></div>               
                   <%}} %> 
                     
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