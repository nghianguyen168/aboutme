<%@page import="dao.UserGuestDAO"%>
<%@page import="model.UserGuest"%>
<%@page import="model.User"%>
<%@page import="constant.CommonConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Đăng ký tài khoản</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/auth/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/auth/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/auth/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/auth/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/auth/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/auth/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/auth/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/auth/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/auth/css/util.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/auth/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('<%=request.getContextPath()%>/templates/auth/images/bg-01.jpg');">
			<div class="wrap-login100 p-t-30 p-b-50">
				<span class="login100-form-title p-b-41">
					Đăng ký tài khoản
				</span>
				 <%
				 			String username="";
				 			String password="";
				 			String fullname="";
				 			
				 			if(request.getAttribute("userTrung")!=null) {
				 			UserGuest uGuest = (UserGuest) request.getAttribute("userTrung");
				 				username = uGuest.getUsername();
				 				password = uGuest.getPassword();
				 				fullname=uGuest.getFullname();
				 			}
                        
                			if (request.getParameter("msg") != null) {
                				String msg = request.getParameter("msg");
                				
                				if (msg.equals(CommonConstant.DOUBLECAT)) {
                				
                					
                		%>
                			<div class="alert alert-danger" role="alert">
  								Tài khoản đã tồn tại!
						</div>
                		<%
                				} 
                			}
                		%>
				<form class="login100-form validate-form p-b-33 p-t-5" action="<%=request.getContextPath()%>/public/signup" method="POST">
					
					<div class="wrap-input100 validate-input" data-validate = "Enter username">
						<input class="input100" type="text" value="<%=username %>" name="username" placeholder="Tên đăng nhập">
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Enter fullname">
						<input class="input100" type="text" value="<%=fullname %>" minlength="6" name="fullname" placeholder="Tên đầy đủ">
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" value="<%=password %>" type="password" minlength="6"  id="password"  name="password" placeholder="Mật khẩu">
						<span class="focus-input100" data-placeholder="&#xe80f;"></span>
					</div>
					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" value="" id="confirm_password" type="password" name="confirmpass" placeholder="Xác nhận nật khẩu">
						<span class="focus-input100" data-placeholder="&#xe80f;"></span>
					</div>
					<script type="text/javascript">
					var password = document.getElementById("password")
					  , confirm_password = document.getElementById("confirm_password");

					function validatePassword(){
					  if(password.value != confirm_password.value) {
					    confirm_password.setCustomValidity("Passwords Don't Match");
					  } else {
					    confirm_password.setCustomValidity('');
					  }
					}

					password.onchange = validatePassword;
					confirm_password.onkeyup = validatePassword;
					
					</script>
					<div class="container-login100-form-btn m-t-32">
						<button type="submit" class="login100-form-btn">
							Đăng ký
						</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/templates/auth/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/templates/auth/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/templates/auth/vendor/bootstrap/js/popper.js"></script>
	<script src="<%=request.getContextPath()%>/templates/auth/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/templates/auth/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/templates/auth/vendor/daterangepicker/moment.min.js"></script>
	<script src="<%=request.getContextPath()%>/templates/auth/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/templates/auth/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/templates/auth/js/main.js"></script>

</body>
</html>