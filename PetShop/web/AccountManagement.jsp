<%-- 
    Document   : AccountManagement
    Created on : Apr 17, 2023, 4:47:25 PM
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
        <link href="css/mag.css" rel="stylesheet">
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <title>Quản lí tài khoản</title>
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
                <li><a href="MainController?action=Account" class="active">Quản lí tài khoản</a></li>
                <li><a href="MainController?action=Product">Quản lí Pet</a></li>
                <li><a href="MainController?action=Order">Quản lí đơn hàng</a></li>
            </ul>
            <a href="MainController?action=Logout" class="logout">Đăng xuất</a>
        </aside>
        <main class="col-sm-10">
            <div class="search">
                <form action="MainController" method="POST">
                    <input type="search" name="txt" placeholder="Tìm kiếm bằng tên....." value="${param.txt}">
                    <input type="submit" value="Tìm kiếm" name="action">
                </form>
                <c:set var="msg" value="${requestScope.message}"/>
                <c:if test="${list == null}">
                    <c:out value="${msg}"/>
                </c:if>
            </div>
            <c:set var="users" value="${requestScope.list}"/>
            <c:if test="${users != null && users.size() > 0 }">
                <div class="col-sm-12 col-xs-12 table">
                    <table border="3" class="tbl">
                        <thead>
                            <tr>
                                <th>STT</th>
                                <th>Email</th>
                                <th>Tài khoản</th>
                                <th>Mật khẩu</th>
                                <th>Tên</th>
                                <th>Điện thoại</th>
                                <th>Địa chỉ</th>
                                <th>Vai trò</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${users}" varStatus="loop">
                                <tr>
                                    <td>${loop.count}</td>
                                    <td>${user.email}</td>
                                    <td>${user.account}</td>
                                    <td>${user.password}</td>
                                    <td>${user.name}</td>
                                    <td>${user.phone}</td>
                                    <td>${user.address}</td>
                            <form action="MainController" method="POST">
                                <td>
                                    <c:choose>
                                        <c:when test="${user.role == 0}">
                                            <p>Admin <input type="radio" checked="" value="0" name="role"> Khách hàng <input type="radio" disabled=""> Ẩn danh <input type="radio" disabled=""></p>
                                            </c:when>
                                            <c:when test="${user.role == 1}">
                                            <p>Admin <input type="radio" name="role" value="0"> Khách hàng <input type="radio" checked="" name="role" value="1"> Ẩn danh <input type="radio" disabled=""></p>
                                            </c:when>
                                            <c:otherwise>
                                            <p>Admin <input type="radio" disabled=""> Khách hàng <input type="radio" disabled=""> Ẩn danh <input type="radio" checked="" value="2"></p>
                                            </c:otherwise>
                                        </c:choose>
                                </td>
                                <td>
                                    <input name="id" value="${user.id}" hidden="">
                                    <input name="option" value="1" hidden="">
                                    <input type="submit" value="Thay đổi" name="action" style="border-radius: 10px; cursor: pointer">
                                </td>
                            </form>
                            </tr>
                        </c:forEach> 
                        </tbody>
                    </table>
                </div>
                <div class="pagination">
                    <ul>
                        <li><a href="#" class="prev">Trước</a></li>
                        <li><a href="#" class="page active">1</a></li>
                        <li><a href="#" class="next">Sau</a></li>
                    </ul>
                </div>
            </c:if>
        </main>
    </body>

    <script>
        const productTable = document.querySelector('.tbl');
        const pagination = document.querySelector('.pagination ul');
        const page = document.querySelector('.pagination ul li:nth-child(2)');

        const productsPerPage = 5;
        let currentPage = 1;

        function displayProducts() {
            const startIndex = (currentPage - 1) * productsPerPage;
            const endIndex = startIndex + productsPerPage;
            const products = Array.from(productTable.tBodies[0].rows);

            products.forEach((product, index) => {
                if (index >= startIndex && index < endIndex) {
                    product.style.display = 'table-row';
                } else {
                    product.style.display = 'none';
                }
            });
        }

        function createPagination() {
            const products = Array.from(productTable.tBodies[0].rows);
            const pageCount = Math.ceil(products.length / productsPerPage);

            for (let i = 2; i <= pageCount; i++) {
                const li = document.createElement('li');
                const link = document.createElement('a');
                link.href = '#';
                link.textContent = i;
                link.classList.add('page');
                if (i === currentPage) {
                    link.classList.add('active');
                }
                li.appendChild(link);
                pagination.insertBefore(li, pagination.lastElementChild);
            }
        }

        createPagination();
        displayProducts();

        pagination.addEventListener('click', e => {
            e.preventDefault();
            if (e.target.classList.contains('page')) {
                currentPage = parseInt(e.target.textContent);
                displayProducts();
                const currentLink = pagination.querySelector('.active');
                currentLink.classList.remove('active');
                e.target.classList.add('active');
            } else if (e.target.classList.contains('prev')) {
                if (currentPage > 1) {
                    currentPage--;
                    displayProducts();
                    const currentLink = pagination.querySelector('.active');
                    currentLink.classList.remove('active');
                    const prevLink = currentLink.parentNode.previousElementSibling.querySelector('a');
                    prevLink.classList.add('active');
                }
            } else if (e.target.classList.contains('next')) {
                const products = Array.from(productTable.tBodies[0].rows);
                const pageCount = Math.ceil(products.length / productsPerPage);
                if (currentPage < pageCount) {
                    currentPage++;
                    displayProducts();
                    const currentLink = pagination.querySelector('.active');
                    currentLink.classList.remove('active');
                    const nextLink = currentLink.parentNode.nextElementSibling.querySelector('a');
                    nextLink.classList.add('active');
                }
            }
        });
    </script>
</html>
