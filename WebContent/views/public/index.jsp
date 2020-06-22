
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.CommentDAO"%>
<%@page import="model.News"%>
<%@page import="model.NewsCat"%>
<%@page import="dao.NewsCatDAO"%>
<%@page import="dao.NewsDAO"%>
<%@page import="model.Home"%>
<%@page import="dao.HomeDAO"%>
<%@page import="constant.CommonConstant"%>
<%@page import="model.Project"%>
<%@page import="dao.ProjectDAO"%>
<%@page import="model.Work"%>
<%@page import="dao.WorkDAO"%>
<%@page import="model.Education"%>
<%@page import="dao.EducationDAO"%>
<%@page import="model.ProjectCat"%>
<%@page import="dao.ProjectCatDAO"%>
<%@page import="model.Skill"%>
<%@page import="java.util.List"%>
<%@page import="dao.SkillDAO"%>
<%@page import="model.Info"%>
<%@page import="dao.InfoDAO"%>
 
<%@ include file="/templates/public/inc/header.jsp"%>



<div class="wrapper">
	
	<%
		
			String title="";
			String intro="";
			String picture="";
			HomeDAO homeDAO = new HomeDAO();
			if(homeDAO.getItem()!=null){
				Home home = homeDAO.getItem();
				title=home.getTitle();
				intro=home.getDescription();
				picture = home.getPicture();
			}
					
		%>
	<section class="site-hero row " style="background-image: url(<%=request.getContextPath()%>/files/<%=picture %>);" id="section-home" data-stellar-background-ratio="0.5">
	<div class="container">
		<div class="row intro-text align-items-center justify-content-center">
		
			<div class="col-md-10 text-center">
				<h1 class="site-heading site-animate">
					<strong><%=title %></strong>
				
				</h1>
				<p class="lead site-subheading mb-4 site-animate"><%=intro %></p>
				<p>
					<a href="#section-about"
						class="smoothscroll btn btn-primary px-4 py-3">Xem thêm</a>
				</p>
			</div>
		</div>
	</div>
</section>
<!-- section -->


<section class="site-section" id="section-about">
	<div class="container">
		<div class="row mb-5 align-items-center">

			<%
				InfoDAO infoDAO = new InfoDAO();
				String name = "";
				int age = 0;
				int experience = 0;
				String place = "";
				String email = "";
				String phone = "";
				String description = "";
				String img = "";
				String cv = "";
				if (infoDAO.getItem() != null) {
					Info info = infoDAO.getItem();
					name = info.getName();
					age = info.getAge();
					experience = info.getExperience();
					place = info.getPlace();
					phone = info.getPhone();
					email = info.getEmail();
					description = info.getDescription();
					img = info.getImage();
					cv = info.getCv();
				}
			%>
			<div class="col-lg-7 pr-lg-5 mb-5 mb-lg-0">
				<img class="img-fluid"  style="min-width: 300px;; min-height: 600px;" src="<%=request.getContextPath()%>/files/<%=img%>"
					alt="Image placeholder" class="img-fluid1">
			</div>
			<div class="col-lg-5 pl-lg-5">
				<div class="section-heading">
					<h2>
						 <strong>GIỚI THIỆU VỀ TÔI</strong>
					</h2>
				</div>
				<p class="lead"><%=description%></p>


				<div class="about-profile">
					<ul>
						<li style="list-style: none;"><span class="pro-title">
								Họ Tên</span> <span class="pro-detail"><%=name%></span></li>
						<li style="list-style: none;"><span class="pro-title">
								Tuổi </span> <span class="pro-detail"><%=age%></span></li>
						<li style="list-style: none;"><span class="pro-title">
								Kinh nghiệm </span> <span class="pro-detail"><%=experience%>
								Years</span></li>
						<li style="list-style: none;"><span class="pro-title">
								Nơi ở </span> <span class="pro-detail"></span><%=place%></li>
						<li style="list-style: none;"><span class="pro-title">
								e-mail </span> <span class="pro-detail"></span><%=email%></li>
						<li style="list-style: none;"><span class="pro-title">
								Điện thoại </span> <span class="pro-detail"><%=phone%></span></li>
					</ul>
					<a href="#section-contact"
						class="btn btn-primary px-4 py-2 btn-sm smoothscroll">Liên hệ</a>
					<a style="background-color: #cac7c7;"
						target:"_blank" href="<%=cv%>"
						class="btn btn-secondary px-4 py-2 btn-sm">Download CV</a>
					</p>
				</div>

			</div>
		</div>

		<div class="row pt-5">
			<div class="col-md-3 mb-3">
				<div class="site-section" id="section-skill">
					<h2>
					 	<strong>KỸ NĂNG</strong>
					</h2>
				</div>
			</div>
			<div class="col-md-9">

				<%
					SkillDAO skillDAO = new SkillDAO();
					if (skillDAO.getItems() != null) {
						List<Skill> skillList = skillDAO.getItems();
						if (skillList.size() > 0) {
							for (Skill skill : skillList) {
				%>
				<div class="skill">
					<h3><%=skill.getName()%></h3>
					<div class="progress">
						<div class="progress-bar" role="progressbar"
							style="width: <%=skill.getLevel()%>%" aria-valuenow="85"
							aria-valuemin="0" aria-valuemax="100">
							<span><%=skill.getLevel()%>%</span>
						</div>

					</div>

				</div>
				<%
					}
						}
					}
				%>

			</div>
		</div>
	</div>
