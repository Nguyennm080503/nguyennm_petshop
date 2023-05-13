<%-- 
    Document   : register
    Created on : Apr 8, 2023, 9:34:53 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/x-icon" href="img/pet_shop.png">
        <link href="css/login.css" rel="stylesheet">
        <title>Login</title>
    </head>
    <body>
        <img src="img/pet_shop.png" width="150px" height="150px">
        <div class="form">
            <div class="headform">
                <h2 class="loginbutton">Đăng nhập</h2>
                <h2 class="registerbutton active">Đăng kí</h2>
            </div>
            <div id="login" style="display: none">
                <form action="MainController" method="POST" >
                    <h3>Đăng nhập</h3>
                    <p>Tài khoản: <input name="account" type="text"></p>
                    <p>Mật khẩu : <input name="password" type="password"></p>
                    <input type="submit" value="Đăng nhập" class="button" name="action">
                </form>
                <div class="link">
                    <a href="PetShop.jsp">Tiếp tục vào trang không cần đăng nhập</a>
                </div>
            </div>
            <div id="register" class="register1">
                <form action="MainController" method="POST">
                    <h3>Đăng kí</h3>
                    <p>Email:&emsp;&emsp; <input type="email" name="email" required=""></p>
                        <c:set var="msg" value="${requestScope.email}"/>
                        <c:if test="${msg != null}">
                        <div style="color: red; text-align: center">
                            <c:out value="${msg}"/>
                        </div>
                    </c:if>
                    <p>Họ và Tên: <input type="text" name="name" required=""></p>
                    <p>Tài khoản: <input type="text" name="account" required=""></p>
                        <c:set var="msg" value="${requestScope.account}"/>
                        <c:if test="${msg != null}">
                        <div style="color: red; text-align: center">
                            <c:out value="${msg}"/>
                        </div>
                    </c:if>
                    <p>Mật khẩu : <input type="password" name="password" id="pass" required=""></p>
                    <p>Nhập lại mật khẩu: <input type="password" id="repass" required=""></p>
                    <p>Điện thoại:<input type="tel" name="phone" required=""></p>
                    <p>Địa chỉ:&emsp; <input type="text" name="address" required=""></p>
                    <p><input hidden="" name="role" value="1"></p>
                    <p><input hidden="" name="status" value="0"></p>
                    <input type="submit" value="Đăng kí" class="button" name="action" >
                </form>
            </div>
        </div>
    </body>

    <c:set var="msg1" value="${requestScope.register}"/>
    <c:if test="${msg1 != null}">
        <script>
            alert("Đăng kí tài khoản thành công!!");
        </script>
    </c:if>

    <c:set var="msg2" value="${requestScope.registerfail}"/>
    <c:if test="${msg2 != null}">
        <script>
            alert("Đăng kí tài khoản không thành công. Vui lòng đăng kí lại");
        </script>
    </c:if>

    <script>
        var buttonloginform = document.querySelector(".loginbutton");
        var buttonregister = document.querySelector(".registerbutton");
        var login = document.getElementById("login");
        var register = document.getElementById("register");

        buttonloginform.addEventListener("click", (event) => {
            login.style.display = "block";
            register.style.display = "none";
            buttonregister.classList.remove("active");
            buttonloginform.classList.add("active");
        });

        buttonregister.addEventListener("click", (event) => {
            register.style.display = "block";
            login.style.display = "none";
            buttonloginform.classList.remove("active");
            buttonregister.classList.add("active");
        });
    </script>

    <script>
        var password = document.getElementById("pass")
                , confirm_password = document.getElementById("repass");

        function validatePassword() {
            if (password.value !== confirm_password.value) {
                confirm_password.setCustomValidity("Passwords Don't Match");
            } else {
                confirm_password.setCustomValidity('');
            }
        }
        password.onchange = validatePassword;
        confirm_password.onkeyup = validatePassword;
    </script>