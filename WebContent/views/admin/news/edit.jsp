<%@page import="constant.CommonConstant"%>
<%@page import="dao.NewsCatDAO"%>
<%@page import="model.News"%>
<%@page import="model.NewsCat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<%@ include file="/templates/admin/inc/leftbar.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Chỉnh sửa bài viết</h2>
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
                            	int cat_id=0;
                            	String name="";
                            	String picture="";
                            	String preview="";
                            	String detail="";
                            	String author="";
                            	int status=0;
                            	if(request.getAttribute("news")!=null){
                            		News news = (News)request.getAttribute("news");
                            		id = news.getId();
                            		cat_id=news.getCat_id();
                            		name=news.getName();
                            		picture=news.getPicture();
                            		preview=news.getDescription();
                            		detail=news.getDetail();
                            		author = news.getAuthor();
                            		status = news.getStatus();
                            		
                            		
                            	}
                            %>
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
                                <form role="form" action="<%=request.getContextPath() %>/admin/news/edit?id=<%=id %>" method="post" enctype="multipart/form-data" id="form">
                                    
                                    <div class="form-group">
                                        <label for="name">Tên bài viết</label>
                                        <input type="text" id="name" value="<%=name %>" name="name" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="category">Danh mục bài viết</label>
                                      
                                        <select id="category" name="category" class="form-control">
                                          <%
                                          	NewsCatDAO newsCatDAO = new NewsCatDAO();
                                        	if(newsCatDAO.getItems()!=null){
                                        		List<NewsCat> newsCatList = newsCatDAO.getItems();
                                        		if(newsCatList.size()>0){
                                        			for(NewsCat nCat:newsCatList){
                                        				if(newsCatDAO.getICatChild(nCat.getId()).size()==0){
                                        				if(nCat.getId()==cat_id){
                                        				
                                        	
                                        %>
                                        <option selected="selected" value="<%=nCat.getId()%>"><%=nCat.getName() %></option>
                                        <%
                                        				} else { 
                                        %>
	                                        <option value="<%=nCat.getId()%>"><%=nCat.getName() %></option>
										
											<%
                                        				}
                                        				}
                                        			}
                                        		}
                                        	}
											%>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="picture">Hình ảnh</label>
                                        <input type="file" name="picture" /><img width="200px" height="100px" alt=""
											src="<%=request.getContextPath()%>/files/<%=picture%>">
                                    </div>
                                    <div class="form-group">
                                        <label for="preview">Mô tả</label>
                                        <textarea id="preview" n class="form-control" rows="3" name="preview"><%=preview %></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="detail">Chi tiết</label>
                                        <textarea id="detail" class="form-control" id="detail" rows="5" name="detail"><%=detail %></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="name">Tác giả</label>
                                        <input type="text" id="author" value="<%=author %>" name="author" class="form-control" />
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
    document.getElementById("news").classList.add('active-menu');
</script>
<script>
	var editor = CKEDITOR.replace('detail');
	CKFinder.setupCKEditor(editor,"<%=request.getContextPath()%>"+"/templates/admin/assets/libary/ckfinder/");
</script>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>