</section>

<section class="site-section bg-light " id="section-resume">


	<div class="container">
		<div class="row">
			<div class="col-md-12 mb-5">
				<div class="section-heading text-center">
					<h2>
						<strong> CHẶNG ĐƯỜNG ĐÃ QUA</strong>
					</h2>
				</div>
			</div>
			<div class="col-md-6">
				<h2 class="mb-5">Học tập</h2>
				<%
					EducationDAO educationDAO = new EducationDAO();

					if (educationDAO.getItem() != null) {
						List<Education> eduList = educationDAO.getItem();
						if (eduList.size() > 0) {
							for (Education edu : eduList) {
				%>
				<div class="resume-item mb-4">
					<span class="date"><span class="icon-calendar"></span> <%=edu.getTimefrom()%>-
						<%=edu.getTimeto()%></span>
					<h3>
						<img
							src="https://img.icons8.com/ios-glyphs/40/32CD48/education.png">&nbsp;&nbsp;<%=edu.getName()%></h3>
					<p><%=edu.getDescription()%></p>
				</div>
				<%
					}
						}
					}
				%>




			</div>
			<div class="col-md-6">


				<h2 class="mb-5">Làm việc</h2>
				<%
					WorkDAO workDAO = new WorkDAO();
					if (workDAO.getItem() != null) {
						List<Work> workList = workDAO.getItem();
						if (workList.size() > 0) {
							for (Work work : workList) {
				%>
				<div class="resume-item mb-4">
					<span class="date"><span class="icon-calendar"></span> <%=work.getTimefrom()%>
						- <%=work.getTimeto()%></span>
					<h3>
						<img src="https://img.icons8.com/ios-filled/40/32CD48/new-job.png">&nbsp;&nbsp;<%=work.getName()%></h3>
					<p><%=work.getDescription()%></p>
				</div>

				<%
					}
						}
					}
				%>


			</div>
		</div>
	</div>
</section>
<!-- .section -->


<section class="site-section" id="section-portfolio">
	<div class="container">
		<div class="row">
			<div class="section-heading text-center col-md-12">
				<h2>
					<strong>DỰ ÁN</strong>
				</h2>
			</div>
		</div>
		<div class="filters">
			<ul>
				<%
					ProjectCatDAO projectCatDAO = new ProjectCatDAO();
					if (projectCatDAO.getItems() != null) {
						List<ProjectCat> projectCatList = projectCatDAO.getItems();
				%>
				<li class="active" data-filter="*">All</li>
				<%
					if (projectCatList.size() > 0) {
							for (ProjectCat pCat : projectCatList) {
				%>
				<li data-filter=".<%=pCat.getId()%>"><a><%=pCat.getName()%></a></li>
				<%
					}
						}

					}
				%>
			</ul>
		</div>

		<div class="filters-content">
			<div class="row grid">
				<%
					ProjectDAO projectDAO = new ProjectDAO();
					if(projectDAO.getItems()!=null){
						List<Project> projectList = projectDAO.getItems();
						if(projectList.size()>0){
							for(Project pro:projectList){
						
				%>
				
				<div class="single-portfolio col-sm-4 all <%=pro.getCat_id()%>">
				
				
					<div class="relative">
						<div class="thumb">
							<div class="overlay overlay-bg"></div>
							<img class="img-fluid" alt="Responsive image" "
								src="<%=request.getContextPath()%>/files/<%=pro.getPicture()%>"
								alt="">
						</div>
						<a
							href="<%=request.getContextPath()%>/templates/public/images/p2.jpg"
							class="img-pop-up">
							<div class="middle">
								<div class="text align-self-center d-flex">
									<img
										src="<%=request.getContextPath()%>/templates/public/images/preview.png"
										alt="">
								</div>
							</div>
						</a>
					</div>
					<div class="">
						<h3>
							<a target="_blank" href="<%=pro.getLink()%>"><%=pro.getName() %></a>
						</h3>
						<p class="mb-4"><%=pro.getDescription() %></p>
					</div>
				</div>
				<%
							}
				
						}
					}
				%>
				
				
			</div>
		</div>
	</div>
