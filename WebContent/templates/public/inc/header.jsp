<%@page import="utils.StringUtil"%>
<%@page import="model.NewsCat"%>
<%@page import="java.util.List"%>
<%@page import="dao.NewsCatDAO"%>
<%@page import="dao.NewsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>NVN &mdash; About Me Website</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<link rel="stylesheet"
	href="<%=request.getContextPath()%>/templates/public/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/templates/public/css/animate.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/templates/public/css/flexslider.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/css/main.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/templates/public/fonts/icomoon/style.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/templates/public/css/bootstrap1.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/templates/public/css/style1.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="<%=request.getContextPath() %>/templates/admin/assets/js/jquery.metisMenu.js"></script>

<link
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700"
	rel="stylesheet">
 <script
	src="<%=request.getContextPath()%>/templates/public/js/jquery-2.1.1.min.js"></script>

<script
	src="<%=request.getContextPath()%>/templates/public/js/jquery.validate.min.js"></script>
</head>
<body data-spy="scroll" data-target="#pb-navbar" data-offset="200">
	<div class="navbar navbar-expand-lg site-navbar navbar-light bg-light"
		id="pb-navbar">

		<div class="container">
			

			
			<div class="container main-menu">
					<div class="row align-items-center justify-content-between d-flex">
				         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample09" aria-controls="navbarsExample09" aria-expanded="false" aria-label="Toggle navigation">
          				<span class="navbar-toggler-icon"></span>
        		</button>
				     
				      <a class="navbar-brand" href="<%=request.getContextPath()%>/">NvN</a>
				    <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample09">
				        <ul class="nav-menu">
				          <li><a href="#section-home">Trang chủ</a></li>
				          <li><a href="#section-about">Giới thiệu</a></li>
				          <li><a href="#section-skill">Kỹ năng</a></li>
				            <li><a href="#section-portfolio">Dự án</a></li>
				          <li class="menu-has-children"><a href="">Chặng đường đã qua</a>
				            <ul>
				              <li><a href="#section-resume">Học tập</a></li>
				              <li><a href="#section-resume">Làm Việc</a>
				              	
				              </li>
				            </ul>
				          </li>	
				          
				          <li class="menu-has-children"><a href="#section-blog">Tin Tức</a>
				            <ul>
				            	<%
				            		NewsCatDAO newsCatDAO = new NewsCatDAO();
				            		if(newsCatDAO.getItems()!=null){
				            			List<NewsCat> newCatList = newsCatDAO.getItems2();
				            			if(newCatList.size()>0){
				            				for(NewsCat ncat:newCatList){
													String urlSlug = request.getContextPath()+"/tin-tuc/"+StringUtil.makeSlug(ncat.getName())+"-"+ncat.getId()+".html";
				
				            					%>				            					
				            	
				            	  <li ><a href="<%=urlSlug%>"><%=ncat.getName() %></a>
				            	  		
				            	  			
				            	  			 <%
						            	  			List<NewsCat> newCatChildList = newsCatDAO.getICatChild(ncat.getId());
					            	  				if(newsCatDAO.getICatChild(ncat.getId()).size()>0){
						            	  		%>
				            	  			 <ul class="menu-has-children">
				            	  			 	<%
				            	  			 		for(NewsCat nc2: newCatChildList){
				            	  			 			String urlSlug1 = request.getContextPath()+"/tin-tuc/"+StringUtil.makeSlug(nc2.getName())+"-"+nc2.getId()+".html";
				            	  			 	%>
				            	  			 	<li  ><a href="<%=urlSlug1%>"><%=nc2.getName() %></a>	
						            	  			 		<%
								            	  			List<NewsCat> newCatChildList2 = newsCatDAO.getICatChild(nc2.getId());
							            	  				if(newsCatDAO.getICatChild(nc2.getId()).size()>0){
								            	  		%>
							            	  			 <ul class="menu-has-children">
							            	  			 	<%
							            	  			 		for(NewsCat ncChild2: newCatChildList2){
							            	  			 			String urlSlug2 = request.getContextPath()+"/tin-tuc/"+StringUtil.makeSlug(ncChild2.getName())+"-"+ncChild2.getId()+".html";
							            	  			 	%>
							            	  			 	<li  ><a href="<%=urlSlug2%>"><%=ncChild2.getName() %></a>	
							            	  			 	
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
				          </li>		
				          
				          	 	          					          		          
				          <li><a href="#section-contact">Liên hệ</a></li>
				        </ul>
				        </div>
				        </div>
				    				      		  
					</div>
				</div>
	
		</div> 


