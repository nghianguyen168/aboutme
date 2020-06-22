<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    
<%@ include file="/templates/admin/inc/header.jsp" %>
<%@ include file="/templates/admin/inc/leftbar.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <!-- /. ROW  -->
     
         <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-4">
                <!-- <div class="panel panel-back noti-box">
                	<div style="float: left; "><img src="https://img.icons8.com/color/100/000000/speech-bubble-with-dots.png"></div>
                    <div class="text-box">
                        <p class="">Quản lý thông tin</a></p>
                        <p class="text-muted">Có 5 danh mục</p>
                    </div>
                </div> -->
            </div>
       <%--      <div class="col-md-4 col-sm-4 col-xs-4">
                <div class="panel panel-back noti-box">
                    <span class="icon-box bg-color-blue set-icon">
                    <i class="fa fa-bell-o"></i>
                </span>
                    <div class="text-box">
                        <p class="main-text"><a href="<%=request.getContextPath() %>/admin/skill/index" title="">Quản lý kỹ năng</a></p>
                        <p class="text-muted">Có 6 kỹ năng</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4">
                <div class="panel panel-back noti-box">
                    <span class="icon-box bg-color-brown set-icon">
                    <i class="fa fa-rocket"></i>
                </span>
                    <div class="text-box">
                        <p class="main-text"><a href="<%=request.getContextPath() %>/admin/project/index" title="">Quản lý dự án</a></p>
                        <p class="text-muted">Có 15 dự án</p>
                    </div>
                </div>
            </div> --%>
        </div>

    </div>
</div>
<script>
    document.getElementById("index").classList.add('active-menu');
</script>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>