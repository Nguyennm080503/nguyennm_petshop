<%-- 
    Document   : viewcart
    Created on : May 12, 2023, 8:46:11 PM
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
                        <a href="#">Lịch sử</a>
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
            <c:set var="cart" value="${sessionScope.cart}"/>
            <c:set var="total" value="${0}"/>
            <c:if test="${cart != null}">
                <h2 class="ttsection">Danh sách giỏ hàng</h2>
                <table border="1">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Tên</th>
                            <th>Hình</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Thành tiền</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="pet" items="${list}" varStatus="loop">
                        <form action="MainController" method="POST">
                            <tr>
                                <td>${loop.count}</td>
                                <td>${pet.name}</td>
                                <td><img src="img/${pet.img}" width="100px" height="100px"></td>
                                <td>${pet.price}</td>
                                <td><p><input type="number" value="${cart.get(pet.idPet)}" name="quantity" style="text-align: center"></p></td>
                                <td>${cart.get(pet.idPet) * pet.price}</td>
                                <td>
                                    <input name="id" value="${pet.idPet}" hidden="">
                                    <input type="submit" name="action" value="Xác nhận" class="btn">
                                    <input type="submit" name="action" value="Xoá" class="btn" onclick="javascript:return confirm('Bạn có muốn xoá ra khỏi giỏ hàng ?')">
                                </td>
                            </tr>
                        </form>
                        <c:set var="total" value="${total + cart.get(pet.idPet) * pet.price}"/>
                    </c:forEach>        
                    </tbody>
                </table>
                <div class="payment">
                    <h3>Tổng tiền thanh toán: <c:out value="${total}"/> đồng</h4>
                        <h5>Phương thước thanh toán:  Tiền mặt <input type="radio" checked=""> &emsp; Khác <input type="radio" disabled=""></h5>
                </div>
                <form action="MainController" method="POST" class="btn2">
                    <input type="submit" name="action" value="Mua" class="btn">
                </form>
            </c:if>
        </main>
        <c:if test="${cart == null}">
            <div class="msg">
                <p>Không có sản phẩm thêm vào giỏ hàng. Quay lại trang chủ để mua Pet</p>
            </div>
        </c:if>
        <div class="space"></div>
    </body>
    <footer>
        <h3>Welcome me website</h3>
        <p>&copy; Copyright 2023 Nguyên</p>
    </footer>
    <style>
        .btn2{
            text-align: right;
            margin-right: 40%;
        }
        .ttsection{
            color: aqua;
            font-family: monospace;
        }
        .payment{
            text-align: left;
        }
        table{
            text-align: center;
        }
        main{
            margin-top: 50px;
            margin-left: 20%;
        }
        .btn{
            width: 100px;
            height: 30px;
            border-radius: 10px;
            cursor: pointer;
        }
        .msg{
            text-align: center;
        }
        .space{
            margin-top: 200px;
        }
        footer{
            background-color: black;
            width: 100%;
            height: 150px;
            color: white;
            text-align: center;
            padding-top: 10px;
            position: absolute;
            bottom: 0;
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

