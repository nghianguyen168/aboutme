﻿<%@page import="model.NewsCat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<%@ include file="/templates/admin/inc/leftbar.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Cập nhật danh mục</h2>
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
                                    	String news_name="";
                            			int id=0;
                                    	if(request.getAttribute("newsCat")!=null){
                                    		NewsCat newsCat = (NewsCat) request.getAttribute("newsCat");
                                    		news_name = newsCat.getName();
                                    		id = newsCat.getId();
                                    		
                                    	}
                                    
                                    %>
                                <form role="form" action="<%=request.getContextPath() %>/admin/news/cat/edit?id=<%=id %>" method="post" id="form">
                                    
                                    <div class="form-group">
                                        <label for="name">Tên Danh Mục</label>
                                        <input type="text" id="name" value="<%=news_name %>" name="name" class="form-control" />
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
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>