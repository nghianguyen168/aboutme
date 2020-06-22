<%@page import="dao.CommentDAO"%>
<%@page import="dao.RateDAO"%>
<%@page import="model.UserGuest"%>
<%@page import="model.User"%>
<%@page import="utils.StringUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Comment"%>
<%@page import="dao.NewsDAO"%>
<%@page import="model.News"%>
<%@page import="model.NewsCat"%>
<%@page import="java.util.List"%>
<%@page import="dao.NewsCatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/templates/public/blogpost/inc/header.jsp"%>



</div>

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
<!-- /Main Nav -->


</div>
<!-- /Nav -->

<!-- Page Header -->
<div id="post-header" class="page-header">
	<div class="background-img"
		style="background-image: url('<%=request.getContextPath()%>/files/<%=picture%>');"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-10">
				<div class="post-meta">
					<a class="post-category cat-2" href="category.html"><%=cat%></a> <span
						class="post-date"><%=date_create%></span>
				</div>
				<h1><%=name%></h1>
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
			<!-- Post content -->
			<div class="col-md-8">
				<div class="section-row sticky-container">
					<div class="main-post ">
						<%=detail%>
					</div>
					<div class="post-shares sticky-shares">
						<a href="#" class="share-facebook"><i class="fa fa-facebook"></i></a>
						<a href="#" class="share-twitter"><i class="fa fa-twitter"></i></a>
						<a href="#" class="share-google-plus"><i
							class="fa fa-google-plus"></i></a> <a href="#"
							class="share-pinterest"><i class="fa fa-pinterest"></i></a> <a
							href="#" class="share-linkedin"><i class="fa fa-linkedin"></i></a>
						<a href="#"><i class="fa fa-envelope"></i></a>
					</div>
				</div>

				<!-- ad -->

				<!-- ad -->

				<!-- author -->
				<div class="section-row">
					<div class="post-author">
						<div class="media">
							<div class="media-left">
								<img class="media-object"
									src="<%=request.getContextPath()%>/templates/public/blogpost//img/author.png"
									alt="">
							</div>
							<div class="media-body">
								<div class="media-heading">
									<h3 style="margin-top: 20px;"><%=autor%></h3>
								</div>
								<ul class="author-social">
									<li><a href="#"><i class="fa fa-facebook"></i></a></li>
									<li><a href="#"><i class="fa fa-twitter"></i></a></li>
									<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
									<li><a href="#"><i class="fa fa-instagram"></i></a></li>
									<li><div id="fb-root"></div> <script async defer
											crossorigin="anonymous"
											src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v5.0"></script>
										<div class="fb-share-button"
											data-href="<%=request.getContextPath()%>/public/news/detail?id=<%=id%>"
											data-layout="button" data-size="small">
											<a target="_blank"
												href="<%=request.getContextPath()%>/public/news/detail?id=<%=id%>"
												class="fb-xfbml-parse-ignore">Chia sẻ</a>
										</div></li>
								</ul>

							</div>
						</div>
					</div>

				</div>
				
				<div class="section-row">
					<div class="starrating">

						<div class="row">
							<div style="text-align: left; margin-left: 30px;" class="section-title">

								<h2>Đánh giá bài viết</h2>

							</div>

							<div class="col-lg-12">

								<%
									if (isUser == null) {
								%>
								<a  href="<%=request.getContextPath()%>/public/login?id=<%=id%>"
									target="_blank" id="commentform1" class="">
									<span style="margin-left: 70px;" class="fa fa-star-o" data-rating="1"></span>
									 <span 
										class="fa fa-star-o" data-rating="2"></span> <span
										class="fa fa-star-o" data-rating="3"></span> <span
										class="fa fa-star-o" data-rating="4"></span> <span
										class="fa fa-star-o" data-rating="5"></span> <input
										type="hidden" id="rateValue" name="rate" class="rating-value"
										value="0"></a>

								<%
									} else {
								%>
								<div style="margin-left: 70px;" class="star-rating " id="rateform">
									<span class="fa fa-star-o" data-rating="1"></span> <span
										class="fa fa-star-o" data-rating="2"></span> <span
										class="fa fa-star-o" data-rating="3"></span> <span
										class="fa fa-star-o" data-rating="4"></span> <span
										class="fa fa-star-o" data-rating="5"></span> <input
										type="hidden" id="rateValue" name="rate" class="rating-value"
										value="0">
								</div>

								<%
									}
								%>
							<div style="margin-left: 70px;" class="rate_mess">

							

						</div>

							</div>
							<div class="col-md-8">
							<%
								int rate_C=0;
								RateDAO rateDAO = new RateDAO();
								int sumRate =rateDAO.sumRate(id);
								int star1 = rateDAO.sumRate(1,id);
								int star2 = rateDAO.sumRate(2,id);
								int star3 = rateDAO.sumRate(3,id);
								int star4 = rateDAO.sumRate(4,id);
								int star5 = rateDAO.sumRate(5,id);
							
							%>
								<div class="side">
									<div>5 star</div>
								</div>
								<div class="middle">
									<div class="bar-container" id="5wstar">
										<div  class="bar-5" style="width:<%=((float)star5/sumRate)*100%>%; "></div>
									</div>
								</div>
								<div class="side right">
									<div id="5star"><%=star5 %></div>
								</div>
								<div class="side">
									<div>4 star</div>
								</div>
								<div class="middle">
									<div class="bar-container" id="4wstar">
										<div  class="bar-4" style="width: <%=((float)star4/sumRate)*100%>%; "></div>
									</div>
								</div>
								<div class="side right">
									<div id="4star"><%=star4 %></div>
								</div>
								<div class="side">
									<div>3 star</div>
								</div>
								<div class="middle" id="3wstar">
									<div class="bar-container">
										<div class="bar-3" style="width: <%=((float)star3/sumRate)*100%>%; "></div>
									</div>
								</div>
								<div class="side right">
									<div id="3star"><%=star3 %></div>
								</div>
								<div class="side">
									<div>2 star</div>
								</div>
								<div class="middle">
									<div class="bar-container" id="2wstar">
										<div class="bar-2" id="2wstar" style="width: <%=((float)star2/sumRate)*100%>%; "></div>
									</div>
								</div>
								<div class="side right">
									<div id="2star"><%=star2 %></div>
								</div>
								<div class="side">
									<div id="1star">1 star</div>
								</div>
								<div class="middle">
									<div class="bar-container" id="1wstar">
										<div class="bar-1" style="width: <%=((float)star1/sumRate)*100%>%; "></div>
									</div>
								</div>
								<div class="side right">
									<div id="1star"><%=star1 %></div>
								</div>
							</div>
						</div>
							
						<script type="text/javascript">
		
						
											$('#rateform').click(function(){
												
												var rate = 	 $('#rateValue').val();
											
												var news_id = <%=id%>;
												$.ajax({
													url: '<%=request.getContextPath()%>/rate',
	
													type : 'POST',
													cache : false,

													data : {
														//(key , value)
														
														rate : rate,
														news_id : news_id
													},
												success : function(data) {
													console.log(data);
														if(data.trim()=='trung')
														{ 
														swal('SORRY!','Bạn đã đánh giá bài viết này rồi!','error');
														
														
														} else {
															
															swal('THANKS!','Đánh giá bài viết thành công!','success');
															$('#'+rate+'star').text(data); 
														}
														
										},
													
												error : function() {
													alert('Có lỗi xảy ra');
												}
									
													
													
												});
										return false;
									});
				</script>


						<style>
				.star-rating {
					line-height: 32px;
					font-size: 1.25em;
				}
				
				.star-rating .fa-star {
					color: #ffc107;
				}
				</style>
				
						<script type="text/javascript">
				  
				  var $star_rating = $('.star-rating .fa');
				
				  var SetRatingStar = function() {
				    return $star_rating.each(function() {
				      if (parseInt($star_rating.siblings('input.rating-value').val()) >= parseInt($(this).data('rating'))) {
				        return $(this).removeClass('fa-star-o').addClass('fa-star');
				      } else {
				        return $(this).removeClass('fa-star').addClass('fa-star-o');
				      }
				    });
				  };
				
				  $star_rating.on('click', function() {
				    $star_rating.siblings('input.rating-value').val($(this).data('rating'));
				    return SetRatingStar();
				  });
				
				  SetRatingStar();
				  $(document).ready(function() {
				
				  });
				  
				  </script>
					</div>
					<br>
				</div>

				<div class="section-row">

					<div style="text-align: left;" class="section-title">

						<h2>Bình Luận Bài viết</h2>
						<p>Để lại bình luận của bạn tại đây!</p>
					</div>

					<div class="row">


						<div class="col-md-12">
							<div class="form-group" id=contentComment>
								<form id="commentDetail"  >
									<textarea class="input" id="commentContent"
									name="commentContent" placeholder="Nội dung bình luận"
									required></textarea>
								</form>
									<script type="text/javascript">
										$(document).ready(function() {
										
											//Khi bàn phím được nhấn và thả ra thì sẽ chạy phương thức này
											$("#commentDetail").validate({
												rules : {
												
													commentContent : {
														required : true,
													}
												
													
												},
												messages : {
												
													commentContent : {
														required : "Vui lòng nhập bình luận	!",
									
													}
												},
									
											});
									
										});
									</script>
							</div>
							
							<%
								if (isUser != null) {
							%>
							<a href="javascript:void(0)" id="commentform"
								class="primary-button">Gửi</a>

							<%
								} else {
							%>
							<a href="<%=request.getContextPath()%>/public/login?id=<%=id%>"
								target="_blank" id="commentform1" class="primary-button">Gửi</a>

							<%
								}
							%>
						</div>

					</div>


				</div>
				<div class="section-row">
					

					<div class="post-comments">
						<!-- comment -->


						<!-- /comment -->

						<!-- comment -->
						<div class="show-cmt">

							<ul>
								<li></li>
							</ul>

							<div class="row"></div>
						</div>
						<div class="media">
							<%
								SimpleDateFormat formatter = new SimpleDateFormat("dd-M-yyyy hh:mm:ss");
								String time = "";
								int nid = 0;
								List<Comment> commentList = null;
								if (request.getAttribute("commentList") != null) {
									commentList = (List<Comment>) request.getAttribute("commentList");

								}

								int end = 0;
								if (commentList.size() >= 5) {
									end = 5;
								} else {
									end = commentList.size();
								}

								for (int i=0;i<commentList.size();i++) {
							%>

							<div id="cmt-<%=commentList.get(i).getId()%>" onchange="return openForm==(<%=commentList.get(i).getId()%>)">
								<div class="media-left">
									<img class="media-object"
										src="<%=request.getContextPath()%>/templates/public/blogpost//img/avatar.png"
										alt="">
								</div>
								<div class="media-body">
									<div class="media-heading">
										<h4><%=commentList.get(i).getName()%></h4>
										<span class="time"><%=formatter.format(commentList.get(i).getTime())%></span>
										<a href="javascript:void(0)"
											
											onclick="openForm(<%=commentList.get(i).getId()%>)" class="reply">Trả lời</a>
									</div>

									<p><%=commentList.get(i).getComment()%></p>
										<div id="show-rep-cmt-<%=commentList.get(i).getId()%>">

											
												<%
													CommentDAO commentDAO = new CommentDAO();
													List<Comment> commentChildList = commentDAO.getCommentChild(commentList.get(i).getId());
													if(commentChildList.size()>0){
														for(Comment comChild : commentChildList){
															
													
												%>
													<div >
														<div class="media-left">
														<img  class="media-object"
															src="<%=request.getContextPath()%>/templates/public/blogpost//img/avatar.png"
															alt="">
															</div>
															<div class="media-body">
																<div class="media-heading">
																	<h4><%=comChild.getName()%></h4>
																	<span class="time"><%=formatter.format(comChild.getTime())%></span>
																	
															</div>
													
		
															<p><%=comChild.getComment()%></p>
														</div>
														
														
													
														
													</div>
												
												
												<%
														}
													}
												%>
												
													<ul>
													<li></li>
												</ul>
			
										<div class="row"></div>
						</div>
								</div>
								<div class="col-md-12 replycomment"
									id="replycomment<%=commentList.get(i).getId()%>" style="margin-left: 60px;">

									<div class="form-group">
										<form id="repcommentDetail-<%=commentList.get(i).getId() %>"  >
											<textarea class="input" id="repcommentContent-<%=commentList.get(i).getId() %>"
											name="repcommentContent" placeholder="Nội dung bình luận"
											required></textarea>
										</form>
								</div>
									<%
										if (isUser != null) {
									%>
									<a href="javascript:void(0)" id="repcommentform-<%=commentList.get(i).getId() %>"
										class="primary-button">Gửi</a> 
									<%
										} else {
									%>
										<a href="<%=request.getContextPath()%>/public/login?id=<%=id%>" 
										class="primary-button">Gửi</a> 
										<%
										}
										%>
										<a
										style="background-color: #F44337;"
										onclick="closeForm(<%=commentList.get(i).getId()%>)"
										href="javascript:void(0)" id="commentform"
										class="primary-button">Đóng</a>
								</div>
								<script type="text/javascript">
		
										
											$('#repcommentform-<%=commentList.get(i).getId()%>').click(function(){
												
												var comment = 	 $('#repcommentContent-<%=commentList.get(i).getId()%>').val();
												var news_id = <%=id%>;
												var parent_id = <%=commentList.get(i).getId()%>
												$.ajax({
													url: '<%=request.getContextPath()%>/comment',

													type : 'POST',
													cache : false,

													data : {
														//(key , value)
														
														comment : comment,
														news_id : news_id,
														parent_id : parent_id
													},

													success : function(data) {
														console.log(data);
														$(
																'#show-rep-cmt-<%=commentList.get(i) 	.getId()%> ul li:eq(0)')
																.before(data);
														
														  $('.input').val('');
														
													},
													error : function() {
														alert('Có lỗi xảy ra');
													}
												});
										return false;
									});
				</script>
							
							</div>



							<%
								}
							%>
								<script>
								
									
										function openForm(id) {
											  document.getElementById("replycomment"+id).style.display = "block";
											}
										function closeForm(id) {
											  document.getElementById("replycomment"+id).style.display = "none";
											}
								
								</script>
							<div class="row more_comment">

								<div></div>
								<input type="number" style="display: none;" id="batdau"
									value="5"> <input type="number" style="display: none;"
									id="ketthuc" value="20">

							</div>


							<div class="phantrang" style="margin-top: 60px;">
								<%
									if (commentList.size() > 5) {
								%>
								<a
									style="background-color: #5dbe5c; border-color: #5dbe5c; margin-left: 30%;"
									href="#" id="loadMore" class="btn btn-primary  px-4 py-3">Xem
									thêm</a>

								<%
									}
								%>
							</div>
							<script type="text/javascript">
		
										
											$('#loadMore').click(function(offset){
												 let start=Number($('#batdau').val());
												 let end=start+5;
												 let nid=<%=id%>;
												 
												$.ajax({
													url: '<%=request.getContextPath()%>/comment/phantrang',

															type : 'POST',
															cache : false,

															data : {
																//(key , value)
																start : start,
																end : end,
																nid : nid
															},

															success : function(
																	data) {
																console
																		.log(data);
																$(
																		'.more_comment div:eq(-1)')
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




						<!-- /comment -->
					</div>
				</div>

				<!-- /reply -->
			</div>


			<!-- /Post content -->
			
			<script type="text/javascript">
		
										
											$('#commentform').click(function(){
												
												var comment = 	 $('#commentContent').val();
												var news_id = <%=id%>;
												$.ajax({
													url: '<%=request.getContextPath()%>/comment',

													type : 'POST',
													cache : false,

													data : {
														//(key , value)
														
														comment : comment,
														news_id : news_id
													},

													success : function(data) {
														console.log(data);
														$(
																'.show-cmt ul li:eq(0)')
																.before(data);
														
														  $('.input').val('');
														
													},
													error : function() {
														alert('Có lỗi xảy ra');
													}
												});
										return false;
									});
				</script>
			<!-- aside -->
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
						if (request.getAttribute("newsListRelated") != null) {
							List<News> newsListRelated = (List<News>) request.getAttribute("newsListRelated");
							if (newsListRelated.size() > 0) {
								for (News newsLT : newsListRelated) {
									String urlSlugCat = request.getContextPath() + "/tin-tuc/"
											+ StringUtil.makeSlug(newsCatDAO.getItem(newsLT.getCat_id()).getName()) + "-"
											+ newsCatDAO.getItem(newsLT.getCat_id()).getId() + ".html";
									String urlSlug = request.getContextPath() + "/" + StringUtil.makeSlug(newsLT.getName()) + "-"
											+ newsLT.getId() + ".html";
					%>
					<div class="post post-widget">
						<a class="post-img"
							href="<%=request.getContextPath()%>/public/news/detail?id=<%=newsLT.getId()%>">
							<img
							src="<%=request.getContextPath()%>/files/<%=newsLT.getPicture()%>"
							alt="">
						</a>
						<div class="post-body">
							<h3 class="post-title">
								<a href="<%=urlSlug%>"><%=newsLT.getName()%></a>
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

				<!-- post widget -->
				<div class="aside-widget">
					<div class="section-title">
						<h2>Bài viết phổ biến</h2>
					</div>
					<%
						if (request.getAttribute("newsListMost") != null) {
							List<News> newsListMost = (List<News>) request.getAttribute("newsListMost");
							if (newsListMost.size() > 0) {
								for (News newsM : newsListMost) {
									String urlSlugCat = request.getContextPath() + "/tin-tuc/"
											+ StringUtil.makeSlug(newsCatDAO.getItem(newsM.getCat_id()).getName()) + "-"
											+ newsCatDAO.getItem(newsM.getCat_id()).getId() + ".html";
									String urlSlug = request.getContextPath() + "/" + StringUtil.makeSlug(newsM.getName()) + "-"
											+ newsM.getId() + ".html";
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
								<a href="<%=urlSlug%>"><%=newsM.getName()%></a>
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

				<!-- /catagories -->

				<!-- tags -->

				<!-- /tags -->


			</div>
			<!-- /aside -->
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


<!-- Load Facebook SDK for JavaScript -->
     
</body>
</html>
