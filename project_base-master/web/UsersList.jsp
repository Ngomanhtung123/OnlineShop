<%-- 
    Document   : UsersList
    Created on : May 27, 2023, 2:39:25 PM
    Author     : vieta
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Users List | Admin</title>
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
                Admin
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
                            <a href="UsersList">
                                <i class="fa fa-user"></i> <span>Users List</span>
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
                                    User List 
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
                                                  method="get" action="UsersList">
                                                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#createPost">Add New User</button>
                                                <div class="left-search"></div>
                                                <div class="right-search">
                                                    <select class="form-control" name="role" style="display: inline; width: 110px;">
                                                        <option value="0"> All Role</option>
                                                        <c:forEach items="${requestScope.listRole}" var="i">
                                                            <option value="${i.role_id}" ${i.role_id == requestScope.role ? 'selected' : ''}>${i.role_name}</option>
                                                        </c:forEach>
                                                    </select>
                                                    <select class="form-control" name="gender" style="display: inline; width: 110px;">
                                                        <option value="2" ${gender == ' ' ?'selected':''}>All Gender</option>
                                                        <option value="1" ${gender == 1 ?'selected':''}>Male</option>
                                                        <option value="0"${gender == 0 ?'selected':''}>Female</option>
                                                    </select>
                                                    <select class="form-control" name="status" style="display: inline; width: 110px;">
                                                        <option value="2" ${status == ' ' ?'selected':''}>All Status</option>
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
                                                    <th id="user_id" onclick="sort('user_id')">ID <i class="fa ${requestScope.sort == 'user_id asc'?'fa-caret-down' : 'fa-caret-up'}" aria-hidden="true"></i></th>
                                                    <th id="fullname" onclick="sort('fullname')">Full Name <i class="fa ${requestScope.sort == 'fullname asc'?'fa-caret-down' : 'fa-caret-up'}" aria-hidden="true"></i></th>
                                                    <th id="email_address" onclick="sort('email_address')">Email <i class="fa ${requestScope.sort == 'email_address asc'?'fa-caret-down' : 'fa-caret-up'}" aria-hidden="true"></i></th>
                                                    <th>Gender</th>
                                                    <th id="phone_number" onclick="sort('phone_number')">Phone <i class="fa ${requestScope.sort == 'phone_number asc'?'fa-caret-down' : 'fa-caret-up'}" aria-hidden="true"></i></th>
                                                    <th>Role</th>
                                                    <th>Status</th>
                                                    <th colspan="3" style="text-align: center">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="s" items="${requestScope.list}">
                                                    <tr>
                                                        <td>${s.user_id}</td>
                                                        <td>${s.fullname}</td>
                                                        <td>${s.email_address}</td>
                                                        <td>${s.gender == 1 ? 'Male' : 'Female'}</td>
                                                        <td>${s.phone_number}</td>  
                                                        <td>${s.getRoleName()}</td>
                                                        <td><span class="label ${s.status == 1 ? 'label-primary' : 'label-danger'}" style="font-size: 15px">${s.status == 1 ? 'Active' : 'Inactive'}</span></td>
                                                        <td>
                                                            <a class="btn btn-primary"  data-toggle="modal" data-target="#ViewModalUP${s.user_id}">
                                                                <i class="fa fa-eye" aria-hidden="true"></i>
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-primary"  data-toggle="modal" data-target="#EditModalUP${s.user_id}">
                                                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-primary" href="ChangeStatusUser?id=${s.user_id}">
                                                                Change Status
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <!-- Show detail modal -->

                                                <div class="modal fade" id="EditModalUP${s.user_id}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                                                     data-keyboard="false">
                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-body">
                                                                <form action="UserDetails" >
                                                                    <input type="hidden" readonly="" name="action" value="edit">
                                                                    <div class="row">
                                                                        <div class="form-group  col-md-12">
                                                                            <span class="thong-tin-thanh-toan">
                                                                                <h5>Edit User</h5>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="form-group col-md-6">
                                                                            <label class="control-label">Full Name</label>
                                                                            <input class="form-control" type="text" name="name" disabled="" value="${s.fullname}">
                                                                            <input class="form-control" type="hidden" name="id" readonly="" value="${s.user_id}">
                                                                        </div>
                                                                        <div class="form-group col-md-6">
                                                                            <label class="control-label">Role</label>
                                                                            <select class="form-control" name="role">
                                                                                <c:forEach items="${requestScope.listRole}" var="i">
                                                                                    <option value="${i.role_id}" ${i.role_id == s.role_id ? 'selected' : ''}>${i.role_name}</option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </div>
                                                                        <div class="form-group col-md-6" style="
                                                                             text-align: center;
                                                                             ">
                                                                            <label class="control-label">Email</label>
                                                                            <br>
                                                                            <input class="form-control" type="email" disabled="" name="email" value="${s.email_address}">
                                                                        </div>
                                                                        <div class="form-group col-md-6" style="
                                                                             text-align: center;
                                                                             ">
                                                                            <label class="control-label">Mobile</label>
                                                                            <br>
                                                                            <input class="form-control" type="text" disabled="" name="phone" value="${s.phone_number}">
                                                                        </div>
                                                                        <div class="form-group col-md-6" style="
                                                                             text-align: center;
                                                                             ">
                                                                            <label class="control-label">Address</label>
                                                                            <br>
                                                                            <input class="form-control" type="text" disabled="" name="address" value="${s.address}">
                                                                        </div>

                                                                        <div class="form-group col-md-6" style="
                                                                             text-align: center;
                                                                             ">
                                                                            <label class="control-label">Status</label><br>
                                                                            <input  type="radio" name="status" required="" value="1" ${s.status == 1?"checked":""}>Active
                                                                            <input  type="radio" name="status" required="" value="0" ${s.status == 0?"checked":""}> Inactive
                                                                        </div>
                                                                        <div class="form-group col-md-6" style="
                                                                             text-align: center;
                                                                             ">
                                                                            <label class="control-label">Gender</label><br>
                                                                            <input  type="radio" name="gender" disabled="" required="" value="1" ${s.gender == 1?"checked":""}>Male
                                                                            <input  type="radio" name="gender" disabled="" required="" value="0" ${s.gender == 0?"checked":""}> Female
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

                                                <div class="modal fade" id="ViewModalUP${s.user_id}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                                                     data-keyboard="false">
                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content">
                                                            <form >
                                                                <input type="hidden" readonly="" name="action" value="edit">
                                                                <div class="row">
                                                                    <div class="form-group  col-md-12">
                                                                        <span class="thong-tin-thanh-toan">
                                                                            <h5>View User</h5>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="form-group col-md-6">
                                                                        <label class="control-label">Full Name</label>
                                                                        <input class="form-control" type="text" name="name" disabled="" value="${s.fullname}">
                                                                        <input class="form-control" type="hidden" name="id" readonly="" value="${s.user_id}">
                                                                    </div>
                                                                    <div class="form-group col-md-6">
                                                                        <label class="control-label">Role</label>
                                                                        <select class="form-control" name="role" disabled="">
                                                                            <c:forEach items="${requestScope.listRole}" var="i">
                                                                                <option value="${i.role_id}" ${i.role_id == s.role_id ? 'selected' : ''}>${i.role_name}</option>
                                                                            </c:forEach>
                                                                        </select>
                                                                    </div>
                                                                    <div class="form-group col-md-6" style="
                                                                         text-align: center;
                                                                         ">
                                                                        <label class="control-label">Email</label>
                                                                        <br>
                                                                        <input class="form-control" type="email" name="email" disabled="" value="${s.email_address}">
                                                                    </div>
                                                                    <div class="form-group col-md-6" style="
                                                                         text-align: center;
                                                                         ">
                                                                        <label class="control-label">Mobile</label>
                                                                        <br>
                                                                        <input class="form-control" type="text" name="phone" disabled="" value="${s.phone_number}">
                                                                    </div>
                                                                    <div class="form-group col-md-6" style="
                                                                         text-align: center;
                                                                         ">
                                                                        <label class="control-label">Address</label>
                                                                        <br>
                                                                        <input class="form-control" type="text" name="address" disabled="" value="${s.address}">
                                                                    </div>

                                                                    <div class="form-group col-md-6" style="
                                                                         text-align: center;
                                                                         ">
                                                                        <label class="control-label">Status</label><br>
                                                                        <input  type="radio" disabled="" name="status" required="" value="1" ${s.status == 1?"checked":""}>Active
                                                                        <input  type="radio" disabled="" name="status" required="" value="0" ${s.status == 0?"checked":""}> Inactive
                                                                    </div>
                                                                    <div class="form-group col-md-6" style="
                                                                         text-align: center;
                                                                         ">
                                                                        <label class="control-label">Gender</label><br>
                                                                        <input  type="radio" disabled="" name="gender" required="" value="1" ${s.gender == 1?"checked":""}>Male
                                                                        <input  type="radio" disabled="" name="gender" required="" value="0" ${s.gender == 0?"checked":""}> Female
                                                                    </div>

                                                                </div>
                                                                <br>
                                                                <a class="btn btn-danger" data-dismiss="modal" href="#">Cancel</a>
                                                                <br>
                                                            </form>

                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                        <div style="text-align: center">
                                            <c:forEach begin="1" end="${requestScope.totalPage}" var="i">
                                                <a style="${requestScope.pageNum == i ? 'color:red' : ''}" href="UsersList?search=${requestScope.search}&gender=${requestScope.gender}&status=${requestScope.status}&role=${requestScope.role}&search=${requestScope.search}&pageNum=${i}">${i}</a>
                                            </c:forEach>
                                        </div>
                                        <div class="modal fade" id="createPost" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                                             data-keyboard="false">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-body">
                                                        <form action="UserDetails" method="post">
                                                            <div class="row">
                                                                <div class="form-group  col-md-12">
                                                                    <span class="thong-tin-thanh-toan">
                                                                        <h5>Create UserList</h5>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group col-md-6">
                                                                    <label class="control-label">UserName</label>
                                                                    <input class="form-control" type="text" name="username" required="">
                                                                </div>
                                                                <div class="form-group col-md-6">
                                                                    <label class="control-label">Email</label>
                                                                    <input class="form-control" type="email" name="email" required="">
                                                                </div>
                                                                <div class="form-group col-md-6">
                                                                    <label class="control-label">Full Name</label>
                                                                    <input class="form-control" type="text" name="name" required="">
                                                                </div>
                                                                <div class="form-group col-md-6">
                                                                    <label class="control-label">Address</label>
                                                                    <input class="form-control" type="text" name="address" required="">
                                                                </div>
                                                                <div class="form-group col-md-6">
                                                                    <label class="control-label">Phone Number</label>
                                                                    <input class="form-control" type="tel" name="phone" required="" maxlength="10" minlength="10">
                                                                </div>
                                                                <div class="form-group col-md-6">
                                                                    <label class="control-label">Role</label>
                                                                    <select class="form-control" name="roleID">
                                                                        <c:forEach items="${requestScope.listRole}" var="i">
                                                                            <option value="${i.role_id}">${i.role_name}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                                <div class="form-group col-md-6" style="
                                                                     text-align: center;
                                                                     ">
                                                                    <label class="control-label">Gender</label><br>
                                                                    <input  type="radio" name="gender" required="" value="1" >Male
                                                                    <input  type="radio" name="gender" required="" value="0" > Female
                                                                </div>
                                                                <div class="form-group col-md-6" style="
                                                                     text-align: center;
                                                                     ">
                                                                    <span><b>User Image:  </b></span>
                                                                    <input type="file" id="fbimg" name="fbimg" onchange="changeFbimg()" accept=".jpg, .jpeg, .png"><br>

                                                                    <span  id="invalid1" style="color: red;" > </span><br>
                                                                    <input name="img" id="sendimg" type="hidden" >
                                                                    <img id="curAvt" style="width: 100%;"  src="">
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
                                                                        function changeFbimg() {
                                                                            var file = document.getElementById("fbimg").files[0];
                                                                            if (file.name.match(/.+\.(jpg|png|jpeg)/i)) {
                                                                                if (file.size / (1024 * 1024) < 5) {
                                                                                    var fileReader = new FileReader();
                                                                                    fileReader.readAsDataURL(file);
                                                                                    fileReader.onload = function () {
                                                                                        document.getElementById("sendimg").value = (fileReader.result);
                                                                                        document.getElementById("curAvt").src = (fileReader.result);
                                                                                    }
                                                                                } else {
                                                                                    uploadError();
                                                                                }
                                                                            } else {
                                                                                uploadError();
                                                                            }
                                                                        }
        </script>

    </body>
</html>
