<%@page import="constant.CommonConstant"%>
<%@page import="model.Project"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<%@ include file="/templates/admin/inc/leftbar.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Quản lý dự án</h2>
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
                                    <a href="<%=request.getContextPath() %>/admin/project/add" class="btn btn-success btn-md">Thêm</a>
                                </div>
                                <div class="col-sm-6" style="text-align: right;">
                                    <form method="post" action="">
                                        <input type="submit" name="search" value="Tìm kiếm" class="btn btn-warning btn-sm" style="float:right" />
                                        <input type="search" class="form-control input-sm" placeholder="Nhập tên dự án" style="float:right; width: 300px;" />
                                        <div style="clear:both"></div>
                                    </form><br />
                                </div>
                            </div>
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên dự án</th>
                                        <th>Danh mục</th>
                                        <th>Lượt truy cập</th>
                                        <th>Hình ảnh</th>
                                        <th width="160px">Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                <%
                                	if(request.getAttribute("projectList")!=null){
                                		List<Project> projectList = (List<Project>) request.getAttribute("projectList");
                                		if(projectList.size()>0){
                                			for(Project pro:projectList){
                                			
                                				String urlEdit = request.getContextPath()+"/admin/project/edit?id="+pro.getId();
                                				String urlDel = request.getContextPath()+"/admin/project/del?id="+pro.getId();
                                				
                                %>
                                    <tr>
                                        <td><%=pro.getId() %></td>
                                        <td class="center"><%=pro.getName() %></td>
                                        <td class="center"><%=pro.getCat() %></td>
                                        <td class="center"><%=pro.getVisit() %></td>
                                        <td class="center">
											<img width="200px" height="120px" src="<%=request.getContextPath() %>/files/<%=pro.getPicture() %>" alt=""/>
                                        </td>
                                        <td class="center">
                                            <a href="<%=urlEdit %>" title="" class="btn btn-primary"><i class="fa fa-edit "></i> Sửa</a>
                                            <%-- <a onclick="return confirm('Bạn có chắc chắn muốn xóa không?')" href="<%=urlDel %>" title="" class="btn btn-danger"><i class="fa fa-pencil"></i> Xóa</a> --%>
                                        	<button href="#myModal<%=pro.getId() %>" class="btn btn-danger" data-toggle="modal">
												<i class="fa fa-trash-o "></i>
											</button>
											
											<!-- Modal HTML -->
												<div style="top: 16%;" id="myModal<%=pro.getId() %>" class="modal fade">
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
												
                                        
                                        </td>
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
    document.getElementById("project").classList.add('active-menu');
</script>
<!-- /. PAGE INNER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>	