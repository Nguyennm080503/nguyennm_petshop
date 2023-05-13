<%-- 
    Document   : type.jsp
    Created on : May 12, 2023, 6:58:10 PM
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
            <c:set var="listcate" value="${requestScope.listcate}"/>
            <c:set var="status" value="${sessionScope.Customer}"/>
            <ul class="horizontal-menu">
                <li><a href="MainServlet">Trang chủ</a></li>
                <li class="dropdown">
                    <a href="">Các dòng Pet</a>
                    <ul class="dropdown-menu">
                        <c:if test="${listcate != null && listcate.size() > 0}">
                            <c:forEach var="cate" items="${listcate}">
                                <li><a href="MainController?action=Type&id=${cate.idCate}">${cate.catename}</a></li>
                                </c:forEach>
                            </c:if>
                            <c:if test="${listcate == null}">
                            <li><a href="">Các dòng Pet</a></li>
                            </c:if>
                    </ul>
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
        <form method="POST" action="MainController" class="search">
            <input type="text" name="txtsearch" value="${param.txtsearch}">
            <input value="txtpet" name="option" hidden="">
            <input type="submit" value="Tìm" name="action">
        </form>
        <main class="contain">
            <div class="row">
                <c:set var="listpet" value="${requestScope.listpet}"/>
                <c:set var="msg" value="${requestScope.emptypet}"/>
                <c:if test="${listpet != null && listpet.size() > 0}">
                    <c:forEach var="pet" items="${listpet}">
                        <div class="col-xl-2 card">
                            <img src="img/${pet.img}" alt="" height="150px" width="150px">
                            <p>Name: ${pet.name}</p>
                            <p>Giá : ${pet.price} đồng</p>
                            <c:if test="${pet.status == 0}">
                                <form action="MainController" method="POST" class="add">
                                    <input name="id" value="${pet.idPet}" hidden="">
                                    <input name="idcate" value="${pet.idCate}" hidden="">
                                    <input name="option" value="type" hidden="">
                                    <input type="submit" name="action" value="Thêm vào giỏ hàng">
                                </form>
                            </c:if>
                            <div class="link"><a href="MainController?action=DetailPet&id=${pet.idPet}">Thông tin sản phẩm chi tiết</a></div>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${list == null}">
                    <p class="empty"><c:out value="${msg}"/></p>
                </c:if>
            </div>
        </main>
        <div class="space"></div>
    </body>
    <c:set var="msg2" value="${requestScope.add}"/>
    <c:if test="${msg2 != null}">
        <script>
            alert("Thêm vào giỏ hành thành công");
        </script>
    </c:if>
    <footer>
        <h3>Welcome me website</h3>
        <p>&copy; Copyright 2023 Nguyên</p>
    </footer>
    <style>
        .space{
            margin-top: 300px;
        }
        .search{
            margin-top: 10px;
            margin-left: 40%;
        }
        .search input:first-child{
            width: 300px;
            border-radius: 5px;
            margin-right: 10px;
        }
        .search input:last-child{
            border-radius: 10px;
            width: 75px;
            border: 1px solid silver;
            cursor: pointer;
        }
        .add input:last-child{
            width: 150px;
            padding: 5px;
            background-color: red;
            color: white;
            border-radius: 10px;
            margin-left: 20%;
            cursor: pointer;
        }
        .add input:last-child:hover{
            background: pink;
        }
        .link{
            text-align: center;
        }
        .empty{
            text-align: center;
            color: red;
        }
        footer{
            background-color: black;
            width: 100%;
            height: 150px;
            color: white;
            text-align: center;
            padding-top: 10px;
        }
        .card{
            border: 5px solid black;
            padding: 10px;
            border-radius: 10px;
            margin-left: 45px;
            margin-top: 20px;
            margin-bottom: 50px;
        }
        .card img{
            margin-left: 20%;
            border-radius: 10px;
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