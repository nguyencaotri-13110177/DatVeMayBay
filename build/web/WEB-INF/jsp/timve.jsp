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
<link rel="stylesheet" type="text/css" href="css/StepProcess.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/sorttable.js"></script>



<style>
.cardTV {
	padding: 20px;
	width: 800px;
	background-color: #F7F7F7;
	margin-top: 10%;
	margin-left: 10%;
}

table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd !important;
}

tr:hover {
	background-color: #D8D8D8
}

table.sortable th:not(.sorttable_sorted):not(.sorttable_sorted_reverse):not(.sorttable_nosort):after { 
    content: " \25B4\25BE" 
}
</style>

</head>
<body>

	<header class="trasparent_nav">
		<div class="wrapper">
			<div class="logo">
				<a href="main.ute"><img src="img/logo.png" alt="Fertile"></a>
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
				<button type="button" class="btn btn-warning btn-circle"
					onclick="location.href = '${pageContext.request.contextPath}/timve.ute'">1</button>
				<p style="color: yellow">Tìm vé</p>
			</div>
			<div class="stepwizard-step">
				<button type="button" class="btn btn-default btn-circle"
					disabled="disabled">2</button>
				<p style="color: yellow">Đặt vé</p>
			</div>
			<div class="stepwizard-step">
				<button type="button" class="btn btn-default btn-circle"
					disabled="disabled">3</button>
				<p style="color: yellow">Thanh toán</p>
			</div>
		</div>
	</div>



	<div class="panel panel-default"
		style="margin-top: 1%; margin-left: 4%; width: 70%; float: left">
		<div class="panel-heading">
			<center>Thông tin chuyến bay</center>
		</div>
		<div class="panel-body">

			<div class="row">
				<span class="left"> &#x2708; SB Đi - SB Đến:
					${ListKetQuaTimVe.get(0).getTenSanBayDi()} &#8594&nbsp </span> <span>${ListKetQuaTimVe.get(0).getTenSanBayDen()}</span>
			</div>

			<div class="row">
				<span class="left"> &#x1f550; Ngày Đi - Ngày Đến:
					${ListKetQuaTimVe.get(0).getNgayDi()} &#8594&nbsp </span> <span>${ListKetQuaTimVe.get(0).getNgayDen()}</span>
			</div>
			<form:form action="thongtindatve.ute" method="post">
			<table class="sortable">
				<tr>
					<th>Hãng</th>
					<th>Mã máy bay</th>
					<th>Mã ghế</th>
					<th>Giờ đi</th>
					<th>Giờ đến</th>
					<th>Giá</th>
					<th></th>
					<th>Đặt nhiều vé</th>
				</tr>

				
					<c:forEach var="f" items="${ListKetQuaTimVe}">
						<tr>
							<td><p hidden>1</p> <img src="img/VN.png" alt="Fertile"></td>
							<td>${f.getMaMayBay()}</td>
							<td>${f.getMaGhe()}</td>
							<td>${f.getGioDi()}</td>
							<td>${f.getGioDen()}</td>
							<td>${f.getGia()}</td>
							<td><a
								href="${pageContext.request.contextPath}/thongtindatve.ute?MaChuyenBay=${f.getMaChuyenBay()}&MaGhe=${f.getMaGhe()}&Gia=${f.getGia()}&Hang=VietNam AirLine"
								style="color: blue">Đặt vé</a></td>
							<td><div class="checkbox">
									<label><input type="checkbox"
										value="${f.getMaChuyenBay()} ${f.getMaGhe()} ${f.getGia()} VNAirLine"
										name="ChonNhieu">Chọn</label>
								</div></td>
						</tr>
					</c:forEach>

					<c:forEach var="f2" items="${listketquatimveVietJect}">
						<tr>
							<td><p hidden>2</p> <img src="img/VJ.png" alt="Fertile"></td>
							<td>${f2.getMaMayBay()}</td>
							<td>${f2.getMaGhe()}</td>
							<td>${f2.getGioDi()}</td>
							<td>${f2.getGioDen()}</td>
							<td>${f2.getGia()}</td>
							<td><a
								href="${pageContext.request.contextPath}/thongtindatve.ute?MaChuyenBay=${f2.getMaChuyenBay()}&MaGhe=${f2.getMaGhe()}&Gia=${f2.getGia()}&Hang=Viet Ject Air"
								style="color: blue">Đặt vé</a></td>
								<td><div class="checkbox">
									<label><input type="checkbox"
										value="${f2.getMaChuyenBay()} ${f2.getMaGhe()} ${f2.getGia()} VietJetAir"
										name="ChonNhieu">Chọn</label>
								</div></td>
						</tr>
					</c:forEach>

			</table>
			<br>
			<center><button type="submit" class="btn btn-default">Đặt vé</button></center>
			</form:form>
		</div>
	</div>


<!-- Khung tìm vé ở bên cạnh -->
	<div class="panel panel-default"
		style="margin-top: 1%; margin-left: 77%; width: 20%;position: fixed">
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
					<button type="submit" class="btn btn-default">Tìm vé</button>
				</center>
			</form:form>
		</div>
	</div>



</body>
</html>