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
                            
                                <form role="form" action="<%=request.getContextPath() %>/admin/edu/add" method="post"  id="formEdu">
                                    <div class="form-group">
                                        <label for="name">Tên sự kiện</label>
                                        <input type="text" id="name" value="" name="name" class="form-control" />
                                    </div>
                                      <div class="form-group">
                                        <label for="name">Thời gian bắt đầu</label>
                                        <input type="date" id="time_from" value="" name="time_from" class="form-control" />
                                    </div>
                                      <div class="form-group">
                                        <label for="name">Thời gian kết thúc</label>
                                        <input type="date" id="time_to" value="" name="time_to" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="preview">Mô tả</label>
                                        <textarea id="description" class="form-control" rows="3" name="description"></textarea>
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
<script type="text/javascript">
	$(document).ready(function() {

		//Khi bàn phím được nhấn và thả ra thì sẽ chạy phương thức này
		$("#formEdu").validate({
			rules : {
				name : {
					required : true,
				},
				time_from : {
					required : true,
				},
				time_to : {
					required:true,
				},
				description :{
					required: true,
				}
				
			},
			messages : {
				name : {
					required : "Vui lòng nhập tên sự kiện!",

				},
				time_from : {
					required : "Vui lòng chọn thời gian bắt đầu",
				
				},
				time_to : {
					required : "Vui lòng chọn thời gian kết thúc",

				},
				description : {
					required : "Vui lòng nhập mô tả!",

				}

			},

		});

	});
</script>
<script>
    document.getElementById("song").classList.add('active-menu');
</script>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>