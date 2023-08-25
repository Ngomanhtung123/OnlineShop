<%-- 
    Document   : HomePage
    Created on : May 27, 2023, 12:56:52 PM
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
        <title>Home | E-Shopper</title>
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
    </head><!--/head-->

    <body>
        <header id="header"><!--header-->
            <div class="header_top"><!--header_top-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="contactinfo">
                                <ul class="nav nav-pills">
                                    <li><a href="#"><i class="fa fa-phone"></i> +85 5346 1670</a></li>
                                    <li><a href="#"><i class="fa fa-envelope"></i> sangnthe160447@fpt.edu.vn</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="social-icons pull-right">
                                <ul class="nav navbar-nav">
                                    <li><a href="https://www.facebook.com/sangmo2002"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                    <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                                    <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
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
                        </div>
                        <div class="col-sm-8">
                            <div class="shop-menu pull-right">
                                <ul class="nav navbar-nav">
                                    <c:if test="${sessionScope.u==null}">
                                    <li><a href="UserLogin"><i class="fa fa-lock"></i> Login</a></li>
                                    <li><a href="UserRegister"><i class="fa fa-crosshairs"></i> Register</a></li>
                                        </c:if>
                                        <c:if test="${sessionScope.u!=null}">
                                    <li><a href="logout"><i class="fa fa-crosshairs"></i> Logout</a></li>
                                    <li><a href="CartDetails"><i class="fa fa-shopping-cart"></i> Cart</a></li>
                                    <li><a href="MyOrders"><i class="fa fa-shopping-cart"></i>MyOrder</a></li>
                                    <li><a href="UserProfile">
                                                <img style="width: 40px; height: 40px;border: 30px" class="img-circle" src="${sessionScope.u.avartar}" alt="alt"/>
                                        </a></li>
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
                                    <li><a href="HomePage" class="active">Home</a></li>
                                    <li class="dropdown"><a href="ProductsList">Shop</a>
                                    </li> 
                                    <li class="dropdown"><a href="BlogsList">Blog</a>
                                    </li>
                                    <c:if test="${sessionScope.u!=null}">
                                    <li class="dropdown">
                                        <a href="UserProfile">Welcome ${sessionScope.u.username}</a>
                                    </li>
                                    </c:if>
                                    <!--								<li><a href="404.html">404</a></li>-->
                                    <!--                                    <li><a href="contact-us.html">Contact</a></li>-->
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header-bottom-->
        </header><!--/header-->

        <section id="slider"><!--slider-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <%int a = 0;%>
                                <c:forEach items="${listslider}" var="i">
                                    <%if(a==0){
                                    %>
                                    <li data-target="#slider-carousel" data-slide-to="${a}" class="active"></li>
                                        <% 
                                            a++;
                                        }else{%>
                                    <li data-target="#slider-carousel" data-slide-to="${a}"></li>
                                        <%}%>

                                </c:forEach>

                            </ol>

                            <div class="carousel-inner">
                                <!--                                                        <div class="item active">
                                                                                                <div class="col-sm-6">
                                                                                                        <h1><span>E</span>-Shop</h1>
                                                                                                        <h2>Free E-Commerce Template</h2>
                                                                                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                                                                                                        <button type="button" class="btn btn-default get">Get it now</button>
                                                                                                </div>
                                                                                                <div class="col-sm-6">
                                                                                                </div>
                                                                                        </div>-->
                                <%int count = 0;%>
                                <c:forEach items="${listslider}" var="i">
                                    <%if(count == 0){
                                    %>
                                    <div class="item active">
                                        <%
                                            count++;
                                    }else{
                                        %>
                                        <div class="item"> 
                                            <%
}%>
                                            <div class="col-sm-6">
                                                <h1><span>E</span>-BookShop</h1>
                                                <h2>${i.slider_title}</h2>
                                                <p> ${i.slider_detail} </p>
                                                <a href="${i.backlink}" class="btn btn-default add-to-cart">Get it now</a>
