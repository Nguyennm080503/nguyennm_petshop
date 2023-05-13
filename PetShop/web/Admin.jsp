<%-- 
    Document   : PetShop
    Created on : Apr 8, 2023, 8:37:11 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/f0721daea2.js" crossorigin="anonymous"></script>
    <link rel="icon" type="image/x-icon" href="img/pet_shop.png">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/admin.css" rel="stylesheet">
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
            <li><a href="Admin.jsp" class="active">Trang chủ</a></li>
            <li><a href="MainController?action=Account">Quản lí tài khoản</a></li>
            <li><a href="MainController?action=Product">Quản lí Pet</a></li>
            <li><a href="MainController?action=Order">Quản lí đơn hàng</a></li>
        </ul>
        <a href="MainController?action=Logout" class="logout">Đăng xuất</a>
    </aside>
    <main class="col-sm-10">
        
        <article>THỐNG KÊ ĐƠN HÀNG</article>
        <div class="row">
          <div class="col-sm-3 col-xs-12">
              <h5>SỐ ĐƠN HÀNG TRONG NGÀY</h5><br>
              <h5 style="color: red; font-size: 30px; margin-top: 20px">100</h5>
          </div>
          <div class="col-sm-3 col-xs-12">
            <h5>SỐ ĐƠN HÀNG TRONG THÁNG</h5><br>
              <h5 style="color: red; font-size: 30px; margin-top: 20px">600</h5>
          </div>
          <div class="col-sm-3 col-xs-12">
            <h5>SỐ ĐƠN HÀNG TRONG NĂM</h5><br>
              <h5 style="color: red; font-size: 30px; margin-top: 20px">10000</h5>
          </div>
    </div>
    <article>THỐNG KÊ DOANH THU</article>
    <div class="row">
        <div class="col-sm-3 col-xs-12">
            <h5>DOANH THU NGÀY</h5><br>
              <h5 style="color: red; font-size: 30px; margin-top: 20px">8.000.000 đồng</h5>
          </div>
          <div class="col-sm-3 col-xs-12">
            <h5>DOANH THU THÁNG</h5><br>
              <h5 style="color: red; font-size: 30px; margin-top: 20px">40.000.000 đồng</h5>
          </div>
          <div class="col-sm-3 col-xs-12">
            <h5>DOANH THU NĂM</h5><br>
              <h5 style="color: red; font-size: 30px; margin-top: 20px">600.000.000 đồng</h5>
          </div>
    </div>
    </main>
</body>
<script>
</script>
</html>
