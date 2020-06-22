<%@page import="constant.CommonConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<%@ include file="/templates/admin/inc/leftbar.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Thêm danh mục</h2>
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
                        <%
                        
                			if (request.getParameter("msg") != null) {
                				String msg = request.getParameter("msg");
                				if (msg.equals(CommonConstant.SUCCESS)) {
                					out.print("<p style=\"background: #c2e6c4; color:#217fad; font-size:20px; font-weight:bold; border-radius: 5px; text-align:center; padding-bottom:10px; margin-bottom: 10px; \">Xử lý thành công</p>");
                				} 
                				if (msg.equals(CommonConstant.DOUBLECAT)) {
                					out.print("<p style=\"background: #dd847d; width:50%;margin-left:20%; color:#fff;font-size:20px; font-weight:bold; border-radius: 5px; text-align:center; padding-bottom:10px; margin-bottom: 10px; \">Danh mục Tin tức đã tồn tại</p>");
                				} 
                				else {
                					out.print("Có lỗi trong quá trình xử lý, vui lòng thử lại!");
                				}
                			}
                		%>
                            <div class="col-md-12">
                                <form role="form" action="<%=request.getContextPath() %>/admin/news/cat/add" method="post" id="form">
                                <%
                                	String nameErr="";
                                	if(request.getAttribute("nameErr")!=null){
                                		nameErr = (String)request.getAttribute("nameErr");
                                	}
                                %>
                                    <div class="form-group">
                                        <label for="name">Tên danh mục</label>
                                        <input type="text" id="name" value="<%=nameErr %>" name="name" class="form-control" />
                                    </div>
                                    
                                    <button type="submit" name="submit" class="btn btn-success btn-md">Thêm</button>
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
    document.getElementById("news").classList.add('active-menu');
</script>
<script type="text/javascript">
	$(document).ready(function() {

		//Khi bàn phím được nhấn và thả ra thì sẽ chạy phương thức này
		$("#form").validate({
			rules : {
				name : {
					required : true,
				}
			
				
			},
			messages : {
				name : {
					required : "Vui lòng nhập tên danh mục!",

				}
			},

		});

	});
</script>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>