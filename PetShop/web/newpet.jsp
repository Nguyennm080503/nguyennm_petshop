<%-- 
    Document   : newpet
    Created on : May 10, 2023, 10:03:44 AM
    Author     : ADMIN
--%>

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
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <title>Quản lí PET</title>
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
                <li><a href="MainController?action=Product" class="active">Quản lí Pet</a></li>
                <li><a href="MainController?action=Order">Quản lí đơn hàng</a></li>
            </ul>
            <a href="MainController?action=Logout" class="logout">Đăng xuất</a>
        </aside>
        <main class="col-sm-9">
            <div style="padding: 20px; background-color: wheat; margin-top: 100px; color: brown; border-radius: 10px">
                <h3 style="text-align: center">Thêm mới một Pet</h3>
                <form action="MainController" method="POST">
                    <p>Tên: <input type="text" name="name" value="${param.name}" required="" style="width: 200px; border-radius: 10px"></p>
                    <p>Hình: <input type="file" name="img" required=""></p>
                    <p>Thông tin chi tiết: <textarea name="description" required="" style="width: 500px; border-radius: 10px"></textarea></p>
                    <p>Giá: <input type="text" name="price" value="${param.price}" required="" style="width: 75px; border-radius: 10px"> đồng</p>
                    <c:set var="list" value="${requestScope.list}"/>
                    <c:if test="${list != null && list.size() > 0}">
                    <p>Loại: <select name="type">
                            <option value="0"></option>
                            <c:forEach var="cate" items="${list}">
                                <option value="${cate.idCate}">${cate.catename}</option>
                            </c:forEach>
                        </select></p>
                    </c:if>
                        <input name="status" value="0" hidden="">
                        <input type="submit" name="action" value="Thêm" style="width: 100px; border-radius: 10px; margin-left: 40%; cursor: pointer">
                </form>
            </div>
                    <c:set var="msg" value="${requestScope.emptytype}"/>
                    <c:set var="msg2" value="${requestScope.success}"/>
                    <c:set var="msg3" value="${requestScope.same}"/>
                    <c:if test="${msg != null}">
                        <script>
                            alert("Vui lòng chọn dòng Pet!")
                        </script>
                    </c:if>
                        <c:if test="${msg2 != null}">
                        <script>
                            alert("Thêm Pet mới thành công.")
                        </script>
                    </c:if>
                        <c:if test="${msg3 != null}">
                        <script>
                            alert("Đã tồn tên loại Pet này. Vui lòng thêm tên Pet mới.")
                        </script>
                    </c:if>
        </main>
    </body>
</html>
