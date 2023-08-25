<%-- 
    Document   : OrderDetails
    Created on : May 27, 2023, 2:37:55 PM
    Author     : vieta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Order Details | E-shop</title>
        <meta charset="UTF-8">
        <style>
            body {
                background-color: #f2f2f2;
                font-family: Arial, sans-serif;
                color: #333;
            }

            .container {
                max-width: 960px;
                margin: 0 auto;
                padding: 50px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            }

            h1 {
                font-size: 36px;
                margin-bottom: 20px;
                color: #428bca;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th {
                text-align: left;
                padding: 8px;
                background-color: #ffffff;
                color: black;
            }

            td {
                padding: 8px;
                border-bottom: 1px solid #ddd;
            }

            .product-name {
                font-weight: bold;
            }

            .thumbnail {
                width: 80px;
                height: 80px;
                object-fit: cover;
                object-position: center;
                border-radius: 4px;
                box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
            }

            form {
                margin-top: 20px;
                display: flex;
                flex-direction: column;
                align-items: flex-start;
            }

            label {
                font-weight: bold;
                margin-bottom: 8px;
            }

            select {
                padding: 8px;
                border-radius: 4px;
                border: 1px solid #ccc;
                margin-bottom: 16px;
                background-color: orange;
            }

            input[type="submit"] {
                background-color: #428bca;
                color: #fff;
                padding: 8px 16px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
            }

            .sale-notes {
                margin-top: 20px;
            }

            .sale-notes h2 {
                margin-bottom: 16px;
                font-size: 24px;
                color: #428bca;
            }

            .sale-notes p {
                font-size: 16px;
                line-height: 1.5;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h3>Welcome to</h3>
            
            <div class="container" style="background-color:  rgba(248, 161, 39, 0.693);">
                <a href="OrdersList">Back to list</a>
            </div>
            <h1 style="color: orange;">Order Details</h1>
            <form action="OrderDetails">
            <table>
                <tr>
                    <th>Basic Information:</th>
                </tr>
                <tr>
                    <th>Order ID:</th>
                    <td><input name="id" value="${order.order_id}" readonly></td>
                </tr>
                <tr>
                    <th>Customer Name:</th>
                    <td>${user.fullname}</td>
                </tr>
                <tr>
                    <th>Email:</th>
                    <td>${user.email_address}</td>
                </tr>
                <tr>
                    <th>Mobile:</th>
                    <td>${user.phone_number}</td>
                </tr>
                <tr>
                    <th>Order Date:</th>
                    <td>${order.order_date}</td>
                </tr>
                <tr>
                    <th>Total Cost:</th>
                    <td>$${order.totalCost}</td>
                </tr>
                <tr>
                    <th>Sale Name:</th>
                    <td>${order.getSale_Name()}</td>
                </tr>
                <tr>
                    
                    <th>Status:</th>
                    <td>
                        <select name="orderstatus">
                            <c:if test="${order.status_order==1}">
                                <c:forEach begin="1" end="2" var="status">
                                    <option  <c:if test="${order.status_order==status}">
                                            selected
                                        </c:if> 
                                        value="${status}">
                                        <c:if test="${status==1}">
                                            Pending
                                        </c:if>   
                                        <c:if test="${status==2}">
                                            Shipping
                                        </c:if>
                                    </option>
                                </c:forEach>
                            </c:if>
                            <c:if test="${order.status_order==2}">
                                <c:forEach begin="2" end="3" var="status">
                                    <option  <c:if test="${order.status_order==status}">
                                            selected
                                        </c:if> 
                                        value="${status}">
                                        <c:if test="${status==2}">
                                            Shipping
                                        </c:if>   
                                        <c:if test="${status==3}">
                                            Recived
                                        </c:if>
                                    </option>
                                </c:forEach>
                            </c:if>
                            <c:if test="${order.status_order==3}">
                                    <option
                                            selected
                                        value="3">
                                            Recived
                                    </option>
                            </c:if>
                            <c:if test="${order.status_order==4}">
                                    <option
                                            selected
                                        value="4">
                                            Canceled
                                    </option>
                            </c:if>
                        </select>
                    </td> 
                </tr>
                <tr>
                    <th></th>
                    <td><button>Save</button></td>
                </tr>
            </table>
            </form>
            <hr>
            <form action="OrderDetails">
            <table>
                <tr>
                    <th>Recive Information:</th>
                </tr>
                <tr>
                    <th>Full Name:</th>
                    <td>${order.fullname}</td>
                </tr>
                <tr>
                    <th>Gender:</th>
                    <td>${order.gender}</td>
                </tr>
                <tr>
                    <th>Email:</th>
                    <td>${order.email}</td>
                </tr>
                <tr>
                    <th>Mobile:</th>
                    <td>${order.mobile}</td>
                </tr>
                <tr>
                    <th>Address:</th>
                    <td>${order.address}</td>
                </tr>
            </table>
            <hr>
            <h3>List Product Orders</h3>
            <table>
                <tr>
                    <th>thumbnail</th>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Unit Price</th>
                    <th>Quantity</th>
                    <th>Total cost</th>
                </tr>
                <c:forEach items="${listorderdetail}" var="od">
                    <tr>
                        <td><img style="width: 70px; height: 60px" src="${od.product.thumbnail}"></td>
                        <td>${od.product.name_product} </td>
                        <td>${od.product.category_name}</td>
                        <td>${od.product.sale_prices}</td>
                        <td>${od.quantity}</td>
                        <td>${od.quantity*od.product.sale_prices}</td>
                    </tr>
                </c:forEach>
            </table>
            <c:if test="${role==5&&order.getStatus_order()!=4}">
                <label>Assign to : </label> <select name="saler">
                    <c:if test="${SalerID==0}">
                        <option selected value="${0}">Not Assign</option>
                    </c:if>
                    <c:forEach items="${lu}" var="u">
                        <c:if test="${SalerID==u.user_id}">
                            <option selected  value="${u.user_id}">${u.user_id} - ${u.fullname}</option>
                        </c:if>
                        <c:if test="${SalerID!=u.user_id}">
                            <option  value="${u.user_id}" >${u.user_id} - ${u.fullname}</option>
                        </c:if>   
                    </c:forEach>
                </select> 
                <button style="margin-top: 30px" name="id" value="${order.order_id}">Save</button>
            </c:if>
                </form>
        </body>
</html>
