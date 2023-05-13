<%-- 
    Document   : viewhistory
    Created on : May 13, 2023, 1:30:37 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="icon" type="image/x-icon" href="img/pet_shop.png">
        <title>Pet Shop</title>
    </head>
    <header>
        <img src="img/pet_shop.png" alt="logo" height="75px" width="75px" class="logo">
        <h3 class="title">Chào mừng bạn đến website mua bán thú cưng</h3>
    </header>
    <body>
        <nav>
            <c:set var="status" value="${sessionScope.Customer}"/>
            <c:set var="listcate" value="${requestScope.listcate}"/>
            <ul class="horizontal-menu">
                <li><a href="MainServlet">Trang chủ</a></li>
                <li class="dropdown">
                    <a href="">Các dòng Pet</a>
                    <c:if test="${listcate != null && listcate.size() > 0}">
                        <ul class="dropdown-menu">
                            <c:forEach var="cate" items="${listcate}">
                                <li><a href="MainController?action=Type&id=${cate.idCate}">${cate.catename}</a></li>
                                </c:forEach>
                        </ul>
                    </c:if>
                </li>
                <li><a href="MainController?action=ViewCart">Giỏ hàng</a></li>
                    <c:if test="${status != null}">
                    <li class="dropdown">
                        <a href="">Lịch sử</a>
                        <ul class="dropdown-menu">
                            <li><a href="MainController?action=ViewHistory&option=2">Lịch sử đã mua</a></li>
                            <li><a href="MainController?action=ViewHistory&option=1">Lịch sử đang giao</a></li>
                            <li><a href="MainController?action=ViewHistory&option=0">Lịch sử đã huỷ</a></li>
                        </ul>
                    </li>
                </c:if>
                <li><a href="MainController?action=Contact">Liên hệ</a></li>
                    <c:if test="${status == null}">
                    <li><a href="Login.jsp">Đăng nhập</a></li>
                    <li><a href="Register.jsp">Đăng kí</a></li>
                    </c:if>
                    <c:if test="${status != null}">
                    <li><a href="MainController?action=Personal">Thông tin cá nhân</a></li>
                    <li><a href="LogoutServlet">Đăng xuất</a></li>
                    </c:if> 
            </ul>
            <c:if test="${status != null}">
                <h5>Xin chào ${sessionScope.Customer}</h5>
            </c:if>
        </nav>
        <main>
            <c:set var="list" value="${requestScope.list}"/>
            <c:set var="newlist2" value="${requestScope.newlist2}"/>
            <c:set var="newlist" value="${requestScope.newlist}"/>
            <c:set var="total" value="${0}"/>
            <c:if test="${list != null && list.size() > 0}">
                <c:forEach var="order" items="${list}">
                    <details>
                        <summary class="tag">
                            <p>Mã đơn hàng : ${order.id}</p>
                            <p>Ngày đặt : ${order.datebook}</p>
                            <p>Ngày giao : ${order.dateship}</p>
                            <c:if test="${order.status == 1}">
                                <p>Đang giao hàng</p>
                            </c:if>
                            <c:if test="${order.status == 0}">
                                <p>Đã huỷ đơn hàng</p>
                            </c:if>
                            <c:if test="${order.status == 2}">
                                <p>Đơn hàng đã giao thành công</p>
                            </c:if>
                        </summary>
                        <c:if test="${newlist != null && newlist.size() > 0}">
                            <c:if test="${newlist2 != null && newlist2.size() > 0}">
                                <c:forEach var="neworder" items="${newlist}">
                                    <c:if test="${order.id == neworder.id}">
                                        <c:forEach var="neworder2" items="${newlist2}">
                                            <c:if test="${neworder2.idPet == neworder.idPet}">
                                                <div class="tag-mini">
                                                    <p><img src="img/${neworder2.img}" height="100px" width="100px"></p>
                                                    <div class="detail">
                                                        <p>Tên: ${neworder2.name}</p>
                                                        <p>Giá: ${neworder2.price} đồng</p>
                                                        <p>Số lượng: ${neworder.quantity}</p>
                                                        <p>Thành tiền: ${neworder.quantity * neworder2.price} đồng</p>
                                                        <c:set var="total" value="${total + neworder.quantity * neworder2.price}"/>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                </c:forEach>
                                <p class="link">Tổng tiền : <c:out value="${total}"/> đồng</p> 
                            </c:if>
                        </c:if>
                    </details>
                </c:forEach>
            </c:if>
        </main>
        <c:if test="${list == null}">
            <p class="empty"><c:out value="${requestScope.notice}"/></p>
        </c:if>
        <style>
            .detail p{
                float: left;
                margin-left: 200px;
            }
            .tag-mini{
                padding: 5px;
                height: 120px;
                margin-left: 20px;
                margin-right: 20px;
                border: 1px solid black;
                border-radius: 10px;
            }
            .tag-mini img{
                float: left;
                margin-right: 30px;
            }
            .tag-mini .detail{
                float: left;
            }
            .tag{
                height: 150px;
                padding: 10px;
                margin: 20px;
                margin-bottom: 0px;
                border: 1px solid black;
                border-radius: 10px;
                background-color: aquamarine;
            }
            .tag p:nth-child(2){
                float: left;
                margin-right: 400px;
            }
            .tag p:nth-child(3){
                float: left;
                margin-right: 400px;
            }
            .tag p:nth-child(4){
                color: green;
                font-size: 25px;
            }
            .link{
                text-align: center;
            }
            .empty{
                text-align: center;
                color: red;
            }
            html{
                overflow-x: hidden;
                width: 100%;
                height: 100%;
                position: relative;
            }
            header{
                height: 100px;
                width: 100%;
                background-color: antiquewhite;
                box-shadow: 5px 5px gray;
                margin-bottom: 10px;
            }
            .logo{
                float: left;
            }
            .title{
                float: left;
                font-family: 'Courier New', Courier, monospace;
                margin-top: 20px;
                margin-left: 20%;
            }
            nav{
                height: 45px;
                background-color: black;
                justify-content: space-between;
                display: flex;
            }
            h5{
                color: red;
                padding: 10px;
            }
            .horizontal-menu {
                list-style-type: none;
                margin: 0;
                padding: 0;
            }

            .horizontal-menu li {
                display: block;
                float: left;
                position: relative;
                background-color: black;
            }

            .horizontal-menu li:hover{
                background-color: gray;
            }
            .horizontal-menu li a {
                display: block;
                padding: 10px 15px;
                text-decoration: none;
                color: white;
            }

            .horizontal-menu .dropdown:hover .dropdown-menu {
                display: block;
            }

            .dropdown-menu {
                display: none;
                background-color: black;
            }

            .dropdown-menu li {
                display: block;
                width: 100%;
            }

            .dropdown-menu li a {
                padding: 10px 15px;
            }

            .dropdown-menu li a:hover {
                background-color:gray;
            }
        </style>
</html>
