<%@page import="model.ProjectCat"%>
<%@page import="model.Project"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProjectCatDAO"%>
<%@page import="constant.CommonConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<%@ include file="/templates/admin/inc/leftbar.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Cập nhật dự án</h2>
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
                            int cat_id=0;
                            String picture="";
                            String link="";
                            String description="";
                            if(request.getAttribute("project")!=null){
                            	Project project = (Project)request.getAttribute("project");
                            	name=project.getName();
                            	cat_id=project.getCat_id();
                            	picture=project.getPicture();
                            	link=project.getLink();
                            	description=project.getDescription();
                            	id = project.getId();
                            }
                            	
                            %>
                                <form role="form" action="<%=request.getContextPath() %>/admin/project/edit?id=<%=id%>" method="post"  enctype="multipart/form-data"  id="form">
                                    <div class="form-group">
                                        <label for="name">Tên dự án</label>
                                        <input type="text" id="name" value="<%=name %>" name="name" class="form-control" />
                                    </div>
                                     <div class="form-group">
                                        <label for="category">Danh mục bài hát</label>
                                        <select id="category" name="category" class="form-control">
                                        <option value="0">--Danh mục dự án--</option>
                                        <%
                                        	ProjectCatDAO projectCatDAO = new ProjectCatDAO();
                                        		List<ProjectCat> projectCatList=null;
                                        		if(projectCatDAO.getItems()!=null){
                                        			projectCatList =  projectCatDAO.getItems(); }
                                        			if(projectCatList.size()>0){
                                        				for(ProjectCat proCat:projectCatList){
                                        					if(proCat.getId()==cat_id){
                                        		
                                        %>
	                                        <option  selected="selected" value="<%=proCat.getId()%>"><%=proCat.getName() %></option>
											<%
                                        				} else {
                                        					
                                        			
											%>
											<option  value="<%=proCat.getId()%>"><%=proCat.getName()%></option>
											<%
                                        				}
                                        			}
                                        			}
                                        		
											%>
                                        </select>
                                    </div>
                                     <div class="form-group">
                                        <label for="picture">Hình ảnh</label>
                                        <input type="file" name="picture" />
                                        <img width="200px" height="100px" alt=""
											src="<%=request.getContextPath()%>/files/<%=picture%>">
                                    </div>
                                    <div class="form-group">
                                        <label for="name">Link dự án</label>
                                        <input type="text" id="link" value="<%=link %>" name="link" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="name">Mô tả</label>
                                        <input type="text" id="description" value="<%=description %>" name="description" class="form-control" />
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