<%-- 
    Document   : BlogsList
    Created on : May 27, 2023, 12:57:17 PM
    Author     : vieta
--%>

<%-- 
    Document   : BlogsList
    Created on : May 27, 2023, 12:57:17 PM
    Author     : vieta
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "Model.User" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Blog | E-Shopper</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
        <style>
            .search-box {
                display: flex;
                align-items: center;
                border: 1px solid #ccc;
                padding: 10px;
            }

            input[type="text"] {
                flex-grow: 1;
                border: none;
                font-size: 14px;
                padding: 8px;
            }

            button[type="submit"] {
                background-color: orange;
                border: none;
                color: white;
                cursor: pointer;
                font-size: 14px;
                padding: 8px 16px;
                margin-left: 10px;
            }
        </style>
    </head><!--/head-->

    <body>
        <header id="header"><!--header-->
            <div class="header_top"><!--header_top-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="contactinfo">
                                <ul class="nav nav-pills">
                                    <li><a href=""><i class="fa fa-phone"></i> 0369 354 782</a></li>
                                    <li><a href=""><i class="fa fa-envelope"></i> sangnthe160447@fpt.edu.vn</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="social-icons pull-right">
                                <ul class="nav navbar-nav">
                                    <li><a href=""><i class="fa fa-facebook"></i></a></li>
                                    <li><a href=""><i class="fa fa-twitter"></i></a></li>
                                    <li><a href=""><i class="fa fa-linkedin"></i></a></li>
                                    <li><a href=""><i class="fa fa-dribbble"></i></a></li>
                                    <li><a href=""><i class="fa fa-google-plus"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header_top-->

            <div class="header-middle"><!--header-middle-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="logo pull-left">
                                <a href="HomePage"><img style="width: 150px;height: 150px" src="https://i.pinimg.com/originals/95/f8/58/95f8588d6469a16271ea2d2fad419d00.png" alt="" /></a>
                            </div>
                            <div class="btn-group pull-right">
                                <!--                                <div class="btn-group">
                                                                    <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
                                                                        USA
                                                                        <span class="caret"></span>
                                                                    </button>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="">Canada</a></li>
                                                                        <li><a href="">UK</a></li>
                                                                    </ul>
                                                                </div>
                                
                                                                <div class="btn-group">
                                                                    <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
                                                                        DOLLAR
                                                                        <span class="caret"></span>
                                                                    </button>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="">Canadian Dollar</a></li>
                                                                        <li><a href="">Pound</a></li>
                                                                    </ul>
                                                                </div>-->
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="shop-menu pull-right">
                                <ul class="nav navbar-nav">
                                    <c:if test="${sessionScope.u==null}">
                                    <li><a href="UserLogin"><i class="fa fa-lock"></i> Login</a></li>
                                    <li><a href="UserRegister"><i class="fa fa-crosshairs"></i> Register</a></li>
                                    </c:if>  
                                    <c:if test="${sessionScope.u!=null}">
                                    <li><a href="UserProfile"><i class="fa fa-user"></i> Account</a></li>
                                    <li><a href="logout"><i class="fa fa-crosshairs"></i> Checkout</a></li>
                                    <li><a href="CartDetails"><i class="fa fa-shopping-cart"></i> Cart</a></li>
                                    <li><a href="MyOrders"><i class="fa fa-shopping-cart"></i>MyOrder</a></li>
                                    </c:if>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header-middle-->

            <div class="header-bottom"><!--header-bottom-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-9">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                            <div class="mainmenu pull-left">
                                <ul class="nav navbar-nav collapse navbar-collapse">
                                    <li class="dropdown"><a href="HomePage">Home</a></li>
                                    <li class="dropdown"><a href="ProductsList">Shop</a>
                                    </li> 
                                    <li class="active"><a href="BlogsList" class="active">Blog</a>                                       
                                    </li> 
                                    
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-3">

                            <!--                            <form action="BlogsList" method="get">
                                                            <div class="search_box pull-right">
                                                                <div class="col-sm-3">
                                                                    <button type="submit">Search</button>
                                                                </div>
                                                                <div class="col-sm-9">
                                                                    <input type="text" name = "search" placeholder="Search"/>
                                                                </div>
                            
                                                        </form>-->

                        </div>
                    </div>
                </div>
            </div>
        </div><!--/header-bottom-->
    </header><!--/header-->

    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="left-sidebar">
                        <h2>Category</h2>
                        <div class="panel-group category-products" id="accordian"><!--category-productsr-->
                            <div class="panel panel-default">

                            </div>



                            <c:forEach items="${list}" var="cb">


