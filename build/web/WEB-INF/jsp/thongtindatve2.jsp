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
				<a href="main.ute"><img src="img/logo.png" alt="Fertile" ></a>
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

	<div class="stepwizard" style="margin-top: 8%;">
		<div class="stepwizard-row">
			<div class="stepwizard-step">
				<button type="button" class="btn btn-default btn-circle"
					onclick="location.href = '${pageContext.request.contextPath}/timve.ute'">1</button>
				<p style="color: yellow">Tìm vé</p>
			</div>
			<div class="stepwizard-step">
				<button type="button" class="btn btn-warning btn-circle">2</button>
				<p style="color: yellow">Đặt vé</p>
			</div>
			<div class="stepwizard-step">
				<button type="button" class="btn btn-default btn-circle"
					disabled="disabled">3</button>
				<p style="color: yellow">Thanh toán</p>
			</div>
		</div>
	</div>

	<div class="container" style="margin-top:0%;width:70%" id="err"  >
		<div class="alert alert-success alert-dismissable fade in">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			<b>${mssThoiGianGiuVe }</b>
		</div>
	</div>

	<div class="panel panel-default"
		style="position: absolute;top: 38%;left: 23%; width: 50%">
		<div class="panel-heading">
			<center>Thông tin đặt vé</center>
		</div>
		<div class="panel-body">

			<h4 style="color:green"><b>&#x270D; Số vé:${sove }</b></h4>
			<h4 style="color:green"><b>&#x270D; Tổng số tiền:${tonggiave } VND</b></h4>

			<form action="action_page.php" class="form-horizontal">
				<fieldset>
					<legend>Thông tin khách hàng đặt vé:</legend>
					<!-- Thông tin của người mua vé -->
					
					<div class="form-group">
						<label class="control-label col-sm-2" >Mã KH:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" >
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" >Họ tên:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" 	>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" >CMND:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control"	>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" >Địa chỉ:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control"	>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">SĐT:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" 	>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" >Email:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" 	>
						</div>
					</div>
					
					
					
				</fieldset>

				<c:set var="c" value="0" />
			
				<c:set var="d" value="${Ghe0}" />
				<c:forEach var="i" begin="0" end="${sove*3-3 }" step="3">

					<!-- Thông tin các vé -->
					<fieldset>
						<legend>
							vé thứ:
							<c:out value="${c=c+1}" />
						</legend>
						&#9992; Khởi hành từ: <b>${dschuyenbay.get(i/3).getTenSanBayDi()}</b>
						(${dschuyenbay.get(i/3).getMaSanBayDi()})
						${dschuyenbay.get(i/3).getGioDi()},
						${dschuyenbay.get(i/3).getNgayDi()}<br> &#9992; Tới: <b>${dschuyenbay.get(i/3).getTenSanBayDen()}</b>
						(${dschuyenbay.get(i/3).getMaSanBayDen()})
						${dschuyenbay.get(i/3).getGioDen()},
						${dschuyenbay.get(i/3).getNgayDen()}<br> &#x1f4ba; Mã Ghế:
						${dsghe.get(i/3)}<br> &#128181; Giá: ${dsgia.get(i/3)} VND<br>
						Hãng: <b>${dshang.get(i/3)}</b>
					</fieldset>
					<br>

					<!-- Thông tin khách hàng của vé này -->

					<div class="form-group">
						<label class="control-label col-sm-2" >Họ tên:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control"  placeholder="họ tên kh của vé thứ ${i/3+1 }"	>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" >CMND:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" placeholder="số cmnd kh của vé thứ ${i/3+1 }"	>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" >Địa chỉ:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" 	placeholder="địa chỉ kh của vé thứ ${i/3+1 }">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" >SĐT:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" 	placeholder="sđt kh của vé thứ ${i/3+1 }">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" >Email:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control"  placeholder="email kh của vé thứ ${i/3+1 }"	>
						</div>
					</div>
					

				</c:forEach>
				
				<center>
						<button type="button" class="btn btn-success"
							onclick="myFunction()">Đặt vé</button>
					</center>

			</form>

		</div>


	</div>





</body>
</html>