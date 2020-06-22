<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<nav class="navbar-default navbar-side" role="navigation">
	<div class="sidebar-collapse">
		<ul class="nav" id="main-menu">
			<li class=""><img
				src="<%=request.getContextPath()%>/templates/admin/assets/img/toi.jpg"
				style="border-radius: 80%; height: 150px; -moz-border-radius: 75px; -webkit-border-radius: 75px; width: 150px;"
				alt=avartar " class="user-image img-responsive" /></li>

			<li><a id="index" href="<%=request.getContextPath()%>/admin"><i
					class="fa fa-3x"></i><img
					src="https://img.icons8.com/material-sharp/30/FFFFFF/home.png">&nbsp;&nbsp;Trang
					chủ</a></li>
			<li><a id="info"
				href="<%=request.getContextPath()%>/admin/info/index"><i
					class="fa  fa-3x"></i><img
					src="https://img.icons8.com/material-sharp/30/FFFFFF/info.png">&nbsp;&nbsp;Quản
					lý thông tin</a></li>
					
			<%
			User user=null;
        	if(session.getAttribute("user")!=null){
        	user = (User) session.getAttribute("user");	
        	}
        	if("Admin".equals(user.getRole_name())){
			%>
			<li><a id="skill"
				href="<%=request.getContextPath()%>/admin/skill/index"><i
					class="fa  fa-3x"></i><img
					src="https://img.icons8.com/pastel-glyph/30/FFFFFF/person-male.png">
					&nbsp;Quản lý kỹ năng</a></li>
					<%
        	}
					%>
					
					
				<%
				if("Admin".equals(user.getRole_name())){
					%>
			
			<li class="resume" style="margin-left: 10px;"><a id="resume"
				href=""><img
					src="https://img.icons8.com/dotty/30/FFFFFF/activity-history.png">&nbsp;&nbsp;Chặng
					đường đã qua</a>
					
				<ul class="nav child_menu">
					<li class="m-top"><a
						href="<%=request.getContextPath()%>/admin/edu/index"> <i
							class=""></i><img
							src="https://img.icons8.com/ios/30/FFFFFF/education.png">&nbsp;&nbsp;Học
							tập
					</a> <a href="<%=request.getContextPath()%>/admin/work/index"> <i
							class=""></i><img
							src="https://img.icons8.com/ios/30/FFFFFF/new-job.png">&nbsp;&nbsp;Làm
							việc
					</a></li>
				</ul></li>
				<%
				}
					%>
				<%
				if("Admin".equals(user.getRole_name())){
					%>
		
			<li><a id="project"
				href="<%=request.getContextPath()%>/admin/project/index"><i
					class="fa  fa-3x"></i><img
					src="https://img.icons8.com/ios-filled/30/FFFFFF/book.png">&nbsp;&nbsp;
					Quản lý dự án</a></li>
					<%
					
					}%>
					<%
					if("Admin".equals(user.getRole_name()) || "maneger".equals(user.getRole_name())){
						%>
				
					
			<li class="news" style="margin-left: 10px;"><a id="news"
				href=""><img
					src="https://img.icons8.com/material-sharp/30/FFFFFF/news.png">&nbsp;&nbsp;Quản lý tin tức</a>
				<ul class="nav child_menu">
					<li class="m-top"><a
						href="<%=request.getContextPath()%>/admin/news/cat"> <i
							class=""></i><img src="https://img.icons8.com/material-rounded/30/FFFFFF/circled.png">&nbsp;&nbsp;Danh mục
					</a> <a href="<%=request.getContextPath()%>/admin/news/index"> <i
							class=""></i><img src="https://img.icons8.com/material-rounded/30/FFFFFF/circled.png">&nbsp;&nbsp;Tin Tức
					</a>
					<a href="<%=request.getContextPath()%>/admin/news/comment"> <i
							class=""></i><img src="https://img.icons8.com/material-rounded/30/FFFFFF/circled.png">&nbsp;&nbsp;Bình luận
					</a>
					</li>
				</ul></li>
				<%
					}
				%>
				
			<li><a id="contact"
				href="<%=request.getContextPath()%>/admin/contact/index"><i
					class="fa  fa-3x"></i> <img
					src="https://img.icons8.com/android/30/FFFFFF/contact-card.png">&nbsp;&nbsp;Quản
					lý liên hệ</a></li>
			<li><a id="banner"
				href="<%=request.getContextPath()%>/admin/home/index"><i
					class="fa  fa-3x"></i> <img
					src="https://img.icons8.com/material-rounded/30/FFFFFF/new-slide.png">&nbsp;&nbsp;Quản
					lý Banner</a></li>
			<li><a id="admin"
				href="<%=request.getContextPath()%>/admin/user/index"><i
					class="fa  fa-3x"></i> <img src="https://img.icons8.com/material-sharp/30/FFFFFF/user.png">&nbsp;&nbsp;Quản
					trị viên</a></li>
			<li><a id="guest"
				href="<%=request.getContextPath()%>/admin/guest/index"><i
					class="fa  fa-3x"></i> <img src="https://img.icons8.com/material-sharp/30/FFFFFF/user.png">&nbsp;&nbsp;Quản
					lý người dùng</a></li>
			
		</ul>
	</div>
</nav>
<!-- /. NAV SIDE  -->