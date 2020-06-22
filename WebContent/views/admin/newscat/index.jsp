<%@page import="dao.NewsCatDAO"%>
<%@page import="constant.CommonConstant"%>
<%@page import="model.NewsCat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/templates/admin/inc/header.jsp"%>
<%@ include file="/templates/admin/inc/leftbar.jsp"%>

<div id="page-wrapper">
	<div id="page-inner">
		<div class="row">
			<div class="col-md-12">
				<h2>Danh mục tin tức</h2>
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
									<a href="<%=request.getContextPath()%>/admin/news/cat/add"
										class="btn btn-success btn-md">Thêm</a> <br>
								</div>

							</div>
							<%
							String msg1="";
								if(request.getAttribute("catChildErr")!=null){
									 msg1=(String)request.getAttribute("catChildErr");
									
								}
								if (request.getParameter("msg") != null) {
									String msg = request.getParameter("msg");
									 
									if(msg.equals(CommonConstant.DOUBLECAT)){
										out.print("<div class=\"alert alert-danger\" role=\"alert\">\r\n" + 
												"Danh mục "+ msg1+"  đã tồn tại!\r\n" + 
												
												"</div>");
									}  
								}
								
							%>
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<tr>
										<th>ID</th>
										<th>Tên Danh mục</th>

										<th width="160px">Chức năng</th>
									</tr>
								</thead>
								<tbody>
									<%
										if (request.getAttribute("newsCatList") != null) {
											List<NewsCat> newsCatList = (List<NewsCat>) request.getAttribute("newsCatList");
											if (newsCatList.size() > 0) {
												for (NewsCat nCat : newsCatList) {
									%>
									<tr>
										<td><%=nCat.getId()%></td>
										<td class="center"><%=nCat.getName()%>
										<%
										NewsCatDAO ncDAO = new NewsCatDAO();
										List<NewsCat> newsCatChildList = ncDAO.getICatChild(nCat.getId());
											if(newsCatChildList.size()>0){
										%>
										<button onclick="	myFunction(<%=nCat.getId() %>)" style=" background-color: #8b897000; border: none;"><img src="https://img.icons8.com/small/16/000000/sort-down.png"></button>
										<%
											}
										%>
											<button 
												data-toggle="modal" data-target="#myModal<%=nCat.getId()%>"
												style="left: 30%;position: absolute; border-radius:5px; text-align:center; right:1200px; border:1px solid #428bca;background-color: #8b897000; ">
												<img src="https://img.icons8.com/small/16/000000/add.png">
											</button>
											
											<div >
												<ul style="display: none" id="childList<%=nCat.getId()%>" onchange="return myFunction==(<%=nCat.getId()%>)">
													<%
														
																	if (newsCatChildList != null) {
																		for (NewsCat ncChild : newsCatChildList) {
													%>
														<li><%=ncChild.getName() %>
															
												
											<a data-toggle="modal" data-target="#myModal2<%=ncChild.getId()%>"
														 style="position:absolute; border-radius:5px; text-align:center; right:860px; border:1px solid #428bca; background-color:#3276b100; width: 35px;"><img src="https://img.icons8.com/small/16/000000/add.png"></a>
											
											<div class="modal" id="myModal2<%=ncChild.getId()%>">
											<form
												action="<%=request.getContextPath()%>/admin/news/cat/child/add?pid=<%=ncChild.getId()%>"
												method="post">
												<div class="modal-dialog">
													<div class="modal-content">

														<!-- Modal Header -->

														<div class="modal-header">
															<h4 class="modal-title">
																Thêm danh mục thuộc tin
																<%=ncChild.getName()%></h4>
															<button type="button" class="close" data-dismiss="modal">&times;</button>
														</div>

														<!-- Modal body -->
														<div class="md-form">

															<input type="text" name="newscatchild"
																id="newscatchild<%=ncChild.getId()%>" class="form-control">


														</div>

														<!-- Modal footer -->
														<div class="modal-footer">
															<button type="submit" class="btn btn-primary">Thêm</button>
															<button type="button" class="btn btn-danger"
																data-dismiss="modal">Close</button>
														</div>

													</div>
												</div>
											</form>
										</div>
														<a href="<%=request.getContextPath()%>/admin/news/cat/edit?id=<%=ncChild.getId()%>"
														 style="position:absolute; border-radius:5px; text-align:center; right:830px; border:1px solid #428bca; background-color:#3276b100; width: 30px;"><img src="https://img.icons8.com/ultraviolet/16/000000/edit.png"></a>
														<a 	onclick="return confirm('Bạn có chắc chắn muốn xóa không?')"
															href="<%=request.getContextPath()%>/admin/news/cat/del?id=<%=ncChild.getId()%>" style="position:absolute; border-radius:5px; text-align:center; right:800px; border:1px solid #428bca; background-color:#3276b100; width: 30px;"><img src="https://img.icons8.com/flat_round/16/000000/delete-sign.png"></a>
														
														
													
													
													 	<ul id="childList<%=ncChild.getId()%>" onchange="return myFunction==(<%=ncChild.getId()%>)">
																<%
																List<NewsCat> newsCatChildList2 = ncDAO.getICatChild(ncChild.getId());
																if(newsCatChildList2.size()>0){
																	for (NewsCat ncChild2 : newsCatChildList2) {
																%>
																	<li><%=ncChild2.getName() %>
																	<a href="<%=request.getContextPath()%>/admin/news/cat/edit?id=<%=ncChild2.getId()%>"
														 style="position:absolute; border-radius:5px; text-align:center; right:830px; border:1px solid #428bca;  background-color:#3276b100; width:30px;"><img src="https://img.icons8.com/ultraviolet/16/000000/edit.png"></a>
														<a 	onclick="return confirm('Bạn có chắc chắn muốn xóa không?')"
											href="<%=request.getContextPath()%>/admin/news/cat/del?id=<%=ncChild2.getId()%>" style="position:absolute; border-radius:5px; text-align:center; right:800px;  border:1px solid #428bca;  background-color:#3276b100; width: 30px;"><img src="https://img.icons8.com/flat_round/16/000000/delete-sign.png"></a>
																	
																	</li>
																<%
																}
																}
																%>
															</ul>
																	
														</li>
														
													<%
														}
																}
													%>
												</ul>
											</div>
											
											<script>
												function myFunction(id) {
												  var x = document.getElementById("childList"+id);
												  if (x.style.display === "none") {
												    x.style.display = "block";
												  } else {
												    x.style.display = "none";
												  }
												}
											</script>
											
										</td>
										<div class="modal" id="myModal<%=nCat.getId()%>">
											<form
												action="<%=request.getContextPath()%>/admin/news/cat/child/add?pid=<%=nCat.getId()%>"
												method="post">
												<div class="modal-dialog">
													<div class="modal-content">

														<!-- Modal Header -->

														<div class="modal-header">
															<h4 class="modal-title">
																Thêm danh mục thuộc tin
																<%=nCat.getName()%></h4>
															<button type="button" class="close" data-dismiss="modal">&times;</button>
														</div>

														<!-- Modal body -->
														<div class="md-form">

															<input type="text" name="newscatchild"
																id="newscatchild<%=nCat.getId()%>" class="form-control">


														</div>

														<!-- Modal footer -->
														<div class="modal-footer">
															<button type="submit" class="btn btn-primary">Thêm</button>
															<button type="button" class="btn btn-danger"
																data-dismiss="modal">Close</button>
														</div>

													</div>
												</div>
											</form>
										</div>
										
										

										<td class="center"><a
											href="<%=request.getContextPath()%>/admin/news/cat/edit?id=<%=nCat.getId()%>"
											title="" class="btn btn-primary"><i class="fa fa-edit "></i>
												Sửa</a> <a
											onclick="return confirm('Bạn có chắc chắn muốn xóa không?')"
											href="<%=request.getContextPath()%>/admin/news/cat/del?id=<%=nCat.getId()%>"
											title="" class="btn btn-danger"><i class="fa fa-pencil"></i>
												Xóa</a></td>
									</tr>
									<%
										}
											}
										}
									%>

								</tbody>
							</table>

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