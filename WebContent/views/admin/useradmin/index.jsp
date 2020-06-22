<%@page import="constant.CommonConstant"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<%@ include file="/templates/admin/inc/leftbar.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Quản lý Admin</h2>
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
                                    <a href="<%=request.getContextPath() %>/admin/user/add" class="btn btn-success btn-md">Thêm</a>
                                </div>
                                
                            </div>
							
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên đăng nhập</th>
                                        <th>Họ tên</th>
                                        <th>Vai trò</th>
                                     
                                        <th width="160px">Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                	if(request.getAttribute("userList")!=null){
                                		List<User> userList = (List<User>)request.getAttribute("userList");
                                		if(userList.size()>0){
                                			for(User user1:userList){
                                				
                                	
                                %>
                                    <tr>
                                        <td><%=user1.getId() %></td>
                                        <td class="center"><%=user1.getName() %></td>
                                        <td class="center"><%=user1.getFullname() %></td>
                                        <td class="center"><%=user1.getRole_name() %></td>
                                        
                                        <td class="center">
                                        <%
                                        User userP=null;
                                    	if(session.getAttribute("user")!=null){
                                    		userP = (User) session.getAttribute("user");	
                                    	}
                                        	if("Admin".equals(userP.getRole_name()) || (userP.getId()==user1.getId())){
                                        %>
                                            <a href="<%=request.getContextPath() %>/admin/user/edit?id=<%=user1.getId() %>" title="" class="btn btn-primary"><i class="fa fa-edit "></i> Sửa</a>
                                            
                                            <%
                                        	}
                                            %>
                                            <%
                                          
                                        	
                                            	if("Admin".equals(userP.getRole_name())  && (!"Admin".equals(user1.getRole_name())) ){
                                            %>
                                           <%--  <a  onclick="return confirm('Bạn có chắc chắn muốn xóa không?')" href="<%=request.getContextPath() %>/admin/user/del?id=<%=user1.getId() %>" title="" class="btn btn-danger"><i class="fa fa-pencil"></i> Xóa</a> --%>
                                        	<button href="#myModal<%=user1.getId() %>" class="btn btn-danger" data-toggle="modal">
												<i class="fa fa-trash-o "></i>
											</button>
											
											<!-- Modal HTML -->
												<div style="top: 16%;" id="myModal<%=user1.getId() %>" class="modal fade">
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
																<a href="<%=request.getContextPath() %>/admin/user/del?id=<%=user1.getId() %>"   class="btn btn-danger"><span style="red;"> Delete</span></a>
															</div>
														</div>
													</div>
												</div>    
                                        	<%
                                            	}
                                        	%>
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
    document.getElementById("admin").classList.add('active-menu');
</script>
<!-- /. PAGE INNER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>