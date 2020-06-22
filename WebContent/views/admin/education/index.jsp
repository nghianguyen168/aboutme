<%@page import="constant.CommonConstant"%>
<%@page import="model.Education"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp"%>
<%@ include file="/templates/admin/inc/leftbar.jsp"%>
<div id="page-wrapper">
	<div id="page-inner">
		<div class="row">
			<div class="col-md-12">
				<h2>Quá trình Học tập</h2>
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
									<a style="margin-bottom: 10px;" href="<%=request.getContextPath()%>/admin/edu/add"
										class="btn btn-success btn-md">Thêm</a>
								</div>
								
							</div>
							
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<tr >
										<th>ID</th>
										<th>Tên sự kiện</th>
										<th>Thời gian</th>
										<th>Mô tả</th>

										<th width="160px">Chức năng</th>
									</tr>
								</thead>
								<tbody>
									<%
										int id = 0;
										String name = "";
										String time_from = "";
										String time_to = "";
										String description = "";
										if (request.getAttribute("eduList") != null) {
											List<Education> eduList = (List<Education>) request.getAttribute("eduList");
											if (eduList.size() > 0) {
												for (Education edu : eduList) {
													id = edu.getId();
													name = edu.getName();
													time_from = edu.getTimefrom();
													time_to = edu.getTimeto();
													description = edu.getDescription();
													String urlDel = request.getContextPath()+"/admin/edu/del?id="+id;
													String urlEdit = request.getContextPath()+"/admin/edu/edit?id="+id;
									%>
									<tr>
										<td><%=id%></td>
										<td class="center"><%=name%></td>
										<td class="center"><%=time_from%> - <%=time_to%></td>
										<td class="center"><%=description%></td>

										<td class="center"><a href="<%=urlEdit %>" title=""
											class="btn btn-primary"><i class="fa fa-edit "></i> Sửa</a> 
										<%-- <a onclick="return confirm('Bạn có chắc chắn muốn xóa không?')"
											href="<%=urlDel %>" title="" class="btn btn-danger"><i
												class="fa fa-pencil"></i> Xóa</a></td> --%>
										<button href="#myModal<%=edu.getId() %>" class="btn btn-danger" data-toggle="modal">
												<i class="fa fa-trash-o "></i>
											</button>
											
											<!-- Modal HTML -->
												<div style="top: 16%;" id="myModal<%=edu.getId() %>" class="modal fade">
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
																<a href="<%=urlDel %>"   class="btn btn-danger"><span style="red;"> Delete</span></a>
															</div>
														</div>
													</div>
												</div>     
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
	document.getElementById("resume").classList.add('active-menu');
</script>
<!-- /. PAGE INNER  -->
<%@ include file="/templates/admin/inc/footer.jsp"%>