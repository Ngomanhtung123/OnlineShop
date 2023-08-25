<%--             
    Document   : OrdersList
    Created on : May 27, 2023, 2:37:22 PM
    Author     : vieta
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "Model.User" %>
<%@page import = "Dao.OrderDao" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order List | E-shop</title>
    </head>
    <body>
        <h1>WELCOME CUSTOMERS</h1>
    </body>
</html>
<!DOCTYPE html>
<html>
    <head>
        <title>Order list</title>
        <link href="css/main.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <style>
            .container {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
            }

            h1 {
                text-align: center;
                margin-bottom: 30px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            tr:hover {
                background-color: #f5f5f5;
            }

            input[type=text], input[type=date], select {
                padding: 6px 10px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="container" style="background-color:  rgba(248, 161, 39, 0.693);">
                <h1>Order list</h1>
            </div>
            <form action="OrdersList">
                <label>Search by order id:</label>
                <input type="text" id="searchInput" onkeyup="search()" placeholder="Enter order id..." name="orderid" value="${id}"><br>
                <label>Search by customer name:</label>
                <input type="text" id="customerName" onkeyup="filter()" placeholder="Enter customer name..." name="customername" value="${customername}"><br>
                <button style="background-color: rgba(248, 161, 39, 0.693); width: 130px; height: 30px;" name="confirm" value="1"> Search </button>
            </form>
            <form action="OrdersList">
                <hr>
                <label>Filter by order date:</label>
                <input type="date" id="fromDate" oninput="filter()" name="startdate" value="${startdate}">
                <label>To</label>
                <input type="date" id="toDate" oninput="filter()" name="finishdate" value="${finishdate}"><br>
                <%User sessionstr = (User) session.getAttribute("u");
                                                            
                                    if(sessionstr.getRole_id()==5){%>
                <label>Filter by salename</label>
                <input type="text" name="salename" placeholder="Sale Name..." name="salename" value="${salename}"><br>
                <%}%>
                <label>Filter by status:</label>
                <select style="width: 100px" id="status" onchange="filter()" name="status" >
                    <option <c:if test="${status==null}"> selected </c:if> value="0">All</option>
                    <option <c:if test="${status==1}"> selected </c:if> value="1">Pending</option>
                    <option <c:if test="${status==2}"> selected </c:if> value="2">Shipping</option>
                    <option <c:if test="${status==3}"> selected </c:if> value="3">Recived</option>
                    <option <c:if test="${status==4}"> selected </c:if> value="4">Canceled</option>
                </select><br>
                <button style="background-color: rgba(248, 161, 39, 0.693); width: 130px; height: 30px;" name="confirm" value="2"> Filter </button>
            </form>
            <table id="dataTable">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Order date</th>
                        <th>Customer name</th>
                        <th>Product</th>
                        <th>Total cost</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%OrderDao od = new OrderDao();%>
                    <c:forEach items="${list}" var="o">
                        <tr>
                            <td><a href="OrderDetails?id=${o.order_id}">${o.order_id}</a></td>
                            <td>${o.order_date}</td>
                            <td>${o.fullname}</td>
                            <c:if test="${o.numberProduct-1<=0}">
                                <td>${o.getFirstProductName()}</td>
                            </c:if>
                            <c:if test="${o.numberProduct-1>0}">
                                <td>${o.getFirstProductName()} (x${o.numberProduct})</td>
                            </c:if>
                            <td>${o.totalCost}</td>
                            <td>${o.getStatusName()}</td>
                        </tr>
                    </c:forEach>
                    <!--Thêm các dòng dữ liệu còn lại tại đây-->
                </tbody>
            </table>
            <ul class="pagination">
                <c:forEach var="i" begin="1" end="${sotrang}">
                    <c:if test="${pageactive==null}">
                        <c:if test="${i==1}">
                            <li class="active"><a href="">${i}</a></li>
                            </c:if>
                            <c:if test="${i!=1}">
                            <li><a href="">${i}</a></li>
                            </c:if>
                        </c:if>
                        <c:if test="${pageactive!=null}">
                            <c:if test="${i==pageactive}">
                            <li class="active"><a href="">${i}</a></li>
                            </c:if>
                            <c:if test="${i!=pageactive}">
                            <li><a href="">${i}</a></li>
                            </c:if>
                        </c:if>
                    </c:forEach>
            </ul>
        </div>
    </body>
</html>