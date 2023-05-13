<%-- 
    Document   : moreinformation
    Created on : May 13, 2023, 10:09:44 AM
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
            </ul>
            <c:if test="${status != null}">
                <h5>Xin chào ${sessionScope.Customer}</h5>
            </c:if>
        </nav>
            <main>
                <h3>Thông tin cá nhân</h3>
                <c:set var="account" value="${requestScope.account}"/>
                <c:if test="${account != null}">
                    <div class="form">
                    <form action="MainController" method="POST">
                        <p>Email : &emsp;&emsp;&emsp;&emsp; <input type="text" value="${account.email}" readonly=""></p>
                        <p>Tài khoản : &emsp;&emsp;&emsp; <input type="text" name="txtaccount" value="${account.account}"></p>
                        <p>Mật khẩu : &emsp;&emsp;&emsp; <input type="password" name="txtpassword" value="${account.password}"></p>
                        <p>Tên : &emsp;&emsp;&emsp;&emsp; <input type="text" name="txtname" value="${account.name}"></p>
                        <p>Số điện thoại : <input type="tel" name="txtphone" value="${account.phone}"></p>
                        <p>Địa chỉ : &emsp;&emsp;&emsp;<input type="text" name="txtaddress" value="${account.address}"></p>
                        <p><input name="option" value="2" hidden=""></p>
                        <p><input name="idacc" value="${account.id}" hidden=""></p>
                        <p><input type="submit" name="action" value="Thay đổi" class="btn"></p>
                    </form>
                </div>
                </c:if>
            </main>
        <div class="space"></div>
    </body>
    <footer>
        <h3>Welcome me website</h3>
        <p>&copy; Copyright 2023 Nguyên</p>
    </footer>
    <style>
        form p input{
            width: 500px;
            border-radius: 10px;
        }
        form{
            margin: 10px;
            border: 2px solid black;
            border-radius: 10px;
            padding: 20px;
            width: fit-content;
        }
        .btn{
            width: 100px;
            text-align: center;
            margin-left: 40%;
        }
        main{
            margin-top: 50px;
            margin-left: 20%;
            
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

        }
        html{
            overflow-x: hidden;
            width: 100%;
            height: max-content;
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