<!--                                    <h4 class="panel-title"><a href="#">${cb.category_name} </a></h4>-->
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"><a href="BlogsList?search=${cb.category_id}&check=${false}">${cb.category_name}</a></h4>
                                    </div>
                                </div>

                            </c:forEach>
                            <div class="left-sidebar">
                                <h2>Last Post</h2>
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src="${newbl.thumbnail}"  alt="" />
                                            <p>${newbl.tittle}</p>
                                            <a href="BlogDetails?blogid=${newbl.blog_id}" class="btn btn-default add-to-cart">Read More</a>
                                        </div>
                                        <!--                                    <div class="product-overlay">
                                                                                <div class="overlay-content" >
                                                                                    <h2 style="color: orange;">$56</h2>
                                                                                    <p>Easy Polo Black Edition</p>
                                                                                    <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                </div>
                                                                            </div>-->
                                    </div>
                                </div><!--/category-products-->

                                <div class="brands_products">
                                    <form action="BlogsList" method="get">
                                        <div class="search-box">
                                            <input class="col-sm-9"  type="text" placeholder="Search..." name="search">
                                            <button class="col-sm-3" type="submit" name="check" value="true"><i class="fa fa-search"></i></button>
                                        </div>
                                    </form>
                                </div><!--
                            </div>/brands_products-->





                            </div>

                            <!--							<div class="panel panel-default">
                                                                                            <div class="panel-heading">
                                                                                                    <h4 class="panel-title"><a href="#">${CategoryBlog.category_name}</a></h4>
                                                                                            </div>
                                                                                    </div>
                            -->                                <!--
                                                            <div class="panel panel-default">
                                                                    <div class="panel-heading">
                                                                            <h4 class="panel-title"><a href="#">Households</a></h4>
                                                                    </div>
                                                            </div>-->
                            <!--							<div class="panel panel-default">
                                                                                            <div class="panel-heading">
                                                                                                    <h4 class="panel-title"><a href="#">Interiors</a></h4>
                                                                                            </div>
                                                                                    </div>
                                                                                    <div class="panel panel-default">
                                                                                            <div class="panel-heading">
                                                                                                    <h4 class="panel-title"><a href="#">Clothing</a></h4>
                                                                                            </div>
                                                                                    </div>
                                                                                    <div class="panel panel-default">
                                                                                            <div class="panel-heading">
                                                                                                    <h4 class="panel-title"><a href="#">Bags</a></h4>
                                                                                            </div>
                                                                                    </div>
                                                                                    <div class="panel panel-default">
                                                                                            <div class="panel-heading">
                                                                                                    <h4 class="panel-title"><a href="#">Shoes</a></h4>
                                                                                            </div>-->

                        </div><!--/category-products-->

                        <div class="brands_products"><!--brands_products-->
                            <!--							<h2>Brands</h2>
                                                                                    <div class="brands-name">
                                                                                            <ul class="nav nav-pills nav-stacked">
                                                                                                    <li><a href=""> <span class="pull-right">(50)</span>Acne</a></li>
                                                                                                    <li><a href=""> <span class="pull-right">(56)</span>Grüne Erde</a></li>
                                                                                                    <li><a href=""> <span class="pull-right">(27)</span>Albiro</a></li>
                                                                                                    <li><a href=""> <span class="pull-right">(32)</span>Ronhill</a></li>
                                                                                                    <li><a href=""> <span class="pull-right">(5)</span>Oddmolly</a></li>
                                                                                                    <li><a href=""> <span class="pull-right">(9)</span>Boudestijn</a></li>
                                                                                                    <li><a href=""> <span class="pull-right">(4)</span>Rösch creative culture</a></li>
                                                                                            </ul>
                                                                                    </div>-->
                        </div><!--/brands_products-->

                        <div class="price-range"><!--price-range-->
                            <!--							<h2>Price Range</h2>
                                                                                    <div class="well">
                                                                                             <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="sl2" ><br />
                                                                                             <b>$ 0</b> <b class="pull-right">$ 600</b>
                                                                                    </div>-->
                        </div><!--/price-range-->

                        <div class="shipping text-center"><!--shipping-->
                            <img src="images/home/shipping.jpg" alt="" />
                        </div><!--/shipping-->
                    </div>
                </div>
                <div class="col-sm-9">
                    <div class="blog-post-area">
                        <h2 class="title text-center">Latest From our Blog</h2>
                        <c:forEach items="${bloglist}" var="blog">
                            <div class="single-blog-post">
                                <h3>${blog.tittle}</h3>
                                <div class="post-meta">
                                    <ul>
                                        <li><i class="fa fa-user"></i>${blog.nameAuthor}</li>
                                        <!--									<li><i class="fa fa-clock-o"></i> 1:33 pm</li>-->
                                        <c:if test="${blog.update_date!=null}">
                                            <li><i class="fa fa-calendar"></i>${blog.update_date}</li>
                                            </c:if>
                                            <c:if test="${blog.update_date==null}">
                                            <li><i class="fa fa-calendar"></i>${blog.create_date}</li>
                                            </c:if>
                                            <li><i class="fa fa-book"></i>${blog.category_name}</li>
                                    </ul>
                                </div>
                                <a href="">
                                    <img src="${blog.thumbnail}" style="height: 500px;width: 500px" alt="">
                                </a>
                                <h5>${blog.tittle}</h5>
                                <p>${blog.brief_infor}</p>
                                <a  class="btn btn-primary" href="BlogDetails?blogid=${blog.blog_id}">Read More</a>
                            </div>
                        </c:forEach>
                        <!--                            <div class="single-blog-post">
                                                        <h3>Girls Pink T Shirt arrived in store</h3>
                                                        <div class="post-meta">
                                                            <ul>
                                                                <li><i class="fa fa-user"></i> Mac Doe</li>
                                                                                                                                        <li><i class="fa fa-clock-o"></i> 1:33 pm</li>
                                                                <li><i class="fa fa-calendar"></i> DEC 5, 2013</li>
                                                            </ul>
                                                                                                                        <span>
                                                                                                                                    <i class="fa fa-star"></i>
                                                                                                                                    <i class="fa fa-star"></i>
                                                                                                                                    <i class="fa fa-star"></i>
                                                                                                                                    <i class="fa fa-star"></i>
                                                                                                                                    <i class="fa fa-star-half-o"></i>
                                                                                                                            </span>
                                                        </div>
                                                        <a href="">
                                                            <img src="images/blog/blog-two.jpg" alt="">
                                                        </a>
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
                                                        <a  class="btn btn-primary" href="">Read More</a>
                                                    </div>-->
                        <!--                            <div class="single-blog-post">
                                                        <h3>Girls Pink T Shirt arrived in store</h3>
                                                        <div class="post-meta">
                                                            <ul>
                                                                <li><i class="fa fa-user"></i> Mac Doe</li>
                                                                                                                                        <li><i class="fa fa-clock-o"></i> 1:33 pm</li>
                                                                <li><i class="fa fa-calendar"></i> DEC 5, 2013</li>
                                                            </ul>
                                                                                                                        <span>
                                                                                                                                    <i class="fa fa-star"></i>
                                                                                                                                    <i class="fa fa-star"></i>
                                                                                                                                    <i class="fa fa-star"></i>
                                                                                                                                    <i class="fa fa-star"></i>
                                                                                                                                    <i class="fa fa-star-half-o"></i>
                                                                                                                            </span>
                                                        </div>
                                                        <a href="">
                                                            <img src="images/blog/blog-three.jpg" alt="">
                                                        </a>
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
                                                        <a  class="btn btn-primary" href="">Read More</a>
                                                    </div>-->
                        <div class="pagination-area">
                            <ul class="pagination">
                                <c:forEach var="i" begin="1" end="${sotrang}">
                                    <c:if test="${pageactive==null}">
                                        <c:if test="${i==1}">
                                            <li><a href="BlogsList?page=${i}&search=${search}&check=${check}" class="active">${i}</a></li>
                                            </c:if>
                                            <c:if test="${i!=1}">
                                            <li><a href="BlogsList?page=${i}&search=${search}&check=${check}">${i}</a></li>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${pageactive!=null}">
                                            <c:if test="${i==pageactive}">
                                            <li><a href="BlogsList?page=${i}&search=${search}&check=${check}" class="active">${i}</a></li>
                                            </c:if>
                                            <c:if test="${i!=pageactive}">
                                            <li><a href="BlogsList?page=${i}&search=${search}&check=${check}">${i}</a></li>
                                            </c:if>
                                        </c:if>
<!--                                        <li><a href="BlogsList?page=${i}" class="active">1</a></li>
                                        <li><a href="BlogsList?page=${i}">${i}</a></li>-->
                                </c:forEach>
                                <!--                                    <li><a href=""><i class="fa fa-angle-double-right"></i></a></li>-->
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer id="footer"><!--Footer-->
        <div class="footer-top">
            <div class="container">
                
            </div>
        </div>

        <div class="footer-widget">
            <div class="container">
                
            </div>
        </div>

        <div class="footer-bottom">
            <div class="container">
                <div class="row">
                    <p class="pull-left">Copyright © 2013 E-SHOPPER Inc. All rights reserved.</p>
                    <p class="pull-right">Designed by <span><a target="_blank" href="http://www.themeum.com">Themeum</a></span></p>
                </div>
            </div>
        </div>

    </footer><!--/Footer-->



    <script src="js/jquery.js"></script>
    <script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>


