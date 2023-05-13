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
            <div class="search">
                <form action="MainController" method="POST">
                    <input type="search" name="txtpet" placeholder="Tìm kiếm bằng tên....." value="${param.txtpet}">
                    <input type="submit" value="Tìm kiếm" name="action">
                </form>
                <c:set var="msg" value="${requestScope.message}"/>
                <c:if test="${list == null}">
                    <c:out value="${msg}"/>
                </c:if>
            </div>
                <div style="float: right; margin-right: 50px">
                    <form method="POST" action="MainController">
                        <input type="submit" name="action" value="+ Thêm Pet" style="border-radius: 10px; cursor: pointer; padding: 10px; background-color: aquamarine">
                    </form>
                </div>
                <div style="float: right; margin-right: 50px">
                    <form method="POST" action="MainController">
                        <input type="submit" name="action" value="+ Dòng Pet" style="border-radius: 10px; cursor: pointer; padding: 10px; background-color: aquamarine">
                    </form>
                </div>
            <c:set var="pets" value="${requestScope.list}"/>
            <c:if test="${pets != null && pets.size() > 0 }">
                <div class="col-sm-12 col-xs-12 table">
                    <table border="3" class="tbl">
                        <thead>
                            <tr>
                                <th>STT</th>
                                <th>Tên</th>
                                <th>Hình</th>
                                <th>Thông tin chi tiết</th>
                                <th>Giá</th>
                                <th>Loại</th>
                                <th>Trạng thái</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="pet" items="${pets}" varStatus="loop">
                                <tr>
                            <form action="MainController" method="POST">
                                <td>${loop.count}</td>
                                <td><input type="text" name="txtname" value="${pet.name}"></td>
                                <td>
                                    <img src="img/${pet.img}" height="100px" width="100px" id="img"><br>
                                    <input type="file" name="txtimg" id="img-input">
                                    <input name="oldimg" value="${pet.img}" hidden="">
                                </td>
                                <td><textarea name="txtdes">${pet.des}</textarea></td>
                                <td><input type="text" name="price" value="${pet.price}"></td>
                                <td>${pet.catename}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${pet.status == 0}">
                                            <p>Còn <input type="radio" checked="" value="0" name="statuspet">&ensp; Hết <input type="radio" name="statuspet" value="1"></p>
                                            </c:when>
                                            <c:otherwise>
                                            <p>Còn <input type="radio" value="0" name="statuspet">&ensp; Hết <input type="radio" name="statuspet" value="1" checked="">
                                            </c:otherwise>
                                        </c:choose>
                                </td>
                                <td>
                                    <input name="idpet" value="${pet.idPet}" hidden="">
                                    <input type="submit" value="Thay đổi Pet" name="action" class="btn">
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

        const productsPerPage = 3;
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

    <script>
        const inputFile = document.getElementById('img-input');
        const image = document.getElementById('img');
        inputFile.addEventListener('change', function () {
                if (inputFile.files && inputFile.files[0]) {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        image.src = e.target.result;
                    };
                    reader.readAsDataURL(inputFile.files[0]);
                }
        });
    </script>
</html>
