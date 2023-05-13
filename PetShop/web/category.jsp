<%-- 
    Document   : category
    Created on : May 10, 2023, 12:14:44 PM
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
        <main class="col-sm-10">
            <div class="row">
                <div class="col-sm-6" style="background-color: gray; box-shadow: 0px 0px gray">
                    <c:set var="list" value="${requestScope.list}"/>
                    <c:if test="${list != null && list.size() > 0}">
                        <table border="1">
                            <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Dòng Pet</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="cate" items="${list}" varStatus="loop">
                                    <tr>
                                        <td>${loop.count}</td>
                                        <td>${cate.catename}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                    </c:if>
                    <c:if test="${list == null}">
                        <c:set var="msg" value="${requestScope.emptycate}"/>
                        <c:if test="${msg != null}">
                            <p><c:out value="${msg}"/></p>
                        </c:if>
                    </c:if>
                </div>
                <div class="col-sm-4" style="background-color: gray; box-shadow: 0px 0px gray">
                    <c:set var="msg1" value="${requestScope.notice}"/>
                    <c:set var="msg2" value="${requestScope.success}"/>
                    <div style="border-radius: 10; border: 2px solid black;background-color: wheat; padding: 10px">
                        <h3 style="text-align: center">Thêm các dòng Pet mới</h3>
                        <form action="MainController" method="POST">
                            <p>Dòng Pet : <input type="text" name="cate" required=""></p>
                            <p><input type="submit" name="action" value="Tạo" style="border-radius: 10px; width: 75px; cursor: pointer"></p>
                        </form>
                    </div>
                </div>
            </div>
        </main>
                    <c:if test="${msg1 != null}">
                        <script>
                            alert("Đã có dòng Pet này!")
                        </script>
                    </c:if>
                        <c:if test="${msg2 != null}">
                        <script>
                            alert("Đã thêm dòng Pet mới thành công.")
                        </script>
                    </c:if>
    </body>
</html>
