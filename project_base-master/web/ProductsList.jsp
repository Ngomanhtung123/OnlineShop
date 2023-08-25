
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import = "Model.User" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Shop | E-Shopper</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">      
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
                                    <li class="active"><a href="ProductsList" class="active">Shop</a></li> 
                                    <li class="dropdown"><a href="BlogsList">Blog</a>
                                    </li> 
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-3">

                        </div>
                    </div>
                </div>
            </div>
        </div><!--/header-bottom-->
    </header>

        <!--        <section id="advertisement">
                    <div class="container">
                        <img src="images/shop/advertisement.jpg" alt="" />
                    </div>
                </section>-->

        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="left-sidebar">
                            <h2>New Product</h2>
                            <c:forEach items="${newproduct}" var="newproduct">
                                <div class="col-sm-12">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <a href="ProductDetails?productID=${p.product_id}"><img style="width: 268px;height: 249px" src="${newproduct.thumbnail}" alt="" /></a>
                                                <h2><del>$${newproduct.original_prices}</del></h2>
                                                <h4>$${newproduct.sale_prices}</h4>
                                                <p>${newproduct.name_product}</p>
                                                <p>${newproduct.brief_infor}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <h2>Category</h2>
                            <div class="panel-group category-products" id="accordian"><!--category-productsr-->
                                <c:forEach items="${listcategory}" var="ct">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title"><a href="search?keyword=${ct.category_id}&check=${false}&pricerange=">${ct.category_name}</a></h4>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <form action="search" method="get">
                                <div class="price-range">
                                    <h2>Price Range</h2>
                                    <div class="well">
                                        <c:if test="${pricerange==null}">
                                            <input type="text" class="span2" name="pricerange" value="0,100"  data-slider-min="0" data-slider-max="100" data-slider-step="5" data-slider-value="[0,100]" id="sl2" ><br />
                                        </c:if> 
                                        <c:if test="${pricerange!=null}">
                                            <input type="text" class="span2" name="pricerange" value="${pricerange}"  data-slider-min="0" data-slider-max="100" data-slider-step="5" data-slider-value="[${pricerange}]" id="sl2" ><br />
                                        </c:if>
                                        <b>$ 0</b> <b class="pull-right">$ 100</b>
                                    </div>
                                </div>
                                <div class="search-box">
                                    <input class="col-sm-9"  type="text" placeholder="Search..." name="keyword">
                                    <button class="col-sm-3" type="submit" name="check" value="true" ><i class="fa fa-search"></i></button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="col-sm-9 padding-right">
                        <div class="features_items"><!--features_items-->
                            <h2 class="title text-center">Features Items</h2>
                            <c:forEach items="${listproduct}" var="p">
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <a href="ProductDetails?productID=${p.product_id}"><img style="width: 268px;height: 249px" src="${p.thumbnail}" alt="" /></a>
                                                <h2><del>$${p.original_prices}</del></h2>
                                                <h5>$${p.sale_prices}</h5>
                                                <p>${p.name_product}</p>
                                                <p>${p.brief_infor}</p>
                                                <a href="CartDetails?productID=${p.product_id}" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                            </div>
                                        </div>
                                        <div class="choose">
                                            <ul class="nav nav-pills nav-justified">
                                                <li><a href=""><i class="fa fa-eye"></i>Feedback</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <c:if test="${notsearch==1}">
                            <ul class="pagination col-sm-12">
                                <c:forEach var="i" begin="1" end="${sotrang}">
                                    <c:if test="${pageactive==null}">
                                        <c:if test="${i==1}">
                                            <li class="active"><a href="search?page=${i}&keyword=${keyword}&check=${check}&pricerange=${pricerange}">${i}</a></li>
                                            </c:if>
                                            <c:if test="${i!=1}">
                                            <li><a href="search?page=${i}&keyword=${keyword}&check=${check}&pricerange=${pricerange}">${i}"</a></li>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${pageactive!=null}">
                                            <c:if test="${i==pageactive}">
                                            <li class="active"><a href="search?page=${i}&keyword=${keyword}&check=${check}&pricerange=${pricerange}">${i}</a></li>
                                            </c:if>
                                            <c:if test="${i!=pageactive}">
                                            <li><a href="search?page=${i}&keyword=${keyword}&check=${check}&pricerange=${pricerange}">${i}</a></li>
                                            </c:if>
                                        </c:if>
                                    </c:forEach>
                            </ul>
                            </c:if>
                            <c:if test="${notsearch==0}">
                                                            <ul class="pagination col-sm-12">
                                <c:forEach var="i" begin="1" end="${sotrang}">
                                    <c:if test="${pageactive==null}">
                                        <c:if test="${i==1}">
                                            <li class="active"><a href="ProductsList?page=${i}">${i}</a></li>
                                            </c:if>
                                            <c:if test="${i!=1}">
                                            <li><a href="ProductsList?page=${i}">${i}"</a></li>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${pageactive!=null}">
                                            <c:if test="${i==pageactive}">
                                            <li class="active"><a href="ProductsList?page=${i}">${i}</a></li>
                                            </c:if>
                                            <c:if test="${i!=pageactive}">
                                            <li><a href="ProductsList?page=${i}">${i}</a></li>
                                            </c:if>
                                        </c:if>
                                    </c:forEach>
                            </ul>
                            </c:if>
                        </div><!--features_items-->
                    </div>
                </div>
            </div>
        </section>

        <footer id="footer"><!--Footer-->
            <div class="footer-top">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-2">
                            <div class="companyinfo">
                                <h2><span>e</span>-shopper</h2>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="address">
                                <img src="images/home/map.png" alt="" />
                                <p>505 S Atlantic Ave Virginia Beach, VA(Virginia)</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="footer-widget">
                <div class="container">
                    <div class="row">

                    </div>
                </div>
            </div>

            <div class="footer-bottom">
                <div class="container">
                    <div class="row">
                        <p class="pull-left">Copyright © 2013 E-Shopper. All rights reserved.</p>
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
