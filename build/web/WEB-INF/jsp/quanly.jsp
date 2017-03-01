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
<link rel="stylesheet" type="text/css" href="css/StepProcess.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	






</head>
<body>

	<header class="trasparent_nav">
		<div class="wrapper">
			<div class="logo">
				<a href="#"><img src="img/logo.png" alt="Fertile"></a>
			</div>

			<nav>
				<ul>
					<li><a href="#">Our Story</a></li>
					<li><a href="#">Products</a></li>
					<li><a href="#">Journal</a></li>
					<li><a href="#">Contact</a></li>
				</ul>
			</nav>
		</div>
	</header>
	<!-- End trasparent_nav -->


	<div class="panel panel-default"
		style="margin-top: 10%; margin-left: 7%; float: left">

		<div class="panel-body">


			<div class="container">
				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#menu1">Thông báo khuyến mãi</a></li>
					<li><a data-toggle="tab" href="#menu2">Quản lý khách hàng</a></li>
					<li><a data-toggle="tab" href="#menu3">Thống kê</a></li>
					<li><a data-toggle="tab" href="#menu4">Quản lý vé</a></li>
				</ul>
				<div class="tab-content">
					<div id="menu1" class="tab-pane fade in active">
					
					${thongbao}
						<form class="form-horizontal" style="margin-top: 2%" action="guiemail.ute" method="post">
							<div class="form-group" >
								<label class="control-label col-sm-2" for="email">Email nhận:</label>
								<div class="col-sm-10" style="width:30%">
									<input type="email" class="form-control" id="email"
										 name="EmailNhan">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="pwd">Subject:</label>
								<div class="col-sm-10" style="width:30%">
									<input type="text" class="form-control" id="pwd"
										 name="Subject">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="pwd">Nội dung:</label>
								<div class="col-sm-10" style="width:30%">
									<textarea rows="4" cols="50" class="form-control" name="NoiDung"></textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-default">Gửi</button>
								</div>
							</div>
						</form>
						
						
					</div>
					<div id="menu2" class="tab-pane fade">
						<h3>HOME</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua.</p>
					</div>
					<div id="menu3" class="tab-pane fade">
						<h3>Menu 2</h3>
						<p>Sed ut perspiciatis unde omnis iste natus error sit
							voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
					</div>
					<div id="menu4" class="tab-pane fade">
						<h3>Menu 3</h3>
						<p>Eaque ipsa quae ab illo inventore veritatis et quasi
							architecto beatae vitae dicta sunt explicabo.</p>
					</div>
				</div>
			</div>

		</div>
	</div>




</body>
</html>