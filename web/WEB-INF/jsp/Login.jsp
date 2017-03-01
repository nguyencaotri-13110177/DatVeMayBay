<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<!DOCTYPE html>
<html lang="en">
<head>
	<title>DatVeMayBay::CaoTri-AnhTuong</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

	<header class="trasparent_nav">
		<div class="wrapper">
			<div class="logo">
				<a href="main.ute"><img src="img/home.png" alt="Fertile" width="60" height="60"></a>
			</div>

			<nav>
				<ul>
					<li><a href="#">Our Story</a></li>
					<li><a href="#">Products</a></li>
					<li><a href="login.ute">Đăng nhập</a></li>
					<li><a href="register.ute">Đăng ký</a></li>
				</ul>
			</nav>
		</div>
	</header><!-- End trasparent_nav -->

	
	<div class="login-card">
		<h1>Đăng nhập</h1>
		<h4 style="color:red">${errors}</h4>
		<form:form action="login.ute"
		method="post" modelAttribute="user">
		<div>User Name:</div>
		<form:input path="id"/>
		
		<div>Password:</div>
		<form:password path="password"/>
		
		<br>
		<input type="submit" value="Sign In">
	</form:form>
	</div>
	<footer>
	</footer>	        
	</body>
</html>
