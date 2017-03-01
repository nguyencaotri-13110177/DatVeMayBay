<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>DatVeMayBay::CaoTri-AnhTuong</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/main.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<style>
.btn {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
}

.dobong:hover {
	box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0
		rgba(0, 0, 0, 0.19);
}
</style>



<script>
if(${thongbao == null})
	{
	$(function(){ $('#err').hide(); });
	}
else
	{
	$(function(){ $('#err').show(); });
	}
</script>

</head>
<body>
	<%
    	String session_user=(String)session.getAttribute("username");
    %>
	<header class="trasparent_nav">
		<div class="wrapper">
			<div class="logo">
				<a href="main.ute"><img src="img/logo.png" alt="Fertile"></a>
			</div>

			<nav>
				<ul>
					<%
						if(session_user == null)
						{
							out.println("<li><a href=\"login.ute\">Đăng nhập</a></li>");
							out.println("<li><a href=\"register.ute\">Đăng ký</a></li>");
						}
						else
						{							
							out.println("<li><a href=\"login.ute\">Xin chào ");
							out.println(session_user);
							out.println("</a></li>");
							out.println("<li><a href=\"logout.ute\">Đăng xuất</a></li>");
						}
					%>
				</ul>
			</nav>
		</div>
	</header>
	<!-- End trasparent_nav -->

	<div class="container" style="margin-top:10%" id="err" hidden >
		<div class="alert alert-danger alert-dismissable fade in">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			<b>&#x26a0; ${thongbao }</b>
		</div>
	</div>

	<div class="panel panel-default"
		style="position: absolute;top: 200px;left: 120px; width: 20%;">
		<div class="panel-heading">
			<center>Tìm vé</center>
		</div>
		<div class="panel-body">
			<form:form action="timve.ute" method="post">
				<div class="form-group">
					<label for="email">Sân bay đi:</label> <select name="MaSanBayDi"
						class="form-control">
						<c:forEach var="f" items="${ListSanBay}">
							<option value="${f.getMaSanBay()}">${f.getTenSanBay()}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="email">Sân bay đến:</label> <select name="MaSanBayDen"
						class="form-control">
						<c:forEach var="f" items="${ListSanBay}">
							<option value="${f.getMaSanBay()}">${f.getTenSanBay()}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="email">Ngày đi:</label> <input type="date"
						class="form-control" name="NgayDi">
				</div>
				<center>
					<button type="submit" class="btn dobong">Tìm vé</button>
				</center>
			</form:form>
		</div>
	</div>



	<footer> </footer>
</body>
</html>