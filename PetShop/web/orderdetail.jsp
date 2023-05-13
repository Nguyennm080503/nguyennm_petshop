<%-- 
    Document   : orderdetail
    Created on : May 10, 2023, 6:29:47 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/f0721daea2.js" crossorigin="anonymous"></script>
        <link rel="icon" type="image/x-icon" href="img/pet_shop.png">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/admin.css" rel="stylesheet">
        <link href="css/mana2.css" rel="stylesheet">
        <title>Admin</title>
    </head>

    <body class="row">
        <aside class="col-sm-2" id="content">
            <div class="logo">
                <img src="img/pet_shop.png" width="75px" height="75px">
                <h4>PET SHOP</h4>
            </div><br>
            <img src="img/avatar.png" alt="avatar"><br>
            <h5 style="color: #ffffff">${sessionScope.Admin}</h5>
            <ul class="col-sm-12">
                <li><a href="Admin.jsp">Trang chủ</a></li>
                <li><a href="MainController?action=Account">Quản lí tài khoản</a></li>
                <li><a href="MainController?action=Product">Quản lí Pet</a></li>
                <li><a href="MainController?action=Order" class="active">Quản lí đơn hàng</a></li>
            </ul>
            <a href="MainController?action=Logout" class="logout">Đăng xuất</a>
        </aside>
            <main class="col-sm-9">
                <c:set var="list" value="${requestScope.list}"/>
                <c:set var="listPet" value="${requestScope.listPet}"/>
                <c:if test="${list != null && list.size() > 0}">
                <c:if test="${listPet != null && listPet.size() > 0}">
                    <c:set var="total" value="${0}"/>
                    <table border="1">
                        <thead>
                            <tr>
                                <th style="padding: 10px">STT</th>
                                <th style="padding: 10px">Tên pet</th>
                                <th style="padding: 10px">Giá</th>
                                <th style="padding: 10px">Số lượng</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="detail" items="${list}" varStatus="loop">
                                <tr>
                                <td>${loop.count}</td>
                                <c:forEach var="pet" items="${listPet}">
                                    <c:if test="${pet.idPet == detail.idPet}">
                                        <td>${pet.name}</td>
                                        <td>${pet.price}</td>
                                        <td>${detail.quantity}</td>
                                        <c:set var="total" value="${total + pet.price * detail.quantity}"/>
                                    </c:if>
                                </c:forEach>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <h5 style="margin-left: 60%; margin-top: 50px">Tổng số tiền thanh toán : <c:out value="${total}"/> đồng</h5>
                </c:if>
                </c:if>
            </main>
    </body>
</html>
