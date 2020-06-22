<%@page import="utils.DefineUtil"%>
<%@page import="constant.CommonConstant"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Comment"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<%@ include file="/templates/admin/inc/leftbar.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Quản lý Bình luận</h2>
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
                               
                                
                            </div>
								<%
								
                			if (request.getParameter("msg") != null) {
                				String msg = request.getParameter("msg");
                				if (msg.equals(CommonConstant.SUCCESS)) {
                					out.print("<p style=\"background: #c2e6c4; color:#217fad; font-size:20px; font-weight:bold; border-radius: 5px; text-align:center; padding-bottom:10px; margin-bottom: 10px; \">Xử lý thành công</p>");
                				} else {
                					out.print("Có lỗi trong quá trình xử lý, vui lòng thử lại!");
                				}
                			}
                		%>
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên tin</th>
                                        <th>Người bình luận</th>
                                        <th>Nội dung bình luận</th>
                                       	  <th>Thời gian</th>
                                        <th width="160px">Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                int offset = 0;
								if (request.getAttribute("offset") != null) {
									offset = (int) request.getAttribute("offset");
								}
								List<Comment> commentListByPageAdmin =null;
                                SimpleDateFormat formatter = new SimpleDateFormat("dd-M-yyyy hh:mm:ss");
                                	if(request.getAttribute("commentListByPageAdmin")!=null){
                                		commentListByPageAdmin = (List<Comment>)request.getAttribute("commentListByPageAdmin");
                                		if(commentListByPageAdmin.size()>0){
                                			for(Comment comment:commentListByPageAdmin){
                                				
                                	
                                %>
                                    <tr>
                                        <td><%=comment.getId() %></td>
                                        <td class="center"><%=comment.getNews_name()%></td>
                                        <td class="center"><%=comment.getName() %></td>
                                        <td class="center"><%=comment.getComment() %></td>
                                         <td class="center"><%=formatter.format(comment.getTime()) %></td>
                                        <td class="center">
                                            
                                            <a onclick="return confirm('Bạn có chắc chắn muốn xóa không?')" href="<%=request.getContextPath() %>/admin/news/comment/del?id=<%=comment.getId() %>" title="" class="btn btn-danger"><i class="fa fa-pencil"></i> Xóa</a>
                                        </td>
                                    </tr>
									<%
                                			}
                                		}
                                	}
										
									%>
                                </tbody>
                            </table>
                            	<%
							
								int numberOfPages = 1;
								int curentPage = 1;
								int numberOfItems = DefineUtil.NUMBER_PER_PAGE_Comment;
								if (request.getAttribute("numberOfPages") != null) {
									numberOfPages = (int) request.getAttribute("numberOfPages");
								}
								if (request.getAttribute("curentPage") != null) {
									curentPage = (int) request.getAttribute("curentPage");
								}
								if (request.getAttribute("numberOfItems") != null) {
									numberOfItems = (int) request.getAttribute("numberOfItems");
								}

								if (commentListByPageAdmin != null || commentListByPageAdmin.size() > 0) {
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
												if (numberOfPages > 2) {
											%>
											<li class="" aria-controls="dataTables-example" tabindex="0"
												id="dataTables-example_previous"><a
												href="<%=request.getContextPath()%>/admin/news/comment?page=<%=curentPage - 1%>">Trang
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

											<li class="paginate_button <%=active%>"
												aria-controls="dataTables-example" tabindex="0"><a
												href="<%=request.getContextPath()%>/admin/news/comment?page=<%=i%>"><%=i%></a></li>

											<%
												}
											%>
											<%
												if (numberOfPages > 2) {
											%>
											<li class="paginate_button next"
												aria-controls="dataTables-example" tabindex="0"
												id="dataTables-example_next"><a
												href="<%=request.getContextPath()%>/admin/news/comment?page=<%=curentPage + 1%>">Trang
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
<%@ include file="/templates/admin/inc/footer.jsp" %>