</section>
<!-- .section -->



<section class="site-section" id="section-blog">
	<div class="container">
		<div class="row">
			<div class="col-md-12 mb-5">
				<div class="section-heading text-center">
					<h2>
						<a style="text-decoration: none; color: black;" href="<%=request.getContextPath()%>/public/news/cat?id=1"></a><strong> TIN TỨC</strong>
					</h2>
				</div>
			</div>
		</div>
		

		<div id="tintuc" class="row">
			<%
				CommentDAO commentDAO = new CommentDAO();
				NewsDAO newsDAO = new NewsDAO();
				List<News> newsList=null;
				if(newsDAO.getItemsActive()!=null){
					 newsList = newsDAO.getItemsActive();
				}
					int p=0;
					if(newsList.size()>0){
						for(int i=0;i<4;i++){
							
				
				
			%>
				
					<div class="col-md-6 col-lg-3 col-xs-12 blogBox">
						<div class="blog-entry" style="height: 400px; margin-bottom: 20px;"> 
							<a href="<%=request.getContextPath()%>/public/news/detail?id=<%=newsList.get(i).getId()%>"><img class="img-fluid" alt="Responsive image"
								src="<%=request.getContextPath()%>/files/<%=newsList.get(i).getPicture() %>"
								alt="Image placeholder" class="img-fluid"></a>
							<div class="blog-entry-text">
							<%
								String urlSlug = request.getContextPath()+"/"+StringUtil.makeSlug(newsList.get(i).getName())+"-"+newsList.get(i).getId()+".html";
								%>
								<p >
									<a style="size: 30px; font-weight:bold;" href="<%=urlSlug%>"><%=newsList.get(i).getName() %></a>
								</p>
								<%-- <p class="mb-4"><%=news.getDescription()%></p> --%>
								
							<%-- 	<div class="meta">
									 <a
										href="<%=urlSlug%>"><span class="icon-bubble"></span> <%=commentDAO.getItems(newsList.get(i).getId()).size() %> Comments</a>
								</div> --%>
							</div>
						</div>
					</div>
							<%
						
					
					}
				}
							%>
							
							
					
				<div class="row more_post">
									
						<div></div>
						<input type="number" style="display: none;" id="batdau" value="4">
						<input type="number" style="display: none;" id="ketthuc" value="7">
             		 
    			  </div>
	
				
			</div>
			
		
<div class="phantrang">
					<a href="#" id="loadMore" class="btn btn-primary  px-4 py-3">Xem thêm</a>

<p class="totop" style="opacity: 0.7;"> 
    <a href="#top"><img src="https://img.icons8.com/ios-filled/50/2ECC71/circled-chevron-up.png"></a> 
</p>
<p class="totop" id="callme"> 
   <a style="height: 70%;width: 70%;" id="callmeMain" href="tel:0968997331"></a>
</p>
<style>

</style>
	</div>
	<script type="text/javascript">
		
										
											$('#loadMore').click(function(offset){
												 let start=Number($('#batdau').val());
												 let end=start+4;
												 <%
												 
												 %>
												$.ajax({
													url: '<%=request.getContextPath()%>/phantrang',

												type : 'POST',
												cache : false,

												data : {
													//(key , value)
													start:start,
													end:end
												},

												success : function(data) {
													console.log(data);
													 $('.more_post div:eq(-1)').before(data);
													
													 $('#batdau').val(end);
													
										
												},
												error : function() {
													alert('Có lỗi xảy ra');
												}
											});
											return false;
										});
									
	

	
</script>
	


	
	</div>
</section>

