<%-- 
    Document   : OrderInformation
    Created on : May 27, 2023, 1:51:25 PM
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
        <title>Order Information | E-Shopper</title>
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
            /* Thêm margin và padding cho body */
            body {
                margin: 0;
                padding: 0;
            }

            /* Thêm font-size và background-color cho header */
            h1 {
                font-size: 36px;
                background-color: #ddd;
                padding: 10px;
            }

            /* Thêm margin và padding cho các phần tử p */
            p {
                margin: 0 0 5px;
                padding: 0;
            }

            /* Thêm border, padding và background-color cho table */
            table {
                border-collapse: collapse;
                width: 100%;
            }

            th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #ddd;
            }

            /* Thêm style cho action buttons */
            a {
                display: inline-block;
                padding: 5px 10px;
                color: white;
                text-decoration: none;
                border-radius: 3px;
                margin-right: 5px;
            }

            a:hover {
                background-color: #555;
                color: #fff;
            }
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
                                    <li><a href="MyOrders"><i class="fa fa-crosshairs"></i> MyOrders</a></li>
                                    <li><a href="CartDetails"><i class="fa fa-shopping-cart"></i> Cart</a></li>
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
                                    <li><a href="HomePage">Home</a></li>
                                    <li class="dropdown"><a href="ProductsList">Shop<i class="fa fa-angle-down"></i></a>
                                    </li> 
                                    <li class="dropdown"><a href="BlogsList">Blog<i class="fa fa-angle-down"></i></a>
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

                            <div class="brands_products">
                                

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
                            <div class="shipping text-center"><!--shipping-->
                                <img src="images/home/shipping.jpg" alt="" />
                            </div><!--/shipping-->

                        </div>
                    </div>

                    <div class="col-sm-9 padding-right">
                        <div class="product-details"><!--product-details-->



                            <div class="col-sm-14">
                                <head>
                                    <title>Order Details</title>
                                </head>
                                <body>
                                    <h1>Order Information</h1>
                                    <table>
                                        <tr>
                                            <td><strong>Order ID:</strong></td>
                                            <td>${Order.getOrder_id()}</td>
                                        </tr>
                                        <tr>
                                            <td><strong>Order Date</strong></td>
                                            <td>${Order.getOrder_date()}</td>
                                        </tr>
                                        <tr>
                                            <td><strong>Total Cost:</strong></td>
                                            <td>${Order.totalCost}</td>
                                        </tr>
                                        <tr>
                                            <td><strong>Status:</strong></td>
                                            <td>${Order.getStatus_order()}</td>
                                        </tr>
                                    </table>

                                    <h2>Receiver Information</h2>
                                    <table>
                                        <tr>
                                            <td><strong>Name:</strong></td>
                                            <td>${Order.getFullname()}</td>
                                        </tr>
                                        <tr>
                                            <td><strong>Gender:</strong></td>
                                            <c:if test="${Order.gender==0}">
                                                <td>Female</td>
                                            </c:if>
                                            <c:if test="${Order.gender==1}">
                                                <td>Male</td> 
                                            </c:if>
                                        </tr>
                                        <tr>
                                            <td><strong>Email:</strong></td>
                                            <td>${Order.getEmail()}</td>
                                        </tr>
                                        <tr>
                                            <td><strong>Mobile:</strong></td>
                                            <td>${Order.getMobile()}</td>
                                        </tr>
                                        <tr>
                                            <td><strong>Address</strong></td>
                                            <td>${Order.address}</td>
                                        </tr>
                                    </table>
                                    <h2>Ordered Products</h2>
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Thumbnail</th>
                                                <th>Name</th>
                                                <th>Category</th>
                                                <th>Unit Price</th>
                                                <th>Quantity</th>
                                                <th>Total Cost</th>
                                                <th>Action</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="orderdetails" items="${ListOrderDetail}" varStatus="status">
                                                <tr>
                                                    <td><img src="${orderdetails.product.getThumbnail()}" alt="Product 1" style="max-width: 100px; max-height: 100px;"></td>
                                                    <td>${orderdetails.product.getName_product()}</td>
                                                    <td>${orderdetails.product.getCategory_name()}</td>
                                                    <td>${orderdetails.product.getSale_prices()}$</td>
                                                    <td>${orderdetails.getQuantity()}</td>
                                                    <td>${orderdetails.product.getSale_prices()*orderdetails.getQuantity()}$</td>
                                                    <td>
                                                        <c:if test="${Order.status_order==3}">
                                                            <a style="background-color: orange" href="ProductDetails?productID=${orderdetails.product.getProduct_id()}">Re-buy</a>
                                                        </c:if>
                                                    </td>
                                                    <td>
                                                        <c:if test="${orderdetails.getFeedback_Status()==0&&Order.getStatus_order()==3}">
                                                        <a style="background-color: orange" href="Feedback?productID=${orderdetails.product.getProduct_id()}&orderID=${Order.getOrder_id()}">Feedback</a>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        <td> 
                                            <c:if test="${Order.getStatus_order()==1}">
                                                <a style="background-color: orange" href="UpdateOrderUser?oid=${Order.getOrder_id()}">Update</a>
                                                <a style="background-color: orange" href="OrderInformation?oid=${Order.getOrder_id()}&status=cancel">Cancel</a>
                                            </c:if>
                                        </td>


                                        </tbody>
                                    </table>
                                </body>

                            </div>
                        </div><!--/product-details-->






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
