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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <script>
function myFunction() {
    var imakh,iemail,icmnd,isdt,idiachi,iten;
    var test=0;

    // Get the value of the input field with id="numb"
    x = document.getElementById("makh").value;
    y = document.getElementById("email").value;
    z = document.getElementById("cmnd").value;
    a = document.getElementById("sdt").value;
    b = document.getElementById("diachi").value;
    c = document.getElementById("ten").value;

    //------------Kiem tra ma khach hang-------------------
    if(x==""){
    	imakh = "*Không để trống mã khách hàng";
    	test=1;
    }else if (isNaN(x)) {
    	imakh = "*Mã khách hàng sai";
    	test=1;
    } else {
    	imakh = "";
    }
    document.getElementById("imakh").innerHTML = imakh;
    
    //------------Kiem tra email-------------------
    var atpos = y.indexOf("@");
    var dotpos = y.lastIndexOf(".");
    if (y==""){
    	iemail="*Không để trống email";
    	test=1;
    }else if (atpos<1 || dotpos<atpos+2 || dotpos+2>=y.length) {
    	iemail = "Email sai định dạng";
    	test=1;
    }else {
    	iemail = "";
    }
    document.getElementById("iemail").innerHTML = iemail;
    
    //--------Kiem tra cmnd-------------
    if (isNaN(z)) {
        icmnd = "*Số cmnd sai";
        test=1;
    } else if (z==""){
    	icmnd = "*Không để trống số cmnd";
    	test=1;
    }
    else {
    	icmnd = "";
    }
    document.getElementById("icmnd").innerHTML = icmnd;
    
    //-------------kiem tra sdt----------------
    if (isNaN(a)) {
        isdt = "*Số điện thoại sai";
        test=1;
    } else if (a==""){
    	isdt = "*Không để trống số điện thoại";
    	test=1;
    }
    else {
    	isdt = "";
    }
    document.getElementById("isdt").innerHTML = isdt;
    
  //-------------kiem tra dia chi----------------
    if (b=="") {
        idiachi = "*không để trống địa chỉ";
        test=1;
    } else {
    	idiachi = "";
    }
    document.getElementById("idiachi").innerHTML = idiachi;
    
  //-------------kiem tra ten khach hang----------------
    if (c=="") {
        iten = "*không để trống tên";
        test=1;
    } else {
        iten = "";
    }
    document.getElementById("iten").innerHTML = iten;
    
    if(test==0){
    	location.href = '${pageContext.request.contextPath}/thanhtoan.ute';
    }
}
</script>

	
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
	</header><!-- End trasparent_nav -->
	
	<div class="stepwizard" style="margin-top: 8%;">
		<div class="stepwizard-row">
			<div class="stepwizard-step">
				<button type="button" class="btn btn-default btn-circle" onclick="location.href = '${pageContext.request.contextPath}/timve.ute'">1</button>
				<p style="color: yellow">Tìm vé</p>
			</div>
			<div class="stepwizard-step">
				<button type="button" class="btn btn-warning btn-circle" >2</button>
				<p style="color: yellow">Đặt vé</p>
			</div>
			<div class="stepwizard-step">
				<button type="button" class="btn btn-default btn-circle"
					disabled="disabled">3</button>
				<p style="color: yellow">Thanh toán</p>
			</div>
		</div>
	</div>
  
   <div class="panel panel-default" style="margin-top: 1%;margin-left: 25%;width: 40% ;float:left ">
    <div class="panel-heading"><center>Thông tin đặt vé</center></div>
    <div class="panel-body">
    
    <fieldset>
    <legend>Thông tin chuyến bay:</legend>
    	&#9992; Khởi hành từ: <b>${ChuyenBay.getTenSanBayDi()}</b> (${ChuyenBay.getMaSanBayDi()}) ${ChuyenBay.getGioDi()}, ${ChuyenBay.getNgayDi()}<br>
    	&#9992; Tới: <b>${ChuyenBay.getTenSanBayDen()}</b> (${ChuyenBay.getMaSanBayDen()}) ${ChuyenBay.getGioDen()}, ${ChuyenBay.getNgayDen()}<br>
		&#x1f4ba; Mã Ghế: ${MaGhe}<br>
		&#128181; Giá: ${Gia} VND<br>
		Hãng: <b>${Hang}</b>
		</fieldset><br>
		
<form:form action="action_page.php" id="form_1">
  <fieldset>
    <legend>Thông tin khách hàng:</legend>
    Mã khách hàng:<br>
    <p style="color: red" id="imakh"></p>
    <input type="text" name="MaKhachHang" id="makh">
    <br>
    Tên khách hàng:<br>
    <p style="color: red" id="iten"></p>
    <input type="text" name="TenKhachHang" id="ten">
    <br>
    CMND:<br>
    <p style="color: red" id="icmnd"></p>
    <input type="text" name="CMND" id="cmnd">
    <br>
    Địa chỉ:<br>
    <p style="color: red" id="idiachi"></p>
    <input type="text" name="DiaChi" id="diachi">
    <br>
    SDT:<br>
    <p style="color: red" id="isdt"></p>
    <input type="text" name="SDT" id="sdt">
    <br>
    Email:<br>
    <p style="color: red" id="iemail"></p>
    <input type="text" name="Email" id="email">
    <br>
    <br>
    <center><button type="button" class="btn btn-success" onclick="myFunction()">Đặt vé</button></center>
  </fieldset>
</form:form>

    </div>
    
    
  </div>
  

  

	
</body>
</html>