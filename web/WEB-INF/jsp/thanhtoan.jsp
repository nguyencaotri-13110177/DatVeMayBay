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
	 <%
    	String session_user=(String)session.getAttribute("username");
    %>
	<header class="trasparent_nav">
		<div class="wrapper">
			<div class="logo">
				<a href="main.ute"><img src="img/home.png" alt="Fertile" width="60" height="60"></a>
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
	</header><!-- End trasparent_nav -->

	
	<div class="login-card">
		<h1>Quý khách vui lòng chọn cách thanh toán</h1>
		<br>
		<div class="toggle">
 <div class="toggle-header clearfix" data-bind="click: changePaymentType.bind($data, 4)">
                                <img src="/Upload/payment-type/thanh-toan-bang-may-pos.png" alt="POS" width="92" height="72">
                                <div class="title">
                                    <label>THANH TOÁN BẰNG MÁY POS</label>
                                    <div class="description">Sau khi đặt vé thành công, nhân viên VeMayBay.vn sẽ mang máy cà thẻ ATM đến tận nơi.</div>
                                </div>
                                <div class="arrow"></div>
                            </div>
                            <div class="toggle-content" data-bind="visible: (activePaymentTypeIndex() == 4)">
<form action="/FlightBook/Confirm" class="processing-block submit-block" method="post" novalidate="novalidate"><input id="PaymentType" name="PaymentType" type="hidden" value="POS"><input id="SessionId" name="SessionId" type="hidden" value="C011100HANSGN231216118539482">                                    <div class="bill clearfix">
                                        <div class="custom-checkbox pull-left">
                                            <input name="CreateInvoice" type="checkbox" id="cbbill-POS" value="true" data-bind="checked: getInvoice">
                                            <label for="cbbill-POS"></label>
                                        </div>
                                        Nếu Quý Khách có nhu cầu xuất hóa đơn xin check vào ô bên trái và điền đầy đủ thông tin cần thiết
                                    </div>
                                    <!-- ko if: getInvoice() --><!-- /ko -->
                                    <div class="agreement clearfix">
                                        <div class="custom-checkbox pull-left" style="display:none">
                                            
                                            <input data-val="true" data-val-mandatory="Vui lòng đồng ý điều khoản" data-val-required="The Confirm field is required." id="cbagree-POS" name="Confirm" type="checkbox" value="true" checked="checked">
                                            <label for="cbagree-POS"></label>
                                        </div>
Khi nhấp chuột vào “Đặt vé”, bạn đã đồng ý với các  <a href="/thong-tin-can-biet/dieu-khoan-su-dung-tren-vemaybayvn.htm" class="term-condition">điều khoản</a> của VEMAYBAY.VN                                        <span class="field-validation-valid" data-valmsg-for="Confirm" data-valmsg-replace="true"></span>
                                    </div>
                                    <div class="custom-input capcha-field">
                                        <label>Vui lòng nhập kết quả<span class="cross-fire">*</span> </label>
                                        <input class="w-170" data-val="true" data-val-required="Vui lòng nhập kết quả" id="Captcha" name="Captcha" placeholder="Kết quả" style="width: 190px;" type="text" value="">
                                        <div class="capcha pull-right">
                                            <img src="/Captcha/CaptchaImage?prefix=FlightBook&amp;sessionId=C011100HANSGN231216118539482POS" alt="this is a capcha">
                                        </div>
                                    </div>
<span class="field-validation-valid" data-valmsg-for="Captcha" data-valmsg-replace="true"></span>                                    <button type="submit" class="btn-m btn-book">ĐẶT VÉ</button>
</form>
          </div>
                        </div>
	</div>
	<footer>		
	</footer>	        
	</body>
</html>