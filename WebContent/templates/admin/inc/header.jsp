<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <title>Admmin-Aboume</title>
    <!-- BOOTSTRAP STYLES-->
    <link href="<%=request.getContextPath() %>/templates/admin/assets/css/bootstrap1.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="<%=request.getContextPath() %>/templates/admin/assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLES-->
    <link href="<%=request.getContextPath() %>/templates/admin/assets/css/style1.css" rel="stylesheet" />
       <link href="<%=request.getContextPath() %>/templates/admin/assets/css/modal.css" rel="stylesheet" />
<!-- METISMENU SCRIPTS -->
    <script src="<%=request.getContextPath() %>/templates/public/js/vendor/jquery.min.js"></script>

<script src="<%=request.getContextPath() %>/templates/admin/assets/js/jquery-2.1.1.min.js"></script>
<script src="<%=request.getContextPath() %>/templates/admin/assets/js/custom.js"></script>
<script src="<%=request.getContextPath() %>/templates/admin/assets/js/jquery.metisMenu.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="<%=request.getContextPath() %>/templates/admin/assets/js/bootstrap.min.js"></script>
<script
	src="<%=request.getContextPath()%>/templates/public/js/jquery.validate.min.js"></script>
<!-- CUSTOM SCRIPTS -->


    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
<%--     <link rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/css/style.css"> --%>
 <script src="<%=request.getContextPath() %>/templates/admin/assets/libary/ckeditor/ckeditor.js"></script>
  <script src="<%=request.getContextPath() %>/templates/admin/assets/libary/ckfinder/ckfinder.js"></script>
  <script
	src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>
	
</head>

<body>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<%=request.getContextPath()%>/admin"><img src="https://img.icons8.com/ios/40/FFFFFF/laptop-coding.png">&ensp; About Me</a>
                
            </div>
            <%
            	String fullname="";
            	int uid=0;
            	if(session.getAttribute("user")!=null){
            		User user = (User) session.getAttribute("user");	
            		fullname = user.getFullname();
            		uid = user.getId();
            	}
            %>
           
            <div style="color: #1d5789;padding: 15px 50px 5px 50px;float: right;font-size: 16px;"> Xin chào, <a href="<%=request.getContextPath()%>/admin/user/edit?id=<%=uid%>"><%=fullname %></a> &nbsp; <a href="<%=request.getContextPath() %>/auth/logout" class="btn btn-danger square-btn-adjust">Đăng xuất</a> </div>
        </nav>
        <!-- /. NAV TOP  -->