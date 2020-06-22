<%@page import="constant.CommonConstant"%>
<%@page import="model.Skill"%>
<%@page import="java.util.List"%>
<%@page import="dao.SkillDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp"%>
<%@ include file="/templates/admin/inc/leftbar.jsp"%>

<div id="page-wrapper">
	<div id="page-inner">
		<div class="row">
			<div class="col-md-12">
				<h2>Quản lý kỹ năng</h2>
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


							<a href="<%=request.getContextPath()%>/admin/skill/add"
								class="btn btn-success btn-md">Thêm</a>
							






						</div>
						<div class="col-md-9">
							<div id="slidecontainer" class="slidecontainer">
							
								<%
									SkillDAO skillDAO = new SkillDAO();
									if (skillDAO.getItems() != null) {
										List<Skill> skillList = skillDAO.getItems();
										if (skillList.size() > 0) {
											for (Skill skill : skillList) {
								%>
								<form action="<%=request.getContextPath()%>/admin/skill/update"
									method="post">
									<div class="row" style="margin-left: 20px;">
										<h3><%=skill.getName()%>
										</h3>


										<input name="ID" style="display: none;" value="<%=skill.getId()%>" type="text">
										<input name="level" type="range" min="1" max="100"
											value="<%=skill.getLevel()%>" class="slide_skill" 	id="myRange-<%=skill.getId()%>"   onchange="return changeSkill==(<%=skill.getId()%>)">
										<p style="color:#000;">
											Mức độ kỹ năng: <span id="demo-<%=skill.getId() %>" style="margin-right: 30px; font-weight: bold;"><%=skill.getLevel()%></span>
											
											
												<button class="btn btn-success btn-md" type="submit"
												name="submit" class="btn btn-success btn-md">Cập
												nhật</button>
											<%--  <a
												onclick="return confirm('Bạn có chắc chắn muốn xóa không?')"
												href="<%=request.getContextPath()%>/admin/skill/del?id=<%=skill.getId()%>"
												style="background-color: #e52f2b; border-color: #e52f2b;"
												class="btn btn-success btn-md">Xóa</a> --%>
												
													<a href="#myModal<%=skill.getId() %>" class="btn btn-danger" data-toggle="modal">
												<i class="fa fa-trash-o "></i>
											</a>
											
											<!-- Modal HTML -->
												<div style="top: 16%;" id="myModal<%=skill.getId() %>" class="modal fade">
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
																<a href="<%=request.getContextPath() %>/admin/skill/del?id=<%=skill.getId() %>"   class="btn btn-danger"><span style="red;"> Delete</span></a>
															</div>
														</div>
													</div>
												</div>     										
										</p>
										</div>
										<hr>
								</form>

								<%
									}
										}
									}
								%>

							

						</div>


					</div>

				</div>
			</div>
			<!--End Advanced Tables -->
		</div>
	</div>
</div>
</div>
<script>
	document.getElementById("skill").classList.add('active-menu');
</script>
<script>
	function  changeSkill(id) {
		var slider = document.getElementById("myRange-"+id);
		var output = document.getElementById("x-"+id);
		output.innerHTML = slider.value;
		slider.oninput = function() {
			output.innerHTML = this.value;
		}
	}
</script>
<!-- /. PAGE INNER  -->
<%@ include file="/templates/admin/inc/footer.jsp"%>