<%-- 
    Document   : CartContact
    Created on : May 27, 2023, 1:12:52 PM
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
        <title>Cart Contact | E-Shopper</title>
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
            .order-status {
                text-align: center;
            }
            .order-summary {
                margin-top: 50px;
            }
            .order-summary table {
                border-collapse: collapse;
                width: 100%;
            }
            .order-summary th, .order-summary td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: left;
            }
            .order-summary th {
                background-color: #eee;
            }
            .instruction {
                display: flex;
                flex-direction: row;
                align-items: center;
                justify-content: space-around;
                margin-top: 50px;
                background-color: #f2f2f2;
                padding: 20px;
            }
            .instruction > div {
                display: flex;
                flex-direction: column;
                align-items: center;
                text-align: center;
            }
            .instruction h3 {
                font-size: 1.5rem;
                margin-bottom: 10px;
            }
            .instruction p {
                font-size: 1.2rem;
                line-height: 1.5;
            }
            .instruction {
                display: flex;
                flex-direction: row;
                align-items: center;
                justify-content: space-around;
                margin-top: 50px;
                background-color: #f2f2f2;
                padding: 20px;
            }

            .instruction > div {
                flex-basis: 33.33%;
                box-sizing: border-box;
                display: flex;
                flex-direction: column;
                align-items: center;
                text-align: center;
            }

            .instruction h3 {
                font-size: 1.5rem;
                margin-bottom: 10px;
            }

            .instruction p {
                font-size: 1.2rem;
                line-height: 1.5;
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
                                    <li><a href=""><i class="fa fa-phone"></i> +89 373657093</a></li>
                                    <li><a href=""><i class="fa fa-envelope"></i> vietanh100102@gmail.com</a></li>
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
                                    <li><a href="UserProfile"><i class="fa fa-user"></i> Account</a></li>
                                    <li><a href="logout"><i class="fa fa-crosshairs"></i> Checkout</a></li>
                                    <li><a href="CartDetails"><i class="fa fa-shopping-cart"></i> Cart</a></li>
                                    <li><a href="MyOrders"><i class="fa fa-shopping-cart"></i> MyOrders</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="header-bottom">
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
                                    <li><a href="HomePage">Home</a></li>
                                    <li class="dropdown"><a href="PostsList">Shop</a>
                                    </li> 
                                    <li class="dropdown"><a href="BlogsList">Blog</a>
                                    </li>
                                </ul>
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
                                <c:forEach items="${listCategory}" var="ct">
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
                        <div class="product-details"><!--product-details-->



                            <div class="col-sm-7">
                                <form action="CartCompletion">
                                    <div class="order-summary">
                                        <h3>Information line</h3>
                                        <table>
                                            <tr>
                                                <th>Product ID</th>
                                                <th>Product</th>
                                                <th>Quantity</th>
                                                <th>Cost</th>
                                                <th>Total</th>
                                            </tr>
                                            <c:forEach var="cart" items="${listCart}">
                                                <tr>
                                                    <td><input readonly name="productid" value="${cart.getProduct().product_id}"></td>
                                                    <td>${cart.getProduct().getName_product()}</td>
                                                    <td>${cart.getQuantity()}</td>
                                                    <td>${cart.getProduct().getSale_prices()} $</td>
                                                    <td>${cart.getQuantity()*cart.getProduct().getSale_prices()}</td>
                                                </tr>
                                            </c:forEach>

                                        </table>
                                        <p></p>
                                        <p>--------------------------------------------------------------------------------------------------------------------------</p
                                        <p>Total Cost: ${total} $</p>
                                    </div>
                                    <div><h5>Information User</h5></div>
                                    <!--                                    <div class="form-group">
                                                                            <label for="name">Name:</label>
                                                                            <input type="text" id="name" name="name" value="${name}">
                                                                        </div>
                                    
                                                                        <div class="form-group">
                                                                            <label for="email">Email:</label>
                                                                            <input type="email" id="email" name="email" required="" value="${email}">
                                                                        </div>
                                    
                                                                        <div class="form-group">
                                                                            <label for="phone">Phone:</label>
                                                                            <input type="tel" id="phone" name="phone" required="" value="${phone}">
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="phone">Address:</label>
                                                                            <input type="tel" name="address" value="${address}">
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="phone">Gender:</label>    
                                                                            <select name="gender" id="gender">
                                                                                <option <c:if test="${gender==0}">selected</c:if> value="0">Female</option>
                                                                                <option <c:if test="${gender==1}">selected</c:if> value="1">Male</option>
                                                                            </select>
                                                                        </div>-->
                                        <table>
                                            <tr>
                                            <div class="form-group">
                                                <td> <label for="name">Name:</label></td>
                                                <td> <input style="width: 300px" type="text" id="name" name="name" value="${name}"></td>
                                        </div>
                                        </tr>
                                        <tr>
                                        <div class="form-group">
                                            <td><label for="email">Email:</label></td>
                                            <td><input style="width: 300px" type="email" id="email" name="email" required="" value="${email}"></td>
                                        </div>
                                        </tr>
                                        <tr>
                                        <div class="form-group">
                                            <td><label for="phone">Phone:</label></td>
                                            <td><input style="width: 300px" type="tel" id="phone" name="phone" required="" value="${phone}"></td>
                                        </div>
                                        </tr>
                                        <tr>
                                        <div class="form-group">
                                            <td><label for="phone">Address:</label></td>
                                            <td><input style="width: 300px" type="tel" name="address" value="${address}"></td>
                                        </div>
                                        </tr>
                                        <tr>
                                        <div class="form-group">
                                            <td><label for="phone">Gender:</label></td>    
                                            <td><select name="gender" id="gender">
                                                <option <c:if test="${gender==0}">selected</c:if> value="0">Female</option>
                                                <option <c:if test="${gender==1}">selected</c:if> value="1">Male</option>
                                            </select></td>
                                        </div>
                                        </tr>
                                    </table>
                                    <button class="col-sm-3" type="submit" name="check" value="true" ><i class="fa fa-shopping-cart"></i></button>
                                </form>
                                <form action="CartDetails">
                                    <button class="col-sm-3" type="submit" name="check" value="true" >Change</button>
                                </form>
                            </div>
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
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,sed do eiusmod tempor</p>
                            </div>
                        </div>
                        <div class="col-sm-7">
                            <div class="col-sm-3">
                                <div class="video-gallery text-center">
                                    <a href="#">
                                        <div class="iframe-img">
                                            <img src="images/home/iframe1.png" alt="" />
                                        </div>
                                        <div class="overlay-icon">
                                            <i class="fa fa-play-circle-o"></i>
                                        </div>
                                    </a>
                                    <p>Circle of Hands</p>
                                    <h2>24 DEC 2014</h2>
                                </div>
                            </div>

                            <div class="col-sm-3">
                                <div class="video-gallery text-center">
                                    <a href="#">
                                        <div class="iframe-img">
                                            <img src="images/home/iframe2.png" alt="" />
                                        </div>
                                        <div class="overlay-icon">
                                            <i class="fa fa-play-circle-o"></i>
                                        </div>
                                    </a>
                                    <p>Circle of Hands</p>
                                    <h2>24 DEC 2014</h2>
                                </div>
                            </div>

                            <div class="col-sm-3">
                                <div class="video-gallery text-center">
                                    <a href="#">
                                        <div class="iframe-img">
                                            <img src="images/home/iframe3.png" alt="" />
                                        </div>
                                        <div class="overlay-icon">
                                            <i class="fa fa-play-circle-o"></i>
                                        </div>
                                    </a>
                                    <p>Circle of Hands</p>
                                    <h2>24 DEC 2014</h2>
                                </div>
                            </div>

                            <div class="col-sm-3">
                                <div class="video-gallery text-center">
                                    <a href="#">
                                        <div class="iframe-img">
                                            <img src="images/home/iframe4.png" alt="" />
                                        </div>
                                        <div class="overlay-icon">
                                            <i class="fa fa-play-circle-o"></i>
                                        </div>
                                    </a>
                                    <p>Circle of Hands</p>
                                    <h2>24 DEC 2014</h2>
                                </div>
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
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>Service</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="">Online Help</a></li>
                                    <li><a href="">Contact Us</a></li>
                                    <li><a href="">Order Status</a></li>
                                    <li><a href="">Change Location</a></li>
                                    <li><a href="">FAQ’s</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>Quock Shop</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="">T-Shirt</a></li>
                                    <li><a href="">Mens</a></li>
                                    <li><a href="">Womens</a></li>
                                    <li><a href="">Gift Cards</a></li>
                                    <li><a href="">Shoes</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>Policies</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="">Terms of Use</a></li>
                                    <li><a href="">Privecy Policy</a></li>
                                    <li><a href="">Refund Policy</a></li>
                                    <li><a href="">Billing System</a></li>
                                    <li><a href="">Ticket System</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>About Shopper</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="">Company Information</a></li>
                                    <li><a href="">Careers</a></li>
                                    <li><a href="">Store Location</a></li>
                                    <li><a href="">Affillate Program</a></li>
                                    <li><a href="">Copyright</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-3 col-sm-offset-1">
                            <div class="single-widget">
                                <h2>About Shopper</h2>
                                <form action="#" class="searchform">
                                    <input type="text" placeholder="Your email address" />
                                    <button type="submit" class="btn btn-default"><i class="fa fa-arrow-circle-o-right"></i></button>
                                    <p>Get the most recent updates from <br />our site and be updated your self...</p>
                                </form>
                            </div>
                        </div>

                    </div>
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
