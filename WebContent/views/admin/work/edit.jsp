<%@page import="model.Work"%>
<%@page import="utils.StringUtil"%>
<%@page import="model.Education"%>
<%@page import="constant.CommonConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<%@ include file="/templates/admin/inc/leftbar.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Thêm cột mốc học tập</h2>
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
                    
                			if (request.getParameter("msg") != null) {
                				String msg = request.getParameter("msg");
                				if (msg.equals(CommonConstant.SUCCESS)) {
                					out.print("Xử lý thành công!");
                				} else {
                					out.print("Có lỗi trong quá trình xử lý, vui lòng thử lại!");
                				}
                			}
                		%>
                              <%
                              		int id=0;
                                	String name="";
                                	String timefrom="";
                                	String timeto="";
                                	String description="";
                                	if(request.getAttribute("work")!=null){
                                		Work work = (Work)request.getAttribute("work");
                                		id=work.getId();
                                		name=work.getName();
                                		timefrom=StringUtil.DaoChuoi(work.getTimefrom())+"-01";
                                		timeto=StringUtil.DaoChuoi(work.getTimeto())+"-01";
                                		description=work.getDescription();
                                		
                                	}
                                	
                                %>
                                <form role="form" action="<%=request.getContextPath() %>/admin/work/edit?id=<%=id %>" method="post"  id="form">
                                
                              
                                    <div class="form-group">
                                        <label for="name">Tên sự kiện</label>
                                        <input type="text" id="name" value="<%=name %>" name="name" class="form-control" />
                                    </div>
                                      <div class="form-group">
                                        <label for="name">Thời gian bắt đầu</label>
                                        <input type="date" id="time_from" value="<%=timefrom %>" name="time_from" class="form-control" />
                                    </div>
                                      <div class="form-group">
                                        <label for="name">Thời gian kết thúc</label>
                                        <input type="date" id="time_to" value="<%=timeto %>" name="time_to" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="preview">Mô tả</label>
                                        <textarea id="description" class="form-control" rows="3" name="description"><%=description %></textarea>
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