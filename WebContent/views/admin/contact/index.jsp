<%@page import="utils.DefineUtil"%>
<%@page import="dao.ContactDAO"%>
<%@page import="constant.CommonConstant"%>
<%@page import="model.Contact"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<%@ include file="/templates/admin/inc/leftbar.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Quản lý liên hệ</h2>
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
                                    <a style="display: none;" href="" class="btn btn-success btn-md">Thêm</a>
                                </div>
                                <div class="col-sm-6" style="text-align: right;">
                                    <form method="post" action="">
                                        <input type="submit" name="search" value="Tìm kiếm" class="btn btn-warning btn-sm" style="float:right" />
                                        <input type="search" class="form-control input-sm" placeholder="Nhập thông tin liên hệ" style="float:right; width: 300px;" />
                                        <div style="clear:both"></div>
                                    </form><br />
                                </div>
                            </div>
							
                		<form action="<%=request.getContextPath()%>/admin/contact/del" method="post">
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên người liên hệ</th>
                                        <th>Email</th>
                                        <th>Điện thoại</th>
                                        <th>Lời nhắn</th>
                                        <th width="160px">Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<%
                                	
                                	int numberOfPages = 1;
        							int curentPage = 1;
        							int numberOfItems = DefineUtil.NUMBER_PER_PAGE_CONTACT;
									if (request.getAttribute("numberOfPages") != null) {
										numberOfPages = (int) request.getAttribute("numberOfPages");
									}
									if (request.getAttribute("curentPage") != null) {
										curentPage = (int) request.getAttribute("curentPage");
									}
									if (request.getAttribute("numberOfItems") != null) {
										numberOfItems = (int) request.getAttribute("numberOfItems");
									}
								
                                		int offset=0;
	                                	if (request.getAttribute("offset") != null) {
											offset = (int) request.getAttribute("offset");
										}
	                                	ContactDAO contactDAO = new ContactDAO();
	                                	List<Contact> contactList=null;
                                		if(contactDAO.getItemsByPageAdmin(offset)!=null){
                                			 contactList = contactDAO.getItemsByPageAdmin(offset);
                                			if(contactList.size()>0){
                                				for(Contact contact:contactList){
                                					
                                					String urlDel =request.getContextPath()+"/admin/contact/del?id="+contact.getId();
                                	%>
                                    <tr>
                                        <td><%=contact.getId() %></td>
                                        <td class="center"><%=contact.getName() %></td>
                                        <td class="center"><%=contact.getEmail() %></td>
                                        <td class="center"><%=contact.getPhone() %></td>
                                        <td class="center"><%=contact.getMessage() %></td>
                                        <td class="center">
                                        	
                                            <a href="mailto: <%=contact.getEmail() %>" title="" class="btn btn-primary"><i class="fa"></i>Email</a>
                                        	<a href="#myModal<%=contact.getId() %>" class="btn btn-danger" data-toggle="modal">
												<i class="fa fa-trash-o "></i>
											</a>
											<input size="35" type="checkbox" id="deleteContact" name="deleteContact" value="<%=contact.getId()%>">
											<style>
												input[type=checkbox] {
											         position: relative;
												       cursor: pointer;
											    }
											    input[type=checkbox]:before {
											         content: "";
											         display: block;
											         position: absolute;
											         width: 20px;
											         height: 20px;
											         top: 0;
											         left: 0;
											         border: 1px solid #555555;
											         border-radius: 3px;
											         background-color: white;
											}
											    input[type=checkbox]:checked:after {
											         content: "";
											         display: block;
											         width: 5px;
											         height: 10px;
											         border: solid black;
											         border-width: 0 2px 2px 0;
											         -webkit-transform: rotate(45deg);
											         -ms-transform: rotate(45deg);
											         transform: rotate(45deg);
											         position: absolute;
											         top: 2px;
											         left: 6px;
											}
											</style>
											<!-- Modal HTML -->
												<div style="top: 16%;" id="myModal<%=contact.getId() %>" class="modal fade">
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
                            <div style="position: absolute; right: 0px;">
							
									
							
									<a href="#myModal" class="btn btn-danger" data-toggle="modal">
												<i class="fa fa-trash-o "></i>
											</a>
										
										
											<!-- Modal HTML -->
												<div style="top: 16%;" id="myModal" class="modal fade">
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
																<input type="submit" value="Xóa mục chọn"  class="btn btn-danger"><span style="red;">
															</div>
														</div>
													</div>
												</div>   
									<input style="margin-right:64px;"  name="" type="checkbox" id="select_all"/>  
							
								</div>
								<br>
								<br>
                            </form>
                            
                		
                            <%
                            	if(contactList.size()>0){
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
												if (numberOfPages >1) {
											%>
											<li class="" aria-controls="dataTables-example" tabindex="0"
												id="dataTables-example_previous"><a
												href="<%=request.getContextPath()%>/admin/contact/index?page=<%=curentPage - 1%>">Trang
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
												href="<%=request.getContextPath()%>/admin/contact/index?page=<%=i%>"><%=i%></a></li>

											<%
												}
											%>
											<%
												if (numberOfPages > 1) {
											%>
											<li class="paginate_button next"
												aria-controls="dataTables-example" tabindex="0"
												id="dataTables-example_next"><a
												href="<%=request.getContextPath()%>/admin/contact/index?page=<%=curentPage + 1%>">Trang
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
    document.getElementById("contact").classList.add('active-menu');
</script>

<script>
$('#select_all').click(function(event) {
	  if(this.checked) {
	      // Iterate each checkbox
	      $(':checkbox').each(function() {
	          this.checked = true;
	      });
	  }
	  else {
	    $(':checkbox').each(function() {
	          this.checked = false;
	      });
	  }
	});
</script>
<!-- /. PAGE INNER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>