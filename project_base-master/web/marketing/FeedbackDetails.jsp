<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>FeedBack details | E-Shopper</title>
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
        <c:if test="${param['index']==null }">   
            <c:set var = "index" scope = "page" value = "1"/>
        </c:if>
        <c:if test="${param['index']!=null}">
            <c:set var = "index" scope = "page" value = "${param['index']}"/>
        </c:if>
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

                    </ul>
                </section>
            </aside>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="panel">
                                <header class="panel-heading">
                                    Feedback Details 
                                </header>
                              
                                <div class="panel-body table-responsive">
                                    <div class="sliderList">

                                        <div >
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-body">
                                                        <form action="ChangeFeedbackStatus">
                                                            <input type="hidden" readonly="" name="action" value="edit">
                                                            <div class="row">
                                                                <div class="form-group  col-md-12">
                                                                    <span class="thong-tin-thanh-toan">
                                                                        <h5>Edit Feedback Information</h5>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group col-md-6">
                                                                    <label class="control-label">Fullname</label>
                                                                    <input class="form-control" type="text" readonly="" value="${f.user.fullname}">
                                                                    <input class="form-control" type="hidden" name="fid" readonly="" value="${f.feedback_id}">
                                                                </div>
                                                                <div class="form-group col-md-6">
                                                                    <label for="exampleSelect1" class="control-label">Email</label>
                                                                    <input class="form-control" type="text" id="stitle" value="${f.user.email_address}" readonly="">
                                                                    <span id="invalid1" style="color: red;"> </span>

                                                                </div>
                                                                <div class="form-group col-md-6">
                                                                    <label class="control-label">Phone</label>
                                                                    <input class="form-control" type="text" readonly="" value="${f.user.phone_number}">
                                                                </div>
                                                                <div class="form-group col-md-6">
                                                                    <label for="exampleSelect1" class="control-label">Rate Star</label>
                                                                    <input class="form-control" type="text" value="${f.rate_star}" readonly="">
                                                                    <span id="invalid1" style="color: red;"> </span>

                                                                </div>
                                                                <div class="form-group col-md-12">
                                                                    <label class="control-label">Feedback</label>
                                                                    <textarea readonly="" class="form-control" >${f.feedback}</textarea>
                                                                    <span id="invalid3" style="color: red;"> </span>
                                                                </div><div class="form-group col-md-12" style="
                                                                           text-align: center;
                                                                           ">
                                                                    <label class="control-label">Image</label>
                                                                    <img src="${f.product.img_product}" alt="" width="150">
                                                                    <span id="invalid3" style="color: red;"> </span>
                                                                </div>

                                                                <div class="form-group col-md-12" style="
                                                                     text-align: center;
                                                                     ">
                                                                    <label class="control-label">Status</label><br>
                                                                    <input  type="radio" name="status" required="" value="1" ${f.feedback_status?"checked":""}>Active
                                                                    <input  type="radio" name="status" required="" value="0" ${f.feedback_status==false?"checked":""}> Inactive
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

                                    </div><!-- /.box-body -->
                                </div><!-- /.box -->
                            </div>
                        </div>          
                    </div>


                </section><!-- /.content -->
                <div class="footer-main">
                    Copyright &copy Director, 2014
                </div>
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->

        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#slidetable").DataTable();
            });
        </script>
        <script>

        </script>
        <!-- Bootstrap -->
        <script src="./marketing/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Director App -->
        <script src="./marketing/js/Director/app.js" type="text/javascript"></script>
    </body>
</html>


