<%@page import="model.News"%>
<%@page import="model.UserGuest"%>
<%@page import="utils.StringUtil"%>
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

<title>NVN-About Me</title>

<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700"
	rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/templates/public/blogpost/css/bootstrap.min.css" />
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/public/rate/style.css">

<!-- Font Awesome Icon -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/templates/public/blogpost/css/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/templates/public/blogpost/css/style2.css" />
	<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/templates/public/blogpost/css/rate.css" />
	<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/templates/public/blogpost/css/main1.css" />
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/templates/public/css/popup_login.css" />
<script
	src="<%=request.getContextPath()%>/templates/admin/assets/js/jquery-2.1.1.min.js"></script>

<script
	src="<%=request.getContextPath()%>/templates/public/js/jquery.validate.min.js"></script>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/templates/public/css/animate.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/templates/public/css/flexslider.css">



	





<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

</head>
<body>


			<!-- Main Nav -->
			<div id=" nav nav-fixed" style="height: 110px;">
				<div class="container"style="height: 110px;" >
					<!-- logo -->
					
					<!-- /logo -->

					<!-- nav -->
					<div  class="collapse navbar-collapse justify-content-md-center" id="navbarsExample09">
					  <a style="border: solid 2px gray;" class="navbar-brand" href="<%=request.getContextPath()%>/index">NVN</a>
				    <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample09">
				        <ul class="nav-menu  ">
				        
				         
				          
				        
				          
				      	<%
				      		
				            		NewsCatDAO newsCatDAO = new NewsCatDAO();
				            		if(newsCatDAO.getItems2()!=null){
				            			List<NewsCat> newCatList1 = newsCatDAO.getItems2();
				            			if(newCatList1.size()>0){
				            				for(NewsCat ncat1:newCatList1){
													String urlSlug = request.getContextPath()+"/tin-tuc/"+StringUtil.makeSlug(ncat1.getName())+"-"+ncat1.getId()+".html";
				
				            					%>		
				            	
				            	<li class="cat-<%=ncat1.getId()%>"><a
								href="<%=urlSlug%>"><%=ncat1.getName()%></a>
				            	  			<%-- <%
				            	  			List<NewsCat> newCatChildList = newsCatDAO.getICatChild(ncat.getParent_id());
			            	  				if(newsCatDAO.getICatChild(ncat.getParent_id()).size()>0){
				            	  			%>
				            	  			<ul class="dropdown-menu dropdown-menu-right">
				            	  			<%
				            	  			
				            	  				
				            	  				for(NewsCat ncatChild : newCatChildList){
				            	  			%>
				            	  				<li  class="menu-has-children"><a href="<%=urlSlug%>"><%=ncatChild.getName() %></a></li>
				            	  				
				            	  			<%
				            	  				}}
				            	  			%>
				            	  			
				            	  			</ul>
				            	  			 --%>
				            	  			 <%
						            	  			List<NewsCat> newCatChildList = newsCatDAO.getICatChild(ncat1.getId());
					            	  				if(newsCatDAO.getICatChild(ncat1.getId()).size()>0){
					            	  					
						            	  		%>
				            	  			 <ul class="">
				            	  			 	<%
				            	  			 		for(NewsCat nc2: newCatChildList){
				            	  			 			String urlSlug2 = request.getContextPath()+"/tin-tuc/"+StringUtil.makeSlug(nc2.getName())+"-"+nc2.getId()+".html";
				            	  			 	%>
				            	  			 	<li  ><a href="<%=urlSlug2%>"><%=nc2.getName() %></a>	
						            	  			 		<%
								            	  			List<NewsCat> newCatChildList2 = newsCatDAO.getICatChild(nc2.getId());
							            	  				if(newsCatDAO.getICatChild(nc2.getId()).size()>0){
								            	  		%>
							            	  			 <ul class="menu-has-children">
							            	  			 	<%
							            	  			 		for(NewsCat ncChild2: newCatChildList2){
							            	  			 			String urlSlug3 = request.getContextPath()+"/tin-tuc/"+StringUtil.makeSlug(ncChild2.getName())+"-"+ncChild2.getId()+".html";
							            	  			 	%>
							            	  			 	<li  ><a href="<%=urlSlug3%>"><%=ncChild2.getName()%></a>	
							            	  			 	
							            	  			 	<%
							            	  			 		}
							            	  			 	%>
							            	  			 </ul>
							            	  			 
							            	  			<%
								            	  				}
							            	  			 %>
				            	  			 	</li>
				            	  			 	
				            	  			 	<%
				            	  			 		}
				            	  			 	%>
				            	  			 </ul>
				            	  			 
				            	  			<%
					            	  				}
				            	  			 %>
				            	  			
						          <%
				            				}
				            				}
				            			}
				            		
						          %>
						          </li>
				            </ul>
				            
				           	<%
						int id = 0;
						String name = "";
						String picture = "";
						String date_create = "";
						String description = "";
						String detail = "";
						String autor = "";
						String cat = "";
						if (request.getAttribute("news") != null) {
							
							News news = (News) request.getAttribute("news");
							id = news.getId();
							name = news.getName();
							picture = news.getPicture();
							date_create = news.getDate_create();
							description = news.getDescription();
							detail = news.getDetail();
							autor = news.getAuthor();
							cat = news.getCat();
						}
					%>
				          
				          <%
						UserGuest isUser = (UserGuest) session.getAttribute("userGuest");
						String fullname = "";
						if (isUser != null) {
							fullname = isUser.getFullname();
					%>
					<div
						style="color: #1d5789; padding: 15px 50px 5px 50px; float: right; font-size: 16px;">
						Xin chào, <b><%=fullname%></b> &nbsp; <a
							href="<%=request.getContextPath()%>/public/logout?id=<%=id%>"
							class="btn btn-danger square-btn-adjust">Đăng xuất</a>
					</div>
					<%
						} else {
					%>
					
						<div
						style="color: #1d5789; margin-top:15px; padding: 5px 50px 5px 50px; float: right; font-size: 16px;">
						<a
							href="<%=request.getContextPath()%>/public/login?id=<%=id %>"
							class="btn btn-success" square-btn-adjust">Đăng nhập/Đăng ký</a>
					</div>

					
					
			

					<%
						}
					%>
				          
				          	 	          					          		          
				       
				       
				        </div>
				        
				          
				          