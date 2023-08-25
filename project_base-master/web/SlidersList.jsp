<%-- 
    Document   : SlidersList
    Created on : May 27, 2023, 1:54:00 PM
    Author     : vieta
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Marketing | E-Shopper</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <meta name="description" content="Developed By M Abdur Rokib Promy">
        <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
        <!-- bootstrap 3.0.2 -->
        <link href="./marketing/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="./marketing/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="./marketing/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Morris chart -->
        <link href="./marketing/css/morris/morris.css" rel="stylesheet" type="text/css" />
        <link href="./marketing/css/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
        <link href="./marketing/css/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
        <link href="./marketing/css/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
        <link href="./marketing/css/iCheck/all.css" rel="stylesheet" type="text/css" />
        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <!-- Theme style -->
        <link href="./marketing/css/style.css" rel="stylesheet" type="text/css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.0/css/jquery.dataTables.css">
        <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.0/css/jquery.dataTables_themeroller.css">
        <script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.0/jquery.dataTables.min.js"></script>
        <style type="text/css">
            td{
                padding: 5px;
            }
            th{
                padding: 5px;
            }
        </style>
    </head>
    <body class="skin-black">
        <!-- header logo: style can be found in header.less -->
        <div class="left-side sidebar-offcanvas"  style="height: 1200px;position: fixed; width: 220px; background-color: #39435c;left: 0; top:0;">
        </div>
        <header class="header">
            <a href="" class="logo">
                Marketing
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="navbar-right">
                    <a href="logout" class="btn btn-outline-primary" style="text-decoration: none;  font-weight: 100;" >
                        <i class="fa fa-sign-out" style="font-size: 35px;" aria-hidden="true"></i>
                    </a>
                </div>
            </nav>
        </header>

        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas" id="left-aside" style="height: 100%;">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <c:if test="${sessionScope.u.getAvartar()==null}">
                                <img src="https://dvdn247.net/wp-content/uploads/2020/07/avatar-mac-dinh-1.png" class="img-circle" alt="User Image" />
                            </c:if>
                            <c:if test="${sessionScope.u.getAvartar()!=null}">
                                <img src="${sessionScope.u.getAvartar()}" class="img-circle" alt="User Image" />
                            </c:if>
                        </div>
                        <div class="pull-left info">
                            <p>Hello, ${sessionScope.u.getFullname()}</p>

                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li class="">
                            <a href="PostsList">
                                <i class="fa fa-circle"></i> <span>Posts List</span>
                            </a>
                        </li>
                        <li class="">
                            <a href="FeedbacksList">
                                <i class="fa fa-circle"></i> <span>Feedback List</span>
                            </a>
                        </li>
                        <li class="">
                            <a href="SlidersList">
                                <i class="fa fa-circle"></i> <span>Sliders List</span>
                            </a>
                        </li>
                        <li class="">
                            <a href="HomePage">
                                <i class="fa fa-circle"></i> <span>Go Home</span>
                            </a>
                        </li>
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="panel">
                                <header class="panel-heading">
                                    Slider List 
                                </header>
                                <!-- <div class="box-header"> -->
                                <!-- <h3 class="box-title">Responsive Hover Table</h3> -->

                                <!-- </div> -->
                                <div class="panel-body table-responsive">
                                    <div class="sliderList">
                                        <!-- /.box-body -->
                                        <div class="input-group" style="margin-bottom: 10px;width: 100%; ">
                                            <form class="search-slider"
                                                  style="width: 100%; display: flex; justify-content: space-between; position: relative;"
                                                  method="get" action="SlidersList">
                                                <div class="left-search"></div>
                                                <div class="right-search">
                                                    <select class="form-control" name="status" style="display: inline; width: 110px;">
                                                        <option value="">All Status</option>
                                                        <option value="1" ${status==1?'selected':''}>Active</option>
                                                        <option value="0"${status==0?'selected':''}>Inactive</option>
                                                    </select>
                                                    <input type="text" name="search"  class="form-control"
                                                           style="width: 250px;" placeholder="Search" value="${search}"/>
                                                    <button class="btn btn-default">Search</button>
                                                </div>
                                            </form>
                                        </div>
                                        <table class="panel-body table-responsive" id="sliderTable" cellspacing="0" style="width: 100%;">
                                            <thead>
                                                <tr style="cursor: pointer; font-size: 15px; border-bottom: 1px solid #ccc; text-align: center;">
                                                    <th>ID  <i class="fa fa-caret-down" aria-hidden="true"></i></th>
                                                    <th>Title <i class="fa fa-caret-down" aria-hidden="true"></i></th>
                                                    <th>Image</th>
                                                    <th>BackLink <i class="fa fa-caret-down" aria-hidden="true"></i></th>
                                                    <th>Status<i class="fa fa-caret-down" aria-hidden="true"></i></th>
                                                    <th>View<i class="fa fa-caret-down" aria-hidden="true"></i></th>
                                                    <th colspan="2" style="text-align: center">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="s" items="${requestScope.list}">
                                                    <tr>
                                                        <td>${s.slider_id}</td>
                                                        <td>${s.slider_title}</td>
                                                        <td><img width="100px" src="${pageContext.request.contextPath}/${s.slider_img}" alt="alt"/></td>
                                                        <td>${s.backlink}</td>
                                                        <c:if test="${s.status == 1}">
                                                            <td><span class="label label-success" style="font-size: 15px">Acive</span></td>
                                                        </c:if>
                                                        <c:if test="${s.status == 0}">
                                                            <td><span class="label label-danger" style="font-size: 15px">Inacive</span></td>
                                                        </c:if>
                                                        <td>
                                                            <a class="btn btn-primary"  data-toggle="modal" data-target="#EditModalUP${s.slider_id}">
                                                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-primary" href="changeStatusSliderList?id=${s.slider_id}">
                                                                Change Status
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <!-- Show detail modal -->

                                                <div class="modal fade" id="EditModalUP${s.slider_id}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                                                     data-keyboard="false">
                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-body">
                                                                <form action="SliderDetails" method="post">
                                                                    <input type="hidden" readonly="" name="action" value="edit">
                                                                    <div class="row">
                                                                        <div class="form-group  col-md-12">
                                                                            <span class="thong-tin-thanh-toan">
                                                                                <h5>Edit Slider</h5>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="form-group col-md-6">
                                                                            <label class="control-label">Title</label>
                                                                            <input class="form-control" type="text" name="title" value="${s.slider_title}">
                                                                            <input class="form-control" type="hidden" name="sid" readonly="" value="${s.slider_id}">
                                                                        </div>
                                                                        <div class="form-group col-md-6">
                                                                            <label class="control-label">BackLink</label>
                                                                            <input class="form-control" type="text" name="backlink" value="${s.backlink}">
                                                                        </div>
                                                                        <div class="form-group col-md-12" style="
                                                                             text-align: center;
                                                                             ">
                                                                            <label class="control-label">Image</label>
                                                                            <img src="${pageContext.request.contextPath}/${s.slider_img}" alt="" width="150">
                                                                            <span id="invalid3" style="color: red;"> </span>
                                                                        </div>

                                                                        <div class="form-group col-md-12" style="
                                                                             text-align: center;
                                                                             ">
                                                                            <label class="control-label">Status</label><br>
                                                                            <input  type="radio" name="status" required="" value="1" ${s.status == 1?"checked":""}>Active
                                                                            <input  type="radio" name="status" required="" value="0" ${s.status == 0?"checked":""}> Inactive
                                                                        </div>

                                                                    </div>
                                                                    <br>
                                                                    <input class="btn btn-primary" type="submit" value="Save">
                                                                    <a class="btn btn-danger" data-dismiss="modal" href="#">Cancel</a>
                                                                    <br>
                                                                </form>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </c:forEach>
                                            </tbody>
                                        </table>
                                        <div style="text-align: center">
                                            <c:forEach begin="1" end="${total}" var="i">
                                                <a style="${requestScope.pageNum == i ? 'color:red' : ''}" href="SlidersList?status=${requestScope.status}&search=${requestScope.search}&pageNum=${requestScope.pageNum}">${i}</a>
                                            </c:forEach>
                                        </div>
                                    </div>

                                </div><!-- /.box -->
                            </div>
                        </div>

                </section><!-- /.content -->
                <div class="footer-main">
                    Copyright &copy Director, 2014
                </div>
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
        <!-- Bootstrap -->
        <script src="./marketing/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Director App -->
        <script src="./marketing/js/Director/app.js" type="text/javascript"></script>
        <script>

        </script>

    </body>
</html>
