<%@page import="model.User"%>
<%@page import="constant.CommonConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>About Me Login</title>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('<%=request.getContextPath()%>/templates/auth/images/bg-01.jpg');">
			<div class="wrap-login100 p-t-30 p-b-50">
				<span class="login100-form-title p-b-41">
					About Me Login
				</span>
				 <%
                        
                			if (request.getParameter("msg") != null) {
                				String msg = request.getParameter("msg");
                				
                				if (msg.equals(CommonConstant.ERROR)) {
                				
                					
                		%>
                			<div class="alert alert-danger" role="alert">
  								Sai tên đăng nhập hoặc mật khẩu!
						</div>
                		<%
                				} 
                			}
                		%>
				<form class="login100-form validate-form p-b-33 p-t-5" action="<%=request.getContextPath()%>/public/login" method="POST">
					<%
						String userN="";
						String pass="";
						if(request.getAttribute("userErr")!=null){
							User userErr = (User) request.getAttribute("userErr");
							userN=userErr.getName();
							pass=userErr.getPassword();
						}
					%>
					<div class="wrap-input100 validate-input" data-validate = "Enter username">
						<input class="input100" type="text" value="<%=userN %>" name="username" placeholder="Tên đăng nhập">
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" value="<%=pass %>" type="password" name="password" placeholder="Mật khẩu">
						<span class="focus-input100" data-placeholder="&#xe80f;"></span>
					</div>

					<div class="container-login100-form-btn m-t-32">
						<button type="submit" class="login100-form-btn">
							Đăng nhập
						</button>
					</div>
					<div class="container-login100-form-btn m-t-32">
						<a href="<%=request.getContextPath() %>/public/signup" class="login100-form-btn">
							Đăng ký
						</a>
					</div>
					<!-- <a href="https://www.facebook.com/dialog/oauth?client_id=210350843369140&redirect_uri=https://localhost:8094/login-facebook" class="fb btn">
			          <i class="fa fa-facebook fa-fw"></i> Login with Facebook
			        </a> -->
							 
					

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