<section class="site-section bg-light" id="section-contact">
</div>

	<div class="container">
		<div class="row">
			<div class="col-md-12 mb-5">
				<div class="section-heading text-center">
					<h2>
						<strong> LIÊN HỆ</strong>
					</h2>
				</div>
			</div>

			<div class="col-md-7 mb-5 mb-md-0">
				<form id="contact_form" class="site-form">
					<h3 class="mb-5">Để lại phản hồi tại đây</h3>
					<div class="form-group">
						<input type="text" name="name" id="conname" class="form-control px-3 py-4 incon"
							placeholder="Tên của bạn">
					</div>
					<div class="form-group">
						<input type="email" name="email" id="conemail" class="form-control px-3 py-4 incon"
							placeholder="Email của bạn">
					</div>
					<div class="form-group">
						<input type="text" name="phone" id="conphone" class="form-control px-3 py-4 incon"
							placeholder="Số điện thoại">
					</div>
					<div class="form-group mb-5">
						<textarea name="message" id="conmessage" class="form-control px-3 py-4 incon" cols="30" rows="10 "
							placeholder="Vui lòng nhập lời nhắn cho tôi!"></textarea>
					</div>
						<%
                			if (request.getParameter("msg") != null) {
                				String msg = request.getParameter("msg");
                				if (msg.equals(CommonConstant.SUCCESS)) {
                					out.print("<div class=\"alert alert-success\" role=\"alert\">\r\n" + 
                							"  Gửi lời nhắn thành công!\r\n" + 
                							"</div>");
                				} else {
                					out.print("Có lỗi trong quá trình xử lý, vui lòng thử lại!");
                				}
                			
                			}
                		%> 
						<div class="form-group">
						
						<a id="contact_send"  class="btn btn-primary  px-4 py-3" href="javascript:void(0)">
						Gửi tin nhắn
						</a>
						
					</div>
						<script type="text/javascript">
		
										
											$('#contact_send').click(function(){
												
												var cname = 	 $('#conname').val();
												var cemail = 	 $('#conemail').val();
												var cphone = 	$('#conphone').val();
												var cmessage = $('#conmessage').val();
												
												if(cname=='' || cemail=='' || cphone=='' || cmessage==''){
													swal('EMPTY','Vui lòng nhập đầy đủ thông tin liên hệ!','warning');
												} else {
													$.ajax({
														url: '<%=request.getContextPath() %>/contact',

														type : 'POST',
														cache : false,

														data : {
															//(key , value)
															
															cname: cname,
															cemail : cemail,
															cphone : cphone,
															cmessage: cmessage
														},
													success : function(data) {
														console.log(data);
															if(data.trim() =='done')
																{
																swal('THANKS!','Gửi lời nhắn thành công, chúng tôi sẽ liên hệ sớm với bạn!','success');
																  $('.incon').val('');
																}
															if(data.trim()=='error')
															{
															swal('SORRY!','Gửi lời nhắn thất bại!','error');
															
															
															}

											},
														
													error : function() {
														alert('Có lỗi xảy ra');
													}
										
														
														
													});
													
												}
												
										return false;
									});
				</script>
						
				</form>
			</div>
			<div class="col-md-5 pl-md-5">
				


				<h3 class="mb-5">Thông tin liên hệ của tôi</h3>
				<ul class="site-contact-details">
					<li><span class="text-uppercase">Email</span> <%=email%></li>
					<li><span class="text-uppercase">Phone</span><a  href="tel:<%=phone%>"><%=phone%></a></li>
					
				</ul>
			</div>
		</div>
		
	</div>
	
	
</section>


</div>

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

    
</body>

			
		</style>
<script type="text/javascript">
	$(window).on("load",function(){
	    $(".loader-wrapper").fadeOut("slow");
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {

		//Khi bàn phím được nhấn và thả ra thì sẽ chạy phương thức này
		$("#contact_form").validate({
			rules : {
				name : {
					required : true,
				},
				email : {
					required : true
				},
				phone : {
					required:true,
				},
				message :{
					required: true,
				}
				
			},
			messages : {
				name : {
					required : "<p style=\"margin-left: 10px; color: #ce5959;  font-weight: bold;\">Vui lòng nhập tên!</p>",

				},
				email : {
					required : "<p style=\"margin-left: 10px; color: #ce5959;  font-weight: bold;\">Vui lòng nhập email!</p>",
				
				},
				phone : {
					required : "<p style=\"margin-left: 10px; color: #ce5959;  font-weight: bold;\">Vui lòng nhập số điện thoại!</p>",

				},
				message : {
					required : "<p style=\"margin-left: 10px; color: #ce5959;  font-weight: bold;\">Vui lòng nhập lời nhắn!</p>",

				}

			},

		});

	});
</script>
<script type="text/javascript">

		$(function () {
		    $(".blogBox").slice(0, 4).show();
		    $("#loadMore").on('click', function (e) {
		        e.preventDefault();
		        $(".blogBox:hidden").slice(0, 4).slideDown();
		        if ($(".blogBox:hidden").length == 0) {
		            $("#load").fadeOut('slow');
		        }
		        $('html,body').animate({
		            scrollTop: $(this).offset().top
		        }, 1500);
		    });
		});
		
		$('a[href=#top]').click(function () {
		    $('body,html').animate({
		        scrollTop: 0
		    }, 600);
		    return false;
		});
		
		$(window).scroll(function () {
		    if ($(this).scrollTop() > 50) {
		        $('.phantrang .totop a').fadeIn();
		    } else {
		        $('.phantrang.totop a').fadeOut();
		    }
		});
</script>
<%@ include file="/templates/public/inc/footer.jsp"%>

