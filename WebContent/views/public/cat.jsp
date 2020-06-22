<%@page import="utils.StringUtil"%>
<%@page import="dao.NewsDAO"%>
<%@page import="model.News"%>
<%@page import="model.NewsCat"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dao.NewsCatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/templates/public/blogpost/inc/header.jsp"%>
					<!-- search & aside toggle -->
					
					<div class="nav-btns">
						<!-- <button class="aside-btn"><i class="fa fa-bars"></i></button> -->
						<button class="search-btn">
							<i class="fa fa-search"></i>
						</button>
						<div class="search-form">
							<input class="search-input" type="text" name="search"
								placeholder="Tìm kiếm tin tức">
							<button class="search-close">
								<i class="fa fa-times"></i>
							</button>
						</div>
					</div>
					<!-- /search & aside toggle -->
				</div>
			</div>
				<!-- Header -->
	
		
				          
			

			<!-- Aside Nav -->

			<!-- Aside Nav -->
		
		<!-- /Nav --!>
		
		<!-- Page Header -->
		<div class="page-header">
			<div class="container">
				<%
				   SimpleDateFormat formatter = new SimpleDateFormat("dd-M-yyyy hh:mm:ss");
					List<News> newsListByCat = null;
					if (request.getAttribute("newsListByCat") != null) {
						newsListByCat = (List<News>) request.getAttribute("newsListByCat");
					}
				%>
				<div class="row">
					<div class="col-md-10">
						<%
							int cid=0;
							if (newsListByCat.size() > 0) {
								cid = newsListByCat.get(0).getCat_id();
						%>
						<ul style="padding-top: 20px;" class="page-header-breadcrumb">
							<li><a href="javascript:void(0)">Home</a></li>

							<li><%=newsListByCat.get(0).getCat()%></li>
						</ul>
						<h1><%=newsListByCat.get(0).getCat()%></h1>
						<%
							}
						%>
					</div>
				</div>
			</div>
		</div>
		<!-- /Page Header -->

	<!-- /Header -->

	<!-- section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-8">
					<div class="row">
						<!-- post -->
						<%
							if (newsListByCat.size() > 0) {
								
								String urlSlug = request.getContextPath()+"/"+StringUtil.makeSlug(newsListByCat.get(0).getName())+"-"+newsListByCat.get(0).getId()+".html";
								String urlSlugCat = request.getContextPath()+"/tin-tuc/"+StringUtil.makeSlug(newsCatDAO.getItem(newsListByCat.get(0).getCat_id()).getName())+"-"+newsCatDAO.getItem(newsListByCat.get(0).getCat_id()).getId()+".html";
						%>
						<div class="col-md-12">
							<div class="post post-thumb">
								<a class="post-img"
									href="<%=urlSlug%>"><img
									src="<%=request.getContextPath()%>/files/<%=newsListByCat.get(0).getPicture()%>"
									alt=""></a>
								<div class="post-body">
									<div class="post-meta">
										<a class="post-category cat-2"
											href="<%=urlSlugCat%>"><%=newsListByCat.get(0).getCat()%></a>
										<span class="post-date"><%=newsListByCat.get(0).getDate_create()%></span>
									</div>
									<h3 class="post-title">
										<a
											href="<%=urlSlug%>"><%=newsListByCat.get(0).getName()%></a>
									</h3>
								</div>
							</div>
						</div>

						<%
							}
						%>
						<%-- <!-- /post -->
						<%
							if (newsListByCat.size() >1 && newsListByCat.size()<3) {
								for (int i = 1; i < 3; i++) {
									String urlSlugCat = request.getContextPath()+"/tin-tuc/"+StringUtil.makeSlug(newsCatDAO.getItem(newsListByCat.get(i).getCat_id()).getName())+"-"+newsCatDAO.getItem(newsListByCat.get(i).getCat_id()).getId()+".html";
									String urlSlug = request.getContextPath()+"/"+StringUtil.makeSlug(newsListByCat.get(i).getName())+"-"+newsListByCat.get(i).getId()+".html";
						%>
						<!-- post -->
						<div class="col-md-6">
							<div class="post">
								<a class="post-img"
									href="<%=urlSlug%>"><img
									src="<%=request.getContextPath()%>/files/<%=newsListByCat.get(i).getPicture()%>"
									alt=""></a>
								<div class="post-body">
									<div class="post-meta">
										<a class="post-category cat-2"
											href="<%=urlSlugCat%>"><%=newsListByCat.get(i).getCat()%></a>
										<span class="post-date"><%=newsListByCat.get(i).getDate_create()%></span>
									</div>
									<h3 class="post-title">
										<a
											href="<%=urlSlug%>"><%=newsListByCat.get(i).getName()%></a>
									</h3>
								</div>
							</div>
						</div>
						<!-- /post -->

						<%
							}
							}
						%> --%>

						<div class="clearfix visible-md visible-lg"></div>

						<!-- ad -->

						<!-- ad -->

						<!-- post -->
						<%
							if (newsListByCat.size()>1) {
								for (int i = 1; i <=5; i++) {
									String urlSlugCat = request.getContextPath()+"/tin-tuc/"+StringUtil.makeSlug(newsCatDAO.getItem(newsListByCat.get(i).getCat_id()).getName())+"-"+newsCatDAO.getItem(newsListByCat.get(i).getCat_id()).getId()+".html";
									String urlSlug = request.getContextPath()+"/"+StringUtil.makeSlug(newsListByCat.get(i).getName())+"-"+newsListByCat.get(i).getId()+".html";
						%>
						<div class="col-md-12">
							<div class="post post-row">
								<a class="post-img"
									href="<%=urlSlug%>"><img
									src="<%=request.getContextPath()%>/files/<%=newsListByCat.get(i).getPicture()%>"
									alt=""></a>
								<div class="post-body">
									<div class="post-meta">
										<a class="post-category cat-2"
											href="<%=urlSlugCat%>"><%=newsListByCat.get(i).getCat()%></a>
										<span class="post-date"><%=newsListByCat.get(i).getDate_create()%></span>
									</div>
									<h3 class="post-title">
										<a
											href="<%=urlSlug%>"><%=newsListByCat.get(i).getName()%></a>
									</h3>
									<p><%=newsListByCat.get(i).getDescription()%></p>
								</div>
							</div>
						</div>
						
						
						
						<%
							} }
							
						%>
						
						<!-- /post -->

						
						<div class="col-md-12 more_cat">

							<div></div>
							<input type="number" style="display: none;" id="batdau" value="6">
							<input type="number" style="display: none;" id="ketthuc"
								value="10">

						</div>

						<!-- /post -->

						<div class="phantrang">
							<a style="background-color: #5dbe5c; border-color: #5dbe5c; margin-left: 30%;" href="#" id="loadMore" class="btn btn-primary  px-4 py-3">Xem
								thêm</a>

							
						</div>
					

						<script type="text/javascript">
		
										
											$('#loadMore').click(function(offset){
												 let start=Number($('#batdau').val());
												 let end=start+4;
												 let cid=<%=cid%>
												 <%%>
												$.ajax({
													url: '<%=request.getContextPath()%>/cat/phantrang',

															type : 'POST',
															cache : false,

															data : {
																//(key , value)
																start : start,
																end : end,
																cid : cid
															},

															success : function(
																	data) {
																console
																		.log(data);
																$(
																		'.more_cat div:eq(-1)')
																		.before(
																				data);

																$('#batdau')
																		.val(
																				end);

															},
															error : function() {
																alert('Có lỗi xảy ra');
															}
														});
												return false;
											});
						</script>
					</div>
				</div>

				<div class="col-md-4">


					<div class="aside-widget">
						<div class="section-title">
							<h2>Bài viết phổ biến</h2>
						</div>
						<%
							NewsDAO newsDAO = new NewsDAO();
							if (newsDAO.getListMostViews() != null) {
								List<News> newsListMost = newsDAO.getListMostViews();
								if (newsListMost.size() > 0) {
									for (News newsM : newsListMost) {
										String urlSlugCat = request.getContextPath()+"/tin-tuc/"+StringUtil.makeSlug(newsCatDAO.getItem(newsM.getCat_id()).getName())+"-"+newsCatDAO.getItem(newsM.getCat_id()).getId()+".html";
										String urlSlug = request.getContextPath()+"/"+StringUtil.makeSlug(newsM.getName())+"-"+newsM.getId()+".html";
						%>
						<div class="post post-thumb">
							<a class="post-img" href="blog-post.html"> <img
								src="<%=request.getContextPath()%>/files/<%=newsM.getPicture()%>"
								alt=""></a>
							<div class="post-body">
								<div class="post-meta">
									<a class="post-category cat-3" href="<%=urlSlugCat%>"><%=newsM.getCat()%></a>
									<span class="post-date"><%=newsM.getDate_create()%></span>
								</div>
								<h3 class="post-title">
									<a
										href="<%=urlSlug%>"><%=newsM.getName()%></a>
								</h3>
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





				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
		<div class="loader-wrapper">
		<span class="loader"><span class="loader-inner"></span></span>
		</div>
		<style>
				
			.loader {
  display: inline-block;
  width: 30px;
  height: 30px;
  position: relative;
  border: 4px solid #Fff;
  animation: loader 2s infinite ease;
}

.loader-inner {
  vertical-align: top;
  display: inline-block;
  width: 100%;
  height:100%;
  background-color: #fff;
  animation: loader-inner 2s infinite ease-in;
}
.loader-wrapper{
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0;
	left: 0;
	background-color: #242f3f;
	display: flex;
	justify-content: center;
	align-items: center;
}
@keyframes loader {
  0% {
    transform: rotate(0deg);
  }
  
  25% {
    transform: rotate(180deg);
  }
  
  50% {
    transform: rotate(180deg);
  }
  
  75% {
    transform: rotate(360deg);
  }
  
  100% {
    transform: rotate(360deg);
  }
}

@keyframes loader-inner {
  0% {
    height: 0%;
  }
  
  25% {
    height: 0%;
  }
  
  50% {
    height: 100%;
  }
  
  75% {
    height: 100%;
  }
  
  100% {
    height: 0%;
  }
}
		</style>
		<script type="text/javascript">
	$(window).on("load",function(){
	    $(".loader-wrapper").fadeOut("slow");
	});
</script>
	</div>
	
	
	<!-- /section -->

	<!-- Footer -->
	<%@ include file="/templates/public/inc/footer.jsp"%>
	<!-- /Footer -->

	<!-- jQuery Plugins -->
	<%-- <script
		src="<%=request.getContextPath()%>/templates/public/blogpost/js/jquery.min.js"></script> --%>
	<script
		src="<%=request.getContextPath()%>/templates/public/blogpost/js/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/templates/public/blogpost/js/main.js"></script>
	



</body>
</html>
