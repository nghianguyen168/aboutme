<%@page import="constant.CommonConstant"%>
<%@page import="model.Home"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<%@ include file="/templates/admin/inc/leftbar.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Quản lý Banner</h2>
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
							
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Title</th>
                                        <th>Intro</th>
                                        <th>Hình ảnh</th>
                                      
                                        <th width="160px">Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                	if(request.getAttribute("home")!=null){
                                		Home home = (Home)request.getAttribute("home");
                                	
                                %>
                                    <tr>
                                        <td><%=home.getId() %></td>
                                        <td class="center"><%=home.getTitle() %></td>
                                        <td class="center"><%=home.getDescription() %></td>
                                       
                                        <td class="center">
											<img width="200px" height="130px" src="<%=request.getContextPath() %>/files/<%=home.getPicture() %>" alt="Đổi thay"/>
                                        </td>
                                        <td class="center">
                                            <a href="<%=request.getContextPath() %>/admin/home/edit?id=<%=home.getId() %>" title="" class="btn btn-primary"><i class="fa fa-edit "></i>Cập nhật</a>
                                        </td>
                                    </tr>
									<%
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
    document.getElementById("banner").classList.add('active-menu');
</script>
<!-- /. PAGE INNER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>