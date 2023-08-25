<%-- 
    Document   : PostsList
    Created on : May 27, 2023, 1:52:25 PM
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
                                    Post List 
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
                                                  method="get" action="PostsList">
                                                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#createPost">Add New Post</button>
                                                <div class="left-search"></div>
                                                <div class="right-search">
                                                    <select class="form-control" name="cateID" style="display: inline; width: 110px;">
                                                        <option value=""> All Category</option>
                                                        <c:forEach items="${requestScope.listCate}" var="i">
                                                            <option value="${i.category_id}" ${i.category_id == requestScope.cateID ? 'selected' : ''}>${i.category_name}</option>
                                                        </c:forEach>
                                                    </select>
                                                    <select class="form-control" name="authorID" style="display: inline; width: 110px;">
                                                        <option value="">All Author</option>
                                                        <c:forEach items="${requestScope.listUser}" var="i">
                                                            <option value="${i.user_id}" ${i.user_id == requestScope.authorID ? 'selected' : ''}>${i.fullname}</option>
                                                        </c:forEach>
                                                    </select>
                                                    <select class="form-control" name="status" style="display: inline; width: 110px;">
                                                        <option value="2" ${status == 2 ?'selected':''}>All Status</option>
                                                        <option value="1" ${status == 1 ?'selected':''}>Active</option>
                                                        <option value="0"${status == 0 ?'selected':''}>Inactive</option>
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
                                                    <th id="blogID" onclick="sort('id')">ID <i class="fa ${requestScope.sort == 'blog_id asc'?'fa-caret-down' : 'fa-caret-up'}" aria-hidden="true"></i></th>
                                                    <th>Image</th>
                                                    <th id="blogTitle" onclick="sort('title')">Title <i class="fa ${requestScope.sort == 'tittle asc'?'fa-caret-down' : 'fa-caret-up'}" aria-hidden="true"></i></th>
                                                    <th>Category</th>
                                                    <th>Author</th>
                                                    <th>Status</th>
                                                    <th colspan="3" style="text-align: center">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="s" items="${requestScope.list}">
                                                    <tr>
                                                        <td>${s.blog_id}</td>
                                                        <td><img width="100px" src="${pageContext.request.contextPath}/${s.thumbnail}" alt="alt"/></td>
                                                        <td>${s.tittle}</td>
                                                        <td>${s.category_name}</td>
                                                        <td>${s.nameAuthor}</td>
                                                        <c:if test="${s.status eq true}">
                                                            <td><span class="label label-success" style="font-size: 15px">Active</span></td>
                                                        </c:if>
                                                        <c:if test="${s.status eq false}">
                                                            <td><span class="label label-danger" style="font-size: 15px">Inactive</span></td>
                                                        </c:if>
                                                        <td>
                                                            <a class="btn btn-primary"  data-toggle="modal" data-target="#ViewModalUP${s.blog_id}">
                                                                <i class="fa fa-eye" aria-hidden="true"></i>
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-primary"  data-toggle="modal" data-target="#EditModalUP${s.blog_id}">
                                                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-primary" href="ChangeStatusPost?id=${s.blog_id}">
                                                                Change Status
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <!-- Show detail modal -->

                                                <div class="modal fade" id="EditModalUP${s.blog_id}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                                                     data-keyboard="false">
                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-body">
                                                                <form action="PostsList" method="post">
                                                                    <input type="hidden" readonly="" name="action" value="edit">
                                                                    <div class="row">
                                                                        <div class="form-group  col-md-12">
                                                                            <span class="thong-tin-thanh-toan">
                                                                                <h5>Edit Post</h5>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="form-group col-md-6">
                                                                            <label class="control-label">Title</label>
                                                                            <input class="form-control" type="text" name="title" value="${s.tittle}">
                                                                            <input class="form-control" type="hidden" name="id" readonly="" value="${s.blog_id}">
                                                                        </div>
                                                                        <div class="form-group col-md-6">
                                                                            <label class="control-label">Category</label>
                                                                            <select class="form-control" name="cateID">
                                                                                <c:forEach items="${requestScope.listCate}" var="i">
                                                                                    <option value="${i.category_id}" ${i.category_id == requestScope.cateID ? 'selected' : ''}>${i.category_name}</option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </div>
                                                                        <div class="form-group col-md-6" style="
                                                                             text-align: center;
                                                                             ">
                                                                            <label class="control-label">Image</label>
                                                                            <br>
                                                                            <img id="image_${s.blog_id}" src="${s.thumbnail}" alt="" width="150" >
                                                                            <input name="img" value="${s.thumbnail}" type='file' id="imgInp" onchange="preview(event,${s.blog_id})"/>
                                                                        </div>

                                                                        <div class="form-group col-md-6" style="
                                                                             text-align: center;
                                                                             ">
                                                                            <label class="control-label">Status</label><br>
                                                                            <input  type="radio" name="status" required="" value="1" ${s.status eq true?"checked":""}>Active
                                                                            <input  type="radio" name="status" required="" value="0" ${s.status eq false?"checked":""}> Inactive
                                                                        </div>
                                                                        <div class="form-group col-md-12">
                                                                            <label class="control-label">Content</label>
                                                                            <textarea class="form-control" name="content">${s.content}</textarea>
                                                                        </div>

                                                                    </div>
                                                                    <br>
                                                                    <input class="btn btn-primary" style="margin-left: 42%" type="submit" value="Save">
                                                                    <a class="btn btn-danger" data-dismiss="modal" href="#">Cancel</a>
                                                                    <br>
                                                                </form>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="modal fade" id="ViewModalUP${s.blog_id}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                                                     data-keyboard="false">
                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content">
                                                            <form >
                                                                <div class="modal-body">
                                                                    <input type="hidden" readonly="" name="action" value="edit">
                                                                    <div class="row">
                                                                        <div class="form-group  col-md-12">
                                                                            <span class="thong-tin-thanh-toan">
                                                                                <h5>View Post</h5>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="form-group col-md-6">
                                                                            <label class="control-label">Title</label>
                                                                            <input disabled="" class="form-control" type="text" name="title" value="${s.tittle}">
                                                                        </div>
                                                                        <div class="form-group col-md-6">
                                                                            <label class="control-label">Category</label>
                                                                            <select class="form-control" name="cateID" disabled="">
                                                                                <c:forEach items="${requestScope.listCate}" var="i">
                                                                                    <option value="${i.category_id}" ${i.category_name == s.category_name ? 'selected' : ''}>${i.category_name}</option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </div>
                                                                        <div class="form-group col-md-6" style="
                                                                             text-align: center;
                                                                             ">
                                                                            <label class="control-label">Image</label>
                                                                            <br>
                                                                            <img src="${s.thumbnail}" alt="" width="150">
                                                                        </div>

                                                                        <div class="form-group col-md-6" style="
                                                                             text-align: center;
                                                                             ">
                                                                            <label class="control-label">Status</label><br>
                                                                            <input  type="radio" disabled="" name="status" value="1" ${s.status eq true?"checked":""}>Active
                                                                            <input  type="radio" disabled="" name="status" value="0" ${s.status eq false?"checked":""}> Inactive
                                                                        </div>
                                                                        <div class="form-group col-md-6">
                                                                            <label class="control-label">Author</label>
                                                                            <input class="form-control" disabled="" type="text" name="Author" value="${s.nameAuthor}">
                                                                        </div>
                                                                        <div class="form-group col-md-12">
                                                                            <label class="control-label">Content</label>
                                                                            <textarea class="form-control" disabled="">${s.content}</textarea>
                                                                        </div>
                                                                    </div>
                                                                    <br>
                                                                    <a class="btn btn-danger" style="margin-left: 42%" data-dismiss="modal" href="#">Cancel</a>
                                                                    <br>

                                                                </div>   
                                                            </form>

                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="modal fade" id="createPost" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                                                     data-keyboard="false">
                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-body">
                                                                <form action="PostDetails" method="post">
                                                                    <div class="row">
                                                                        <div class="form-group  col-md-12">
                                                                            <span class="thong-tin-thanh-toan">
                                                                                <h5>Create Post</h5>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="form-group col-md-6">
                                                                            <label class="control-label">Title</label>
                                                                            <input class="form-control" type="text" name="title">
                                                                        </div>
                                                                        <div class="form-group col-md-6">
                                                                            <label class="control-label">Brief Info</label>
                                                                            <input class="form-control" type="text" name="brief">
                                                                        </div>
                                                                        <div class="form-group col-md-6">
                                                                            <label class="control-label">Category</label>
                                                                            <select class="form-control" name="cateID">
                                                                                <c:forEach items="${requestScope.listCate}" var="i">
                                                                                    <option value="${i.category_id}" ${i.category_id == requestScope.cateID ? 'selected' : ''}>${i.category_name}</option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </div>
                                                                        <div class="form-group col-md-6" style="
                                                                             text-align: center;
                                                                             ">
                                                                            <label class="control-label">Image</label>
                                                                            <br>
                                                                            <input type='file' id="imgInp" name="img"/>
                                                                        </div>

                                                                        <div class="form-group col-md-6" style="
                                                                             text-align: center;
                                                                             ">
                                                                            <label class="control-label">Status</label><br>
                                                                            <input  type="radio" name="status" required="" value="1" >Active
                                                                            <input  type="radio" name="status" required="" value="0" > Inactive
                                                                        </div>
                                                                        <div class="form-group col-md-6">
                                                                            <label class="control-label">Content</label>
                                                                            <textarea class="form-control" name="content"></textarea>
                                                                        </div>

                                                                    </div>
                                                                    <br>
                                                                    <input class="btn btn-primary" style="margin-left: 42%" type="submit" value="Save">
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
                                            <c:forEach begin="1" end="${requestScope.totalPage}" var="i">
                                                <a style="${requestScope.pageNum == i ? 'color:red' : ''}" href="PostsList?cateID=${requestScope.cateID}&authorID=${requestScope.authorID}&status=${requestScope.status}&search=${requestScope.search}&pageNum=${i}">${i}</a>
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
        <script type="text/javascript">
                                                                                function sort(i) {
                                                                                    var item;
                                                                                    var sort = '';
                                                                                    if (i === 'id') {
                                                                                        item = $('#blogID i');
                                                                                        sort += 'blog_id';
                                                                                    } else {
                                                                                        item = $('#blogTitle i');
                                                                                        sort += 'tittle';
                                                                                    }
                                                                                    if (item.hasClass("fa-caret-down")) {
                                                                                        sort += ' desc';
                                                                                    } else {
                                                                                        sort += ' asc';
                                                                                    }
                                                                                    window.location.href = 'PostsList?cateID=${requestScope.cateID}&authorID=${requestScope.authorID}&status=${requestScope.status}&search=${requestScope.search}&sort=' + sort;
                                                                                }

                                                                                function preview(e, i) {
                                                                                    const file = e.target.files[0]
                                                                                    if (file) {
                                                                                        var blah = document.getElementById('image_' + i);
                                                                                        blah.src = URL.createObjectURL(file);
                                                                                    }
                                                                                }
                                                                                ;
        </script>

    </body>
</html>
