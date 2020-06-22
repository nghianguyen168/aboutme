<%@page import="constant.CommonConstant"%>
<%@page import="model.Role"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<%@ include file="/templates/admin/inc/leftbar.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Thêm người dùng</h2>
            </div>
        </div>
        <!-- /. ROW  -->
        <hr />
        <div class="row">
            <div class="col-md-12">
                <!-- Form Elements -->
                <div class="panel panel-default">
                <%
                        
                			if (request.getParameter("msg") != null) {
                				String msg = request.getParameter("msg");
                				if (msg.equals(CommonConstant.SUCCESS)) {
                					out.print("<p style=\"background: #c2e6c4; color:#217fad; font-size:20px; font-weight:bold; border-radius: 5px; text-align:center; padding-bottom:10px; margin-bottom: 10px; \">Xử lý thành công</p>");
                				} 
                				if (msg.equals(CommonConstant.DOUBLECAT)) {
                					out.print("<p style=\"background: #dd847d; width:50%;margin-left:20%; color:#fff;font-size:20px; font-weight:bold; border-radius: 5px; text-align:center; padding-bottom:10px; margin-bottom: 10px; \">Người dùng đã tồn tại</p>");
                				} 
                				else {
                					out.print("Có lỗi trong quá trình xử lý, vui lòng thử lại!");
                				}
                			}
                		%>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12">
                            <%
                            	String fname="";
                            	String username="";
                            	if(request.getAttribute("checkTrungUser")!=null){
                            		User userEr =(User) request.getAttribute("checkTrungUser");
                            		username = userEr.getName();
                            		fname=userEr.getFullname();
                            	}
                            
                            %>
                                <form action="<%=request.getContextPath() %>/admin/user/add" role="form" method="post" id="form">
                                    <div class="form-group">
                                        <label for="name">Username</label>
                                        <input type="text" id="name" value="<%=username %>" name="name" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="name">Password</label>
                                        <input type="password" id="password" value="" name="password" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="name">Fullname</label>
                                        <input type="text" id="fullname" value="<%=fname %>" name="fullname" class="form-control" />
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="category">Vai trò</label>
                                       
                                        <select id="category" name="category" class="form-control">
                                         <%
                                        	if(request.getAttribute("roleList")!=null){
                                        	List<Role> roleList = (List<Role>)request.getAttribute("roleList");
                                        	if(roleList.size()>0){
                                        		for(Role role:roleList){
                                        			
                                        	
                                        %>
	                                        <option value="<%=role.getId()%>"><%=role.getRole_name() %></option>
											
											<%
                                        		}
                                        	}
                                        	}
											%>
                                        </select>
                                        	
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
		$("#form").validate({
			rules : {
				name : {
					required : true,
				},
				password : {
					required : true,
					minlength:6,
				},
				fullname : {
					required:true,
				},
				
				category :{
					required: true,
				}
				
			},
			messages : {
				name : {
					required : "Vui lòng nhập tên dự án!",

				},
				password : {
					required : "Vui lòng nhập mật khẩu!",
					minlength: "Mât khẩu quá ngắn!"
				},
				fullname : {
					required : "Vui lòng nhập fullname",

				},
				category : {
					required : "Vui lòng chọn vai trò",

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