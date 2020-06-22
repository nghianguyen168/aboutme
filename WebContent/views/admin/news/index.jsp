<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.NewsCat"%>
<%@page import="dao.NewsCatDAO"%>
<%@page import="dao.NewsDAO"%>
<%@page import="utils.DefineUtil"%>
<%@page import="constant.CommonConstant"%>
<%@page import="model.News"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp"%>
<%@ include file="/templates/admin/inc/leftbar.jsp"%>

<div id="page-wrapper">
	<div id="page-inner">
		<div class="row">
			<div class="col-md-12">
				<h2>Quản lý Tin tức</h2>
			</div>
		</div>
		<!-- /. ROW  -->
		<hr />
		<div class="row">
			<div class="col-md-12">
				<!-- Advanced Tables -->
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="table-responsive">
							<div class="row">
								<div class="col-sm-6">
								
								
									<a href="<%=request.getContextPath()%>/admin/news/add"
										class="btn btn-success btn-md">Thêm</a>
									
								</div>
								<div class="col-sm-6" style="text-align: right;">
										<form method="get"
										action="<%=request.getContextPath()%>/admin/news/search">
										<%
											String search = "";
											if (request.getAttribute("searchText") != null) {
												search = (String) request.getAttribute("searchText");
											}
											int cid=0;
											if(request.getAttribute("nid")!=null){
												cid=(int)request.getAttribute("nid");
											}
											int month=0;
											if(request.getAttribute("month")!=null){
												month = (int) request.getAttribute("month");
											}
										%>
										<input type="submit" name="search" value="Tìm kiếm"
											class="btn btn-warning btn-sm" style="float: right" /> 
										<select
											id="category" name="category" class=""
											style="color: #fff; background-color: #f0ad4e; border-color: #d58512; float: right;
											margin-left: 10px; margin-right: 10px; height: 30px; border-radius: 5px;">
											
											<option value="0">--Chọn danh mục--</option>
											<%
												
												String searchText="";
												
												if(request.getAttribute("searchText")!=null){
													searchText = (String)request.getAttribute("searchText");
												}
												
												
												NewsCatDAO  newsCatDAO = new NewsCatDAO();
												List<NewsCat> catList = newsCatDAO.getItems();
												if (catList.size() > 0) {
													for (NewsCat nc : catList) {
														if(newsCatDAO.getICatChild(nc.getId()).size()==0){
														if(nc.getId()==cid){
															
														
											%>
											<option selected="selected" value="<%=nc.getId()%>"><%=nc.getName()%></option>
											<%
														} else {
											%>

											<option value="<%=nc.getId()%>"><%=nc.getName()%></option>
					
											<%
												}}}
												}
											%>
										</select> 
										
											<select
											id="category" name="month" class=""
											style="color: #fff; background-color: #f0ad4e; border-color: #d58512; float: right;
											margin-left: 10px; margin-right: 10px; height: 30px; border-radius: 5px;">
											
											<option value="0">--Chọn tháng--</option>
											<%
												for(int i=1;i<=12;i++){
													if(month==i){
											%>
											<option selected="selected" value="<%=month%>">Tháng <%=i%></option>
											<%
													} else {
											%>
											<option value="<%=i%>">Tháng <%=i%></option>
											<%
												}
												}
											%>
										</select>
										
										<input name="searchText" type="search"
										
											class="form-control input-sm" placeholder="Nhập tiêu đề tin tức"
											value="<%=search%>" style="float: right; width: 300px;" />
										<div class="form-group"></div>
										<div style="clear: both"></div>
									</form>

									<br />
								</div>
							</div>
							<%
							int numberOfPages = 1;
							int curentPage = 1;
							int numberOfItems = DefineUtil.NUMBER_PER_PAGE;
                			if (request.getParameter("msg") != null) {
                				String msg = request.getParameter("msg");
                			}
                		%>
                			
                			<%
                				String msg="";
                				if(request.getParameter("msg")!=null){
                					 msg=request.getParameter("msg");
                					
                				}
                				
                				
                				int nid=0;
								int offset = 0;
								if (request.getAttribute("offset") != null) {
									offset = (int) request.getAttribute("offset");
								}
								 List<News> newsListSearch=null;
								NewsDAO newsDAO = new NewsDAO();
								List<News> newsList=null;
									if (newsDAO.getItemsByPageAdmin(offset)!= null) {
										 newsList = (List<News>) newsDAO.getItemsByPageAdmin(offset);
										 if(request.getAttribute("newsListSearch")!=null){
												newsListSearch = (List)request.getAttribute("newsListSearch");
											 if(newsListSearch.size()>0){
												 newsList=newsListSearch;
											 }
										 }
										 
										 
                				if(msg.equals(CommonConstant.NORESULT)){
                					out.print("<div class=\"alert alert-warning\" role=\"alert\">\r\n" + 
                							"  Không có tin tức nào được tìm thấy!\r\n" + 
                							"</div>");
                					newsList.clear();
                				}
                			%>
                			
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<tr>
										<th>ID</th>
										<th>Tên tin</th>
										<th>Danh mục</th>
										<th>Hình ảnh</th>
										<th>Ngày đăng</th>
										<th>Tác giả</th>
										<th>Trạng thái</th>
										<th width="160px">Chức năng</th>
									</tr>
								</thead>
								<tbody>
									<%
							
									
											if (newsList.size()>0) {
												for (News news : newsList) {
									%>
									<tr>
										<%
											String activeImg = "";
														if (news.getStatus() == 1) {
												activeImg = request.getContextPath() +"/templates/admin/assets/img/active.png";
														} else {
															activeImg = request.getContextPath() + "/templates/admin/assets/img/deactive.png";
														}
										%>
										<td><div id="newsid-<%=news.getId()%>" onchange="return changeSkill(<%=news.getId()%>)"><%=news.getId()%></div></td>
										<td class="center"><%=news.getName()%></td>
										<td class="center"><%=news.getCat()%></td>

										<td class="center"><img width="200px" height="130px"
											src="<%=request.getContextPath()%>/files/<%=news.getPicture()%>"
											alt="" /></td>
										
										<td class="center"><%=news.getDate_create()%></td>
										<td class="center"><%=news.getAuthor()%></td>

										<td class="center">


											<div id="newsactive-<%=news.getId()%>">
												<%
													if (news.getStatus() == 1) {
												%>
												<a href="javascript:void(0)" title="" id="newsactive-<%=news.getId()%>"><img
													src="<%=request.getContextPath()%>/templates/admin/assets/img/active1.png"
													alt="" /></a>
												<%
													} else {
												%>
												<a href="javascript:void(0)" title="" id="newsactive-<%=news.getId()%>"><img
													src="<%=request.getContextPath()%>/templates/admin/assets/img/deactive1.png"
													alt="" /></a>
												<%
													}
												%>
											
										</td>
										<%
										
										if (request.getAttribute("numberOfPages") != null) {
											numberOfPages = (int) request.getAttribute("numberOfPages");
										}
										if (request.getAttribute("curentPage") != null) {
											curentPage = (int) request.getAttribute("curentPage");
										}
										if (request.getAttribute("numberOfItems") != null) {
											numberOfItems = (int) request.getAttribute("numberOfItems");
										}
										
										
										if (request.getAttribute("numberOfPagesSearch") != null) {
											numberOfPages = (int) request.getAttribute("numberOfPagesSearch");
										}
										if (request.getAttribute("curentPageSearch") != null) {
											curentPage = (int) request.getAttribute("curentPageSearch");
										}
										if (request.getAttribute("numberOfItemsSearch") != null) {
											numberOfItems = (int) request.getAttribute("numberOfItemsSearch");
										}
										
										%>
										<td class="center">
										<%
										User user1=null;
						            	if(session.getAttribute("user")!=null){
						            	user = (User) session.getAttribute("user");	
						            	}
						            	if("Admin".equals(user.getRole_name())){
										%>
											<a href="<%=request.getContextPath() %>/admin/news/edit?id=<%=news.getId() %>&p=<%=curentPage %>" title=""
											class="btn btn-primary"><i class="fa fa-edit "></i> Sửa</a> 
											<%-- <a onclick="return confirm('Bạn có chắc chắn muốn xóa không?')"
											href="<%=request.getContextPath() %>/admin/news/del?id=<%=news.getId() %>&p=<%=curentPage %>" title="" class="btn btn-danger"><i
												class="fa fa-pencil"></i> Xóa</a> --%>
											<button href="#myModal<%=news.getId() %>" class="btn btn-danger" data-toggle="modal">
												<i class="fa fa-trash-o "></i>
											</button>
											
											<!-- Modal HTML -->
												<div style="top: 16%;" id="myModal<%=news.getId() %>" class="modal fade">
													<div class="modal-dialog modal-confirm">
														<div class="modal-content">
															<div class="modal-header">
																<div class="icon-box">
																	<i class="glyphicon glyphicon-trash"></i>
																</div>				
																<h4 class="modal-title">Bạn có chắc chắn muốn xóa</h4>	
												                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
															</div>
															<!-- <div class="modal-body">
																<p>Do you really want to delete these records? This process cannot be undone.</p>
															</div> -->
															<div class="modal-footer">
																<a type="button" class="btn btn-info" data-dismiss="modal">Cancel</a>
																<a href="<%=request.getContextPath() %>/admin/news/del?id=<%=news.getId() %>&p=<%=curentPage %>"   class="btn btn-danger"><span style="red;"> Delete</span></a>
															</div>
														</div>
													</div>
												</div>     
												
											<%
						            	}
											%>
										</td>
										<script type="text/javascript">
		
										
											$('#newsactive-<%=news.getId()%>').click(function(){
												var img =  $('#newsactive-<%=news.getId()%> img').attr("src");
												var id = 	 $('#newsid-<%=news.getId()%>').val();
												var idnews = <%=news.getId()%>
												$.ajax({
													url: '<%=request.getContextPath()%>/xuly-active',

												type : 'POST',
												cache : false,

												data : {
													//(key , value)
													img : img,
													idnews : idnews
												},

												success : function(data) {
													console.log(data);
													$('#newsactive-<%=news.getId()%> img').attr('src', data);
												},
												error : function() {
													alert('Có lỗi xảy ra');
												}
											});
											return false;
										});
									
	

	
</script>

									</tr>

									<%
										}
											}
										}
									%>

								</tbody>
							</table>
							<%
							
							

								if (newsList != null || newsList.size() > 0) {
							%>
							<div class="row">
								<div class="col-sm-6">
									<div class="dataTables_info" id="dataTables-example_info"
										style="margin-top: 27px">
									
									</div>
								</div>
								<div class="col-sm-6" style="text-align: right;">
									<div class="dataTables_paginate paging_simple_numbers"
										id="dataTables-example_paginate">
										<ul class="pagination">
											<%
												String url=request.getContextPath()+"/admin/news/index?page="+(curentPage-1);
												if(newsListSearch!=null){
													url=request.getContextPath()+"/admin/news/search?search=Tìm+kiếm&category="+
												cid+"&month="+month+"&searchText="+searchText+"&page="+(curentPage-1);
												}
												if (numberOfPages >1) {
											%>
											<li class="" aria-controls="dataTables-example" tabindex="0"
												id="dataTables-example_previous"><a
												href="<%=url%>">Trang
													trước</a></li>
											<%
												}
											%>

											<%
												String active = "";
													for (int i = 1; i <= numberOfPages; i++) {
														if (curentPage == i) {
															active = "active";
														} else {
															active = "";
														}
											%>
											<%
											String url1=request.getContextPath()+"/admin/news/index?page="+i;
											if(newsListSearch!=null){
												url1=request.getContextPath()+"/admin/news/search?search=Tìm+kiếm&category="+
											cid+"&month="+month+"&searchText="+searchText+"&page="+i;
											}
											
											%>
											<li class="paginate_button <%=active%>"
												aria-controls="dataTables-example" tabindex="0"><a
												href="<%=url1%>"><%=i%></a></li>

											<%
												}
											%>
											<%
											String url2=request.getContextPath()+"/admin/news/index?page="+(curentPage+1);
											if(newsListSearch!=null){
												url2=request.getContextPath()+"/admin/news/search?search=Tìm+kiếm&category="+
											cid+"&month="+month+"&searchText="+searchText+"&page="+(curentPage+1);
											}
												if (numberOfPages > 1) {
											%>
											<li class="paginate_button next"
												aria-controls="dataTables-example" tabindex="0"
												id="dataTables-example_next"><a
												href="<%=url2%>">Trang
													tiếp</a></li>
											<%
												}
											%>
										</ul>
									</div>
								</div>
							</div>
							<%
								}
							%>
						</div>

					</div>
				</div>
				<!--End Advanced Tables -->
			</div>
		</div>
	</div>
</div>
<script>
	document.getElementById("news").classList.add('active-menu');
</script>
<!-- /. PAGE INNER  -->
<%@ include file="/templates/admin/inc/footer.jsp"%>