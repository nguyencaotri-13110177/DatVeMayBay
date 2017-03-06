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

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"><!--banh rang-->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>



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

<script type="text/javascript">
$(document).ready(function(){
	$('#btntimve').click(function(e){
		e.preventDefault();
		$.ajax({
			url:'timve.ute',
			type:'POST',
			dataType:'html',
                        beforeSend: function() {
                            $('#banhrang').show();
                            
                        },
                        complete: function() {
                            $('#banhrang').hide();
                        },
			data:{
				MaSanBayDi:$('#MaSanBayDi option:selected').val(),
				MaSanBayDen:$('#MaSanBayDen option:selected').val(),
				NgayDi:$('#NgayDi').val()
			}
		}).done(function(ketqua){
			$('#noidung').html(ketqua);
		});
	});
});
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
                
               
                <div id="banhrang" hidden><i class="fa fa-gear fa-spin" style="font-size:24px"></i></div>
                
                                            
                           <div class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title">Modal title</h4>
      </div>
      <div class="modal-body">
        <p>One fine body…</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

	<div class="panel panel-default"
		style="margin-top: 10%; margin-left: 3%; width: 20%;position: fixed">
		<div class="panel-heading">
			<center>Tìm vé</center>
		</div>
		<div class="panel-body">
			<form:form action="timve.ute" method="post">
				<div class="form-group">
					<label for="email">Sân bay đi:</label> <select name="MaSanBayDi" id="MaSanBayDi"
						class="form-control">
						<c:forEach var="f" items="${ListSanBay}">
							<option value="${f.getMaSanBay()}">${f.getTenSanBay()}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="email">Sân bay đến:</label> <select name="MaSanBayDen" id="MaSanBayDen"
						class="form-control">
						<c:forEach var="f" items="${ListSanBay}">
							<option value="${f.getMaSanBay()}">${f.getTenSanBay()}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="email">Ngày đi:</label> <input type="date" id="NgayDi"
						class="form-control" name="NgayDi">
				</div>
				<center>
					<button type="submit" class="btn dobong" id="btntimve">Tìm vé</button>
				</center>
			</form:form>
		</div>
	</div>
                
        <div  id="noidung">
        </div>



	<footer> </footer>
</body>
</html>