<!--                                                <button type="button" class="btn btn-default get">Get it now</button>-->
                                            </div>
                                            <div class="col-sm-6">
                                                <img src="${i.slider_img}" class="girl img-responsive" alt="" />
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <!--							<div class="item active">
                                                                                                    <div class="col-sm-6">
                                                                                                            <h1><span>E</span>-Shop</h1>
                                                                                                            <h2>Free E-Commerce Template</h2>
                                                                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                                                                                                            <button type="button" class="btn btn-default get">Get it now</button>
                                                                                                    </div>
                                                                                                    <div class="col-sm-6">
                                                                                                    </div>
                                                                                            </div>
                                                                                            <div class="item">
                                                                                                    <div class="col-sm-6">
                                                                                                            <h1><span>E</span>-SHOPPER</h1>
                                                                                                            <h2>100% Responsive Design</h2>
                                                                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                                                                                                            <button type="button" class="btn btn-default get">Get it now</button>
                                                                                                    </div>
                                                                                                    <div class="col-sm-6">
                                                                                                            <img src="images/home/girl2.jpg" class="girl img-responsive" alt="" />
                                                                                                            <img src="images/home/pricing.png"  class="pricing" alt="" />
                                                                                                    </div>
                                                                                            </div>
                                                                                            
                                                                                            <div class="item">
                                                                                                    <div class="col-sm-6">
                                                                                                            <h1><span>E</span>-SHOPPER</h1>
                                                                                                            <h2>Free Ecommerce Template</h2>
                                                                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                                                                                                            <button type="button" class="btn btn-default get">Get it now</button>
                                                                                                    </div>
                                                                                                    <div class="col-sm-6">
                                                                                                            <img src="images/home/girl3.jpg" class="girl img-responsive" alt="" />
                                                                                                            <img src="images/home/pricing.png" class="pricing" alt="" />
                                                                                                    </div>
                                                                                            </div>-->

                                </div>

                                <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                                    <i class="fa fa-angle-left"></i>
                                </a>
                                <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </div>

                        </div>
                    </div>
                </div>
        </section><!--/slider-->

        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="left-sidebar">
                            <h2>New post</h2>
                            <!--<div class="panel-group category-products" id="accordian">category-productsr-->
                            <div class="col-sm-12">
                                <div class="product-image-wrapper">
                                    <div class="single-products">

                                        <div class="productinfo text-center">
                                            <img src="${newbl.thumbnail}" alt="" />
                                            <p>${newbl.tittle}</p>
                                            <p>${newbl.brief_infor}</p>
                                            <a href="BlogDetails?blogid=${newbl.blog_id}" class="btn btn-default add-to-cart">Read More</a>
                                        </div>
                                        <!--										<div class="product-overlay">
                                                                                                                                <div class="overlay-content">
                                                                                                                                        <h2>$56</h2>
                                                                                                                                        <p>Easy Polo Black Edition</p>
                                                                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to </a>
                                                                                                                                </div>
                                                                                                                        </div>-->
                                    </div>
                                    <!--								<div class="choose">
                                                                                                            <ul class="nav nav-pills nav-justified">
                                                                                                                    <li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                                                                                                    <li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                                                                                            </ul>
                                                                                                    </div>-->
                                </div>
                            </div>
                            <!--							<div class="panel panel-default">
                                                                                            <div class="panel-heading">
                                                                                                    <h4 class="panel-title">
                                                                                                            <a data-toggle="collapse" data-parent="#accordian" href="#sportswear">
                                                                                                                    <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                                                                                    Sportswear
                                                                                                            </a>
                                                                                                    </h4>
                                                                                            </div>
                                                                                            <div id="sportswear" class="panel-collapse collapse">
                                                                                                    <div class="panel-body">
                                                                                                            <ul>
                                                                                                                    <li><a href="#">Nike </a></li>
                                                                                                                    <li><a href="#">Under Armour </a></li>
                                                                                                                    <li><a href="#">Adidas </a></li>
                                                                                                                    <li><a href="#">Puma</a></li>
                                                                                                                    <li><a href="#">ASICS </a></li>
                                                                                                            </ul>
                                                                                                    </div>
                                                                                            </div>
                                                                                    </div>
                                                                                    <div class="panel panel-default">
                                                                                            <div class="panel-heading">
                                                                                                    <h4 class="panel-title">
                                                                                                            <a data-toggle="collapse" data-parent="#accordian" href="#mens">
                                                                                                                    <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                                                                                    Mens
                                                                                                            </a>
                                                                                                    </h4>
                                                                                            </div>
                                                                                            <div id="mens" class="panel-collapse collapse">
                                                                                                    <div class="panel-body">
                                                                                                            <ul>
                                                                                                                    <li><a href="#">Fendi</a></li>
                                                                                                                    <li><a href="#">Guess</a></li>
                                                                                                                    <li><a href="#">Valentino</a></li>
                                                                                                                    <li><a href="#">Dior</a></li>
                                                                                                                    <li><a href="#">Versace</a></li>
                                                                                                                    <li><a href="#">Armani</a></li>
                                                                                                                    <li><a href="#">Prada</a></li>
                                                                                                                    <li><a href="#">Dolce and Gabbana</a></li>
                                                                                                                    <li><a href="#">Chanel</a></li>
                                                                                                                    <li><a href="#">Gucci</a></li>
                                                                                                            </ul>
                                                                                                    </div>
                                                                                            </div>
                                                                                    </div>
                                                                                    
                                                                                    <div class="panel panel-default">
                                                                                            <div class="panel-heading">
                                                                                                    <h4 class="panel-title">
                                                                                                            <a data-toggle="collapse" data-parent="#accordian" href="#womens">
                                                                                                                    <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                                                                                    Womens
                                                                                                            </a>
                                                                                                    </h4>
                                                                                            </div>
                                                                                            <div id="womens" class="panel-collapse collapse">
                                                                                                    <div class="panel-body">
                                                                                                            <ul>
                                                                                                                    <li><a href="#">Fendi</a></li>
                                                                                                                    <li><a href="#">Guess</a></li>
                                                                                                                    <li><a href="#">Valentino</a></li>
                                                                                                                    <li><a href="#">Dior</a></li>
                                                                                                                    <li><a href="#">Versace</a></li>
                                                                                                            </ul>
                                                                                                    </div>
                                                                                            </div>
                                                                                    </div>
                                                                                    <div class="panel panel-default">
                                                                                            <div class="panel-heading">
                                                                                                    <h4 class="panel-title"><a href="#">Kids</a></h4>
                                                                                            </div>
                                                                                    </div>
                                                                                    <div class="panel panel-default">
                                                                                            <div class="panel-heading">
                                                                                                    <h4 class="panel-title"><a href="#">Fashion</a></h4>
                                                                                            </div>
                                                                                    </div>
                                                                                    <div class="panel panel-default">
                                                                                            <div class="panel-heading">
                                                                                                    <h4 class="panel-title"><a href="#">Households</a></h4>
                                                                                            </div>
                                                                                    </div>
                                                                                    <div class="panel panel-default">
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
                                                                                            </div>
                                                                                    </div>-->
                            <!--</div>/category-products-->

                            <!--						<div class="brands_products">brands_products
                                                                                    <h2>Brands</h2>
                                                                                    <div class="brands-name">
                                                                                            <ul class="nav nav-pills nav-stacked">
                                                                                                    <li><a href="#"> <span class="pull-right">(50)</span>Acne</a></li>
                                                                                                    <li><a href="#"> <span class="pull-right">(56)</span>Grüne Erde</a></li>
                                                                                                    <li><a href="#"> <span class="pull-right">(27)</span>Albiro</a></li>
                                                                                                    <li><a href="#"> <span class="pull-right">(32)</span>Ronhill</a></li>
                                                                                                    <li><a href="#"> <span class="pull-right">(5)</span>Oddmolly</a></li>
                                                                                                    <li><a href="#"> <span class="pull-right">(9)</span>Boudestijn</a></li>
                                                                                                    <li><a href="#"> <span class="pull-right">(4)</span>Rösch creative culture</a></li>
                                                                                            </ul>
                                                                                    </div>
                                                                            </div>/brands_products-->

                            <!--						<div class="price-range">price-range
                                                                                    <h2>Price Range</h2>
                                                                                    <div class="well text-center">
                                                                                             <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="sl2" ><br />
                                                                                             <b class="pull-left">$ 0</b> <b class="pull-right">$ 600</b>
                                                                                    </div>
                                                                            </div>/price-range
                                                                            
                                                                            <div class="shipping text-center">shipping
                                                                                    <img src="images/home/shipping.jpg" alt="" />
                                                                            </div>/shipping-->

                        </div>
                    </div>

                    <div class="col-sm-9 padding-right">
                        <div class="features_items"><!--features_items-->
                            <h2 class="title text-center">Features Product</h2>
                            <c:forEach items="${listproductnew}" var="p">
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <a href="ProductDetails?productID=${p.product_id}"><img style="width: 268px;height: 249px" src="${p.thumbnail}" alt="" /></a>
                                                <h2><del>$${p.original_prices}</del></h2>
                                                <p>$${p.sale_prices}</p>
                                                <p>${p.name_product}</p>
                                                <a href="CartDetails?productID=${p.product_id}" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                            </div>
                                            <!--								<div class="product-overlay">
                                                                                                                                    <div class="overlay-content">
                                                                                                                                            <h2>${p.sale_prices}</h2>
                                                                                                                                            <p>$${p.brief_infor}</p>
                                                                                                                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                                    </div>
                                                                                                            </div>-->
                                        </div>
                                        <div class="choose">
                                            <ul class="nav nav-pills nav-justified">
                                                <li><a href=""><i class="fa fa-eye"></i>Feedback</a></li>
                                                <!--										<li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>-->
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>	
                        </div><!--features_items-->

                        <!--					<div class="category-tab">category-tab
                                                                        <div class="col-sm-12">
                                                                                <ul class="nav nav-tabs">
                                                                                        <li class="active"><a href="#tshirt" data-toggle="tab">T-Shirt</a></li>
                                                                                        <li><a href="#blazers" data-toggle="tab">Blazers</a></li>
                                                                                        <li><a href="#sunglass" data-toggle="tab">Sunglass</a></li>
                                                                                        <li><a href="#kids" data-toggle="tab">Kids</a></li>
                                                                                        <li><a href="#poloshirt" data-toggle="tab">Polo shirt</a></li>
                                                                                </ul>
                                                                        </div>
                                                                        <div class="tab-content">
                                                                                <div class="tab-pane fade active in" id="tshirt" >
                                                                                        <div class="col-sm-3">
                                                                                                <div class="product-image-wrapper">
                                                                                                        <div class="single-products">
                                                                                                                <div class="productinfo text-center">
                                                                                                                        <img src="images/home/gallery1.jpg" alt="" />
                                                                                                                        <h2>$56</h2>
                                                                                                                        <p>Easy Polo Black Edition</p>
                                                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                </div>
                                                                                                                
                                                                                                        </div>
                                                                                                </div>
                                                                                        </div>
                                                                                        <div class="col-sm-3">
                                                                                                <div class="product-image-wrapper">
                                                                                                        <div class="single-products">
                                                                                                                <div class="productinfo text-center">
                                                                                                                        <img src="images/home/gallery2.jpg" alt="" />
                                                                                                                        <h2>$56</h2>
                                                                                                                        <p>Easy Polo Black Edition</p>
                                                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                </div>
                                                                                                                
                                                                                                        </div>
                                                                                                </div>
                                                                                        </div>
                                                                                        <div class="col-sm-3">
                                                                                                <div class="product-image-wrapper">
                                                                                                        <div class="single-products">
                                                                                                                <div class="productinfo text-center">
                                                                                                                        <img src="images/home/gallery3.jpg" alt="" />
                                                                                                                        <h2>$56</h2>
                                                                                                                        <p>Easy Polo Black Edition</p>
                                                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                </div>
                                                                                                                
                                                                                                        </div>
                                                                                                </div>
                                                                                        </div>
                                                                                        <div class="col-sm-3">
                                                                                                <div class="product-image-wrapper">
                                                                                                        <div class="single-products">
                                                                                                                <div class="productinfo text-center">
                                                                                                                        <img src="images/home/gallery4.jpg" alt="" />
                                                                                                                        <h2>$56</h2>
                                                                                                                        <p>Easy Polo Black Edition</p>
                                                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                </div>
                                                                                                                
                                                                                                        </div>
                                                                                                </div>
                                                                                        </div>
                                                                                </div>
                                                                                
                                                                                <div class="tab-pane fade" id="blazers" >
                                                                                        <div class="col-sm-3">
                                                                                                <div class="product-image-wrapper">
                                                                                                        <div class="single-products">
                                                                                                                <div class="productinfo text-center">
                                                                                                                        <img src="images/home/gallery4.jpg" alt="" />
                                                                                                                        <h2>$56</h2>
                                                                                                                        <p>Easy Polo Black Edition</p>
                                                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                </div>
                                                                                                                
                                                                                                        </div>
                                                                                                </div>
                                                                                        </div>
                                                                                        <div class="col-sm-3">
                                                                                                <div class="product-image-wrapper">
                                                                                                        <div class="single-products">
                                                                                                                <div class="productinfo text-center">
                                                                                                                        <img src="images/home/gallery3.jpg" alt="" />
                                                                                                                        <h2>$56</h2>
                                                                                                                        <p>Easy Polo Black Edition</p>
                                                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                </div>
                                                                                                                
                                                                                                        </div>
                                                                                                </div>
                                                                                        </div>
                                                                                        <div class="col-sm-3">
                                                                                                <div class="product-image-wrapper">
                                                                                                        <div class="single-products">
                                                                                                                <div class="productinfo text-center">
                                                                                                                        <img src="images/home/gallery2.jpg" alt="" />
                                                                                                                        <h2>$56</h2>
                                                                                                                        <p>Easy Polo Black Edition</p>
                                                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                </div>
                                                                                                                
                                                                                                        </div>
                                                                                                </div>
                                                                                        </div>
                                                                                        <div class="col-sm-3">
                                                                                                <div class="product-image-wrapper">
                                                                                                        <div class="single-products">
                                                                                                                <div class="productinfo text-center">
                                                                                                                        <img src="images/home/gallery1.jpg" alt="" />
                                                                                                                        <h2>$56</h2>
                                                                                                                        <p>Easy Polo Black Edition</p>
                                                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                </div>
                                                                                                                
                                                                                                        </div>
                                                                                                </div>
                                                                                        </div>
                                                                                </div>
                                                                                
                                                                                <div class="tab-pane fade" id="sunglass" >
                                                                                        <div class="col-sm-3">
                                                                                                <div class="product-image-wrapper">
                                                                                                        <div class="single-products">
                                                                                                                <div class="productinfo text-center">
                                                                                                                        <img src="images/home/gallery3.jpg" alt="" />
                                                                                                                        <h2>$56</h2>
                                                                                                                        <p>Easy Polo Black Edition</p>
                                                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                </div>
                                                                                                                
                                                                                                        </div>
                                                                                                </div>
                                                                                        </div>
                                                                                        <div class="col-sm-3">
                                                                                                <div class="product-image-wrapper">
                                                                                                        <div class="single-products">
                                                                                                                <div class="productinfo text-center">
                                                                                                                        <img src="images/home/gallery4.jpg" alt="" />
                                                                                                                        <h2>$56</h2>
                                                                                                                        <p>Easy Polo Black Edition</p>
                                                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                </div>
                                                                                                                
                                                                                                        </div>
                                                                                                </div>
                                                                                        </div>
                                                                                        <div class="col-sm-3">
                                                                                                <div class="product-image-wrapper">
                                                                                                        <div class="single-products">
                                                                                                                <div class="productinfo text-center">
                                                                                                                        <img src="images/home/gallery1.jpg" alt="" />
                                                                                                                        <h2>$56</h2>
                                                                                                                        <p>Easy Polo Black Edition</p>
                                                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                </div>
                                                                                                                
                                                                                                        </div>
                                                                                                </div>
                                                                                        </div>
                                                                                        <div class="col-sm-3">
                                                                                                <div class="product-image-wrapper">
                                                                                                        <div class="single-products">
                                                                                                                <div class="productinfo text-center">
                                                                                                                        <img src="images/home/gallery2.jpg" alt="" />
                                                                                                                        <h2>$56</h2>
                                                                                                                        <p>Easy Polo Black Edition</p>
                                                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                </div>
                                                                                                                
                                                                                                        </div>
                                                                                                </div>
                                                                                        </div>
                                                                                </div>
                                                                                
                                                                                <div class="tab-pane fade" id="kids" >
                                                                                        <div class="col-sm-3">
                                                                                                <div class="product-image-wrapper">
                                                                                                        <div class="single-products">
                                                                                                                <div class="productinfo text-center">
                                                                                                                        <img src="images/home/gallery1.jpg" alt="" />
                                                                                                                        <h2>$56</h2>
                                                                                                                        <p>Easy Polo Black Edition</p>
                                                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                </div>
                                                                                                                
                                                                                                        </div>
                                                                                                </div>
                                                                                        </div>
                                                                                        <div class="col-sm-3">
                                                                                                <div class="product-image-wrapper">
                                                                                                        <div class="single-products">
                                                                                                                <div class="productinfo text-center">
                                                                                                                        <img src="images/home/gallery2.jpg" alt="" />
                                                                                                                        <h2>$56</h2>
                                                                                                                        <p>Easy Polo Black Edition</p>
                                                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                </div>
                                                                                                                
                                                                                                        </div>
                                                                                                </div>
                                                                                        </div>
                                                                                        <div class="col-sm-3">
                                                                                                <div class="product-image-wrapper">
                                                                                                        <div class="single-products">
                                                                                                                <div class="productinfo text-center">
                                                                                                                        <img src="images/home/gallery3.jpg" alt="" />
                                                                                                                        <h2>$56</h2>
                                                                                                                        <p>Easy Polo Black Edition</p>
                                                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                </div>
                                                                                                                
                                                                                                        </div>
                                                                                                </div>
                                                                                        </div>
                                                                                        <div class="col-sm-3">
                                                                                                <div class="product-image-wrapper">
                                                                                                        <div class="single-products">
                                                                                                                <div class="productinfo text-center">
                                                                                                                        <img src="images/home/gallery4.jpg" alt="" />
                                                                                                                        <h2>$56</h2>
                                                                                                                        <p>Easy Polo Black Edition</p>
                                                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                </div>
                                                                                                                
                                                                                                        </div>
                                                                                                </div>
                                                                                        </div>
                                                                                </div>
                                                                                
                                                                                <div class="tab-pane fade" id="poloshirt" >
                                                                                        <div class="col-sm-3">
                                                                                                <div class="product-image-wrapper">
                                                                                                        <div class="single-products">
                                                                                                                <div class="productinfo text-center">
                                                                                                                        <img src="images/home/gallery2.jpg" alt="" />
                                                                                                                        <h2>$56</h2>
                                                                                                                        <p>Easy Polo Black Edition</p>
                                                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                </div>
                                                                                                                
                                                                                                        </div>
                                                                                                </div>
                                                                                        </div>
                                                                                        <div class="col-sm-3">
                                                                                                <div class="product-image-wrapper">
                                                                                                        <div class="single-products">
                                                                                                                <div class="productinfo text-center">
                                                                                                                        <img src="images/home/gallery4.jpg" alt="" />
                                                                                                                        <h2>$56</h2>
                                                                                                                        <p>Easy Polo Black Edition</p>
                                                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                </div>
                                                                                                                
                                                                                                        </div>
                                                                                                </div>
                                                                                        </div>
                                                                                        <div class="col-sm-3">
                                                                                                <div class="product-image-wrapper">
                                                                                                        <div class="single-products">
                                                                                                                <div class="productinfo text-center">
                                                                                                                        <img src="images/home/gallery3.jpg" alt="" />
                                                                                                                        <h2>$56</h2>
                                                                                                                        <p>Easy Polo Black Edition</p>
                                                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                </div>
                                                                                                                
                                                                                                        </div>
                                                                                                </div>
                                                                                        </div>
                                                                                        <div class="col-sm-3">
                                                                                                <div class="product-image-wrapper">
                                                                                                        <div class="single-products">
                                                                                                                <div class="productinfo text-center">
                                                                                                                        <img src="images/home/gallery1.jpg" alt="" />
                                                                                                                        <h2>$56</h2>
                                                                                                                        <p>Easy Polo Black Edition</p>
                                                                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                </div>
                                                                                                                
                                                                                                        </div>
                                                                                                </div>
                                                                                        </div>
                                                                                </div>
                                                                        </div>
                                                                </div>/category-tab-->

                        <div class="recommended_items"><!--recommended_items-->
                            <h2 class="title text-center">HOT POST</h2>

                            <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <c:forEach items="${newtop31}" var="t">
                                            <div class="col-sm-4">
                                                <div class="product-image-wrapper">
                                                    <div class="single-products">
                                                        <div class="productinfo text-center">
                                                            <img src="${t.thumbnail}" style="width: 350px;height: 400px" alt="" />
                                                            <p>${t.tittle}</p>
                                                            <p>${t.brief_infor}</p>
                                                            <a href="BlogDetails?blogid=${t.blog_id}" class="btn btn-default add-to-cart">Read More</a>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>

                                        <!--									<div class="col-sm-4">
                                                                                                                        <div class="product-image-wrapper">
                                                                                                                                <div class="single-products">
                                                                                                                                        <div class="productinfo text-center">
                                                                                                                                                <img src="images/home/recommend2.jpg" alt="" />
                                                                                                                                                <h2>$56</h2>
                                                                                                                                                <p>Easy Polo Black Edition</p>
                                                                                                                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                                        </div>
                                                                                                                                        
                                                                                                                                </div>
                                                                                                                        </div>
                                                                                                                </div>-->
                                        <!--									<div class="col-sm-4">
                                                                                                                        <div class="product-image-wrapper">
                                                                                                                                <div class="single-products">
                                                                                                                                        <div class="productinfo text-center">
                                                                                                                                                <img src="images/home/recommend3.jpg" alt="" />
                                                                                                                                                <h2>$56</h2>
                                                                                                                                                <p>Easy Polo Black Edition</p>
                                                                                                                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                                        </div>
                                                                                                                                        
                                                                                                                                </div>
                                                                                                                        </div>
                                                                                                                </div>-->
                                    </div>
                                    <div class="item">
                                        <c:forEach items="${topnew32}" var="t">
                                            <div class="col-sm-4">
                                                <div class="product-image-wrapper">
                                                    <div class="single-products">
                                                        <div class="productinfo text-center">
                                                            <img src="${t.thumbnail}" style="width: 350px;height: 400px" alt="" />
                                                            <p>${t.tittle}</p>
                                                            <p>${t.brief_infor}</p>
                                                            <a href="BlogDetails?blogid=${t.blog_id}" class="btn btn-default add-to-cart">Read More</a>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        <!--									<div class="col-sm-4">
                                                                                                                        <div class="product-image-wrapper">
                                                                                                                                <div class="single-products">
                                                                                                                                        <div class="productinfo text-center">
                                                                                                                                                <img src="images/home/recommend1.jpg" alt="" />
                                                                                                                                                <h2>$56</h2>
                                                                                                                                                <p>Easy Polo Black Edition</p>
                                                                                                                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                                        </div>
                                                                                                                                        
                                                                                                                                </div>
                                                                                                                        </div>
                                                                                                                </div>
                                                                                                                <div class="col-sm-4">
                                                                                                                        <div class="product-image-wrapper">
                                                                                                                                <div class="single-products">
                                                                                                                                        <div class="productinfo text-center">
                                                                                                                                                <img src="images/home/recommend2.jpg" alt="" />
                                                                                                                                                <h2>$56</h2>
                                                                                                                                                <p>Easy Polo Black Edition</p>
                                                                                                                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                                        </div>
                                                                                                                                        
                                                                                                                                </div>
                                                                                                                        </div>
                                                                                                                </div>
                                                                                                                <div class="col-sm-4">
                                                                                                                        <div class="product-image-wrapper">
                                                                                                                                <div class="single-products">
                                                                                                                                        <div class="productinfo text-center">
                                                                                                                                                <img src="images/home/recommend3.jpg" alt="" />
                                                                                                                                                <h2>$56</h2>
                                                                                                                                                <p>Easy Polo Black Edition</p>
                                                                                                                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                                        </div>
                                                                                                                                        
                                                                                                                                </div>
                                                                                                                        </div>
                                                                                                                </div>-->
                                    </div>
                                </div>
                                <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
                                    <i class="fa fa-angle-left"></i>
                                </a>
                                <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
                                    <i class="fa fa-angle-right"></i>
                                </a>			
                            </div>
                        </div><!--/recommended_items-->

                    </div>
                </div>
            </div>
        </section>

        <footer id="footer"><!--Footer-->
            <div class="footer-top">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="companyinfo">
                                <h2><span>e</span>-BookShop</h2>
                                <p>Đại lý sách Đầu hàng Việt Nam</p>
                            </div>
                        </div>
                        <!--					<div class="col-sm-7">
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
                                                                        </div>-->
                    </div>
                    <div class="col-sm-3">
                        <div class="address">
                            <img src="images/home/map.png" alt="" />
                            <p>Việt Nam Vô Địch</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer-widget">
            <div class="container">
                <div class="row">
                    <!--					<div class="col-sm-2">
                                                                    <div class="single-widget">
                                                                            <h2>Service</h2>
                                                                            <ul class="nav nav-pills nav-stacked">
                                                                                    <li><a href="#">Online Help</a></li>
                                                                                    <li><a href="#">Contact Us</a></li>
                                                                                    <li><a href="#">Order Status</a></li>
                                                                                    <li><a href="#">Change Location</a></li>
                                                                                    <li><a href="#">FAQ’s</a></li>
                                                                            </ul>
                                                                    </div>
                                                            </div>
                                                            <div class="col-sm-2">
                                                                    <div class="single-widget">
                                                                            <h2>Quock Shop</h2>
                                                                            <ul class="nav nav-pills nav-stacked">
                                                                                    <li><a href="#">T-Shirt</a></li>
                                                                                    <li><a href="#">Mens</a></li>
                                                                                    <li><a href="#">Womens</a></li>
                                                                                    <li><a href="#">Gift Cards</a></li>
                                                                                    <li><a href="#">Shoes</a></li>
                                                                            </ul>
                                                                    </div>
                                                            </div>
                                                            <div class="col-sm-2">
                                                                    <div class="single-widget">
                                                                            <h2>Policies</h2>
                                                                            <ul class="nav nav-pills nav-stacked">
                                                                                    <li><a href="#">Terms of Use</a></li>
                                                                                    <li><a href="#">Privecy Policy</a></li>
                                                                                    <li><a href="#">Refund Policy</a></li>
                                                                                    <li><a href="#">Billing System</a></li>
                                                                                    <li><a href="#">Ticket System</a></li>
                                                                            </ul>
                                                                    </div>
                                                            </div>
                                                            <div class="col-sm-2">
                                                                    <div class="single-widget">
                                                                            <h2>About Shopper</h2>
                                                                            <ul class="nav nav-pills nav-stacked">
                                                                                    <li><a href="#">Company Information</a></li>
                                                                                    <li><a href="#">Careers</a></li>
                                                                                    <li><a href="#">Store Location</a></li>
                                                                                    <li><a href="#">Affillate Program</a></li>
                                                                                    <li><a href="#">Copyright</a></li>
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
                                                            </div>-->

                </div>
            </div>
        </div>

        <div class="footer-bottom">
            <div class="container">
                <div class="row">
                    <p class="pull-left">SWP391 - Team 2 - SE1705</p>
                    <p class="pull-right">Designed by <span><a target="_blank" href="https://www.facebook.com/sangmo2002">sang</a></span></p>
                </div>
            </div>
        </div>

    </footer><!--/Footer-->



    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
