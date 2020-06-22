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
                <h2>Cập nhật Banner</h2>
            </div>
        </div>
        <!-- /. ROW  -->
        <hr />
        <div class="row">
            <div class="col-md-12">
                <!-- Form Elements -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12">
                            <%
                            	int id=0;
                            	String title="";
                            	String intro="";
                            	String picture="";
                            	if(request.getAttribute("home")!=null){
                            		Home home = (Home)request.getAttribute("home");
                            		id=home.getId();
                            		title=home.getTitle();
                            		intro=home.getDescription();
                            		picture=home.getPicture();
                            	}
                            	
                            %>
                            	<%
								if (request.getParameter("msg") != null) {
									String msg = request.getParameter("msg");
									if (msg.equals(CommonConstant.SUCCESS)) {
										out.print("Xử lý thành công!");
									} else {
										out.print("Có lỗi trong quá trình xử lý, vui lòng thử lại!");
									}
								}
							%>
                                <form role="form" action="<%=request.getContextPath() %>/admin/home/edit?id=<%=id%>" method="post" enctype="multipart/form-data" id="form">
                                    <div class="form-group">
                                        <label for="name">Title</label>
                                        <input type="text" id="title" value="<%=title %>" name="title" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="name">Lời giới thiệu</label>
                                        <input type="text" id="title" value="<%=intro %>" name="intro" class="form-control" />
                                    </div>
                                   
                                    <div class="form-group">
                                        <label for="picture">Hình ảnh</label>
                                        <input type="file" name="picture" /><img width="200px" height="100px" alt=""
											src="<%=request.getContextPath()%>/files/<%=picture%>">
                                    </div>
                                    
                                    <button type="submit" name="submit" class="btn btn-success btn-md">Cập nhật</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Form Elements -->
            </div>
        </div>
        <!-- /. ROW  -->
    </div>
    <!-- /. PAGE INNER  -->
</div>
<script>
    document.getElementById("song").classList.add('active-menu');
</script>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>