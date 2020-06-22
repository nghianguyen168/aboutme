<%@page import="dao.NewsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.News"%>
<%@page import="java.util.List"%>
<div class="col-md-4">
						<!-- ad -->
						<%-- <div class="aside-widget text-center">
							<a href="#" style="display: inline-block;margin: auto;">
								<img class="img-responsive" src="<%=request.getContextPath() %>/templates/public/blogpost//img/ad-1.jpg" alt="">
							</a>
						</div> --%>
						<!-- /ad -->

						<!-- post widget -->
						<div class="aside-widget">
							<div class="section-title">
								<h2>Bài viết liên quan</h2>
							</div>
						<%
							NewsDAO newsDAO = new NewsDAO();
							int id =  Integer.parseInt(request.getParameter("id"));
							int cat_id = Integer.parseInt(request.getParameter("cat_id"));

							if(newsDAO.getListRelated(id, cat_id)!=null){
								List<News> newsListRelated = newsDAO.getListRelated(id, cat_id);
								if(newsListRelated.size()>0){
									for(News newsLT:newsListRelated){
								
						%>
							<div class="post post-widget">
								<a class="post-img" href="<%=request.getContextPath()%>/public/news/detail?id=<%=newsLT.getId()%>">
								<img src="<%=request.getContextPath() %>/files/<%=newsLT.getPicture() %>" alt=""></a>
								<div class="post-body">
									<h3 class="post-title"><a href="<%=request.getContextPath()%>/public/news/detail?id=<%=newsLT.getId()%>"><%=newsLT.getName() %></a></h3>
								</div>
							</div>

							<%
							
									}
								}
							}
							%>
						</div>
						<!-- /post widget -->

						<!-- post widget -->
						<div class="aside-widget">
							<div class="section-title">
								<h2>Bài viết phổ biến</h2>
							</div>
							<%
								if(request.getAttribute("newsListMost")!=null){
									List<News> newsListMost = (List<News>) request.getAttribute("newsListMost");
									if(newsListMost.size()>0){
										for(News newsM:newsListMost){
											
									
							%>
							<div class="post post-thumb">
								<a class="post-img" href="blog-post.html">
								<img src="<%=request.getContextPath() %>/files/<%=newsM.getPicture() %>" alt=""></a>
								<div class="post-body">
									<div class="post-meta">
										<a class="post-category cat-3" href="#"><%=newsM.getCat() %></a>
										<span class="post-date"><%=newsM.getDate_create() %></span>
									</div>
									<h3 class="post-title"><a href="<%=request.getContextPath()%>/public/news/detail?id=<%=newsM.getId()%>"><%=newsM.getName() %></a></h3>
								</div>
							</div>
						<%
						
										}
									}
								}
						%>
							
						</div>
						<!-- /post widget -->
						
						<!-- catagories -->
						<div class="aside-widget">
							<div class="section-title">
								<h2>Catagories</h2>
							</div>
							<div class="category-widget">
								<ul>
									<li><a href="#" class="cat-1">Web Design<span>340</span></a></li>
									<li><a href="#" class="cat-2">JavaScript<span>74</span></a></li>
									<li><a href="#" class="cat-4">JQuery<span>41</span></a></li>
									<li><a href="#" class="cat-3">CSS<span>35</span></a></li>
								</ul>
							</div>
						</div>
						<!-- /catagories -->
						
						<!-- tags -->
						<div class="aside-widget">
							<div class="tags-widget">
								<ul>
									<li><a href="#">Chrome</a></li>
									<li><a href="#">CSS</a></li>
									<li><a href="#">Tutorial</a></li>
									<li><a href="#">Backend</a></li>
									<li><a href="#">JQuery</a></li>
									<li><a href="#">Design</a></li>
									<li><a href="#">Development</a></li>
									<li><a href="#">JavaScript</a></li>
									<li><a href="#">Website</a></li>
								</ul>
							</div>
						</div>
						<!-- /tags -->
						
						<!-- archive -->
						<div class="aside-widget">
							<div class="section-title">
								<h2>Archive</h2>
							</div>
							<div class="archive-widget">
								<ul>
									<li><a href="#">January 2018</a></li>
									<li><a href="#">Febuary 2018</a></li>
									<li><a href="#">March 2018</a></li>
								</ul>
							</div>
						</div>
						<!-- /archive -->
					</div>