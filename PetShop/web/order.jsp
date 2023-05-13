<%-- 
    Document   : order
    Created on : May 10, 2023, 4:12:45 PM
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
            <c:set var="listaccount" value="${requestScope.listAccount}"/>
            <c:set var="msg" value="${requestScope.emptylist}"/>
            <c:if test="${list != null && list.size() > 0}">
                <c:if test="${listaccount != null && listaccount.size() > 0}">
                    <table border="1">
                        <thead>
                            <tr>
                                <th>STT</th>
                                <th style="width: 50px">Mã đơn hàng</th>
                                <th>Tên người đặt</th>
                                <th>SĐT</th>
                                <th>Địa chỉ</th>
                                <th style="width: 100px">Thời gian đặt</th>
                                <th style="width: 100px">Thời gian ship</th>
                                <th>Tình trạng</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="order" items="${list}" varStatus="loop">
                                <tr>
                                    <td>${loop.count}</td>
                                    <td>${order.id}</td>
                                    <c:forEach var="account" items="${listaccount}">
                                        <c:if test="${account.id == order.idAcc}">
                                            <td>${account.name}</td>
                                            <td>${account.phone}</td>
                                            <td>${account.address}</td>
                                        </c:if>
                                    </c:forEach>
                                    <td>${order.datebook}</td>
                                    <td>${order.dateship}</td>
                                    <td style="padding: 10px">
                                        <form action="MainController" method="POST">
                                            <c:if test="${order.status == 0}">
                                                <p>Huỷ <input type="radio" name="status" checked="" value="0">&emsp; Đang giao <input type="radio" disabled="">&emsp; Hoàn thành <input type="radio" disabled=""></p>
                                                </c:if>
                                                <c:if test="${order.status == 1}">
                                                <p>Huỷ <input type="radio" name="status" value="0">&emsp; Đang giao <input type="radio" name="status" value="1" checked="">&emsp; Hoàn thành <input type="radio" name="status" value="2"></p>
                                                </c:if>
                                                <c:if test="${order.status == 2}">
                                                <p>Huỷ <input type="radio" name="status" value="0" disabled="">&emsp; Đang giao <input type="radio" name="status" value="1" disabled="">&emsp; Hoàn thành <input type="radio" name="status" value="2" checked=""></p>
                                                </c:if>
                                                    <input name="id" value="${order.id}" hidden="">
                                                    <input type="submit" name="action" value="Comfirm" style="cursor: pointer; margin-top: 5px">
                                        </form>
                                    </td>
                                    <td><a href="MainController?action=Detail&id=${order.id}">Thông tin chi tiết</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </c:if>
            <c:if test="${list == null}">
                <p style="text-align: center; margin-top: 100px"><c:out value="${msg}"/></p>
            </c:if>

        </main>
    </body>
</html>
