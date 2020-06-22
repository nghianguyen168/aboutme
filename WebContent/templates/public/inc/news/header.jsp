<%@page import="model.News"%>
<%@page import="model.NewsCat"%>
<%@page import="java.util.List"%>
<%@page import="dao.NewsCatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>WebMag HTML Template</title>

		<!-- Google font -->
		<link href="https://fonts.googleapis.com/css?family=Nunito+Sans:700%7CNunito:300,600" rel="stylesheet"> 

		<!-- Bootstrap -->
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/blogpost/css/bootstrap.min.css"/>

		<!-- Font Awesome Icon -->
		<link rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/blogpost/css/font-awesome.min.css">

		<!-- Custom stlylesheet -->
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/blogpost/css/style.css"/>
		<script src="<%=request.getContextPath() %>/templates/admin/assets/js/jquery-2.1.1.min.js"></script>

		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

    </head>
	<body>
		
		<!-- Header -->
		<header id="header">
			<!-- Nav -->
			<div id="nav">
				<!-- Main Nav -->
				<div id="nav-fixed">
					<div class="container">
						<!-- logo -->
						<div class="nav-logo">
							<a class="navbar-brand" href="<%=request.getContextPath()%>/index">AboutMe</a>
						</div>
						<!-- /logo -->

						<!-- nav -->
						<ul class="nav-menu nav navbar-nav">
							
							<%
								NewsCatDAO newsCatDAO = new NewsCatDAO();
								if(newsCatDAO.getItems()!=null){
								List<NewsCat> newsCatList = newsCatDAO.getItems();
								if(newsCatList.size()>0){
									for(NewsCat nc:newsCatList){
									
							%>
							<li class="cat-<%=nc.getId()%>"><a href="<%=request.getContextPath()%>/public/news/cat?id=<%=nc.getId()%>"><%=nc.getName() %></a></li>
							<%
									}
								}
							}
							%>
						</ul>
						<!-- /nav -->

						<!-- search & aside toggle -->
						<div class="nav-btns">
							<!-- <button class="aside-btn"><i class="fa fa-bars"></i></button> -->
							<button class="search-btn"><i class="fa fa-search"></i></button>
							<div class="search-form">
								<input class="search-input" type="text" name="search" placeholder="Tìm kiếm tin tức">
								<button class="search-close"><i class="fa fa-times"></i></button>
							</div>
						</div>
						<!-- /search & aside toggle -->
					</div>
				</div>