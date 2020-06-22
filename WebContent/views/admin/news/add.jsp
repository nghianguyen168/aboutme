<%@page import="dao.NewsCatDAO"%>
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
                <h2>Thêm bài viết</h2>
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
                                <form role="form" action="<%=request.getContextPath() %>/admin/news/add" method="post" enctype="multipart/form-data" id="form">
                                    <div class="form-group">
                                        <label for="name">Tên bài viết</label>
                                        <input type="text" id="name" value="" name="name" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="category">Danh mục bài viết</label>
                                      
                                        <select id="category" name="category" class="form-control">
                                          <%
                                          	NewsCatDAO nCatDAO = new NewsCatDAO();
                                        	if(request.getAttribute("newsCatList")!=null){
                                        		List<NewsCat> newsCatList = (List<NewsCat>)request.getAttribute("newsCatList");
                                        		if(newsCatList.size()>0){
                                        			for(NewsCat nCat:newsCatList){
                                        				if(nCatDAO.getICatChild(nCat.getId()).size()==0){
                                        	
                                        %>
	                                        <option value="<%=nCat.getId()%>"><%=nCat.getName() %></option>
										
											<%
                                        				}
                                        			}
                                        		}
                                        	}
											%>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="picture">Hình ảnh</label>
                                        <input type="file" name="picture" />
                                    </div>
                                    <div class="form-group">
                                        <label for="preview">Mô tả</label>
                                        <textarea id="preview" n class="form-control" rows="3" name="preview"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="detail">Chi tiết</label>
                                        <textarea id="detail" class="form-control" id="detail" rows="5" name="detail"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="name">Tác giả</label>
                                        <input type="text" id="author" value="" name="author" class="form-control" />
                                    </div>
                                     <div class="form-group">
                                        <label for="category">Trạng thái</label>
                                        <select id="status" name="status" class="form-control">
	                                         <option value="0">--Trạng thái--</option>
	                                        <option value="1">Hiển thị</option>
											<option value="2">Chỉ thêm</option>
											
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
				category : {
					required : true,
				},
				picture : {
					required : true,
				},
				preview : {
					required : true,
				},
				detail : {
					required : true,
				},
				author : {
					required : true,
				},
				status : {
					required : true,
				}
			
				
			},
			messages : {
				name : {
					required : "Vui lòng nhập tên tin!",

				},
				category : {
					required : "Vui lòng chọn danh mục!",

				},

				picture : {
					required : "Vui lòng chọn hình ảnh!",

				},

				preview : {
					required : "Vui lòng nhập mô tả!",

				},

				detail : {
					required : "Vui lòng nhập chi tiết!",

				},

				author : {
					required : "Vui lòng nhập tác giả!",

				},

				status : {
					required : "Vui lòng chọn trạng thái!",

				}
			},

		});

	});
</script>
<script>
    document.getElementById("news").classList.add('active-menu');
</script>
<script>
	var editor = CKEDITOR.replace('detail');
	CKFinder.setupCKEditor(editor,"<%=request.getContextPath()%>"+"/templates/admin/assets/libary/ckfinder/");
	$("#form").submit( function(e) {
        var messageLength = CKEDITOR.instances['detail'].getData().replace(/<[^>]*>/gi, '').length;
        if( !messageLength ) {
            alert( 'Vui lòng nhập chi tiết tin tức!' );
            e.preventDefault();
        }
    });
</script>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>