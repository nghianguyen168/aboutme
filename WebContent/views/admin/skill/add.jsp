<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<%@ include file="/templates/admin/inc/leftbar.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Thêm kỹ năng</h2>
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
                                <form role="form"  action="<%=request.getContextPath() %>/admin/skill/add" method="post" id="form">
                                    <div class="form-group">
                                        <label for="name">Kỹ năng</label>
                                        <input type="text" id="name" value="" name="name"  style="width: 25%;" class="form-control"/>
                                        
                                    </div>
                                     <div class="form-group">
                                        <label for="name">Mức độ(%)</label>
                                        <input type="text" id="level" value="" name="level" style="width: 25%;" class="form-control" />
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
				level : {
					required : true,
					number:true,
					min:0,
					max:100
				}
				
			},
			messages : {
				name : {
					required : "Vui lòng nhập tên kỹ năng",

				},
				level : {
					required : "Vui lòng nhập level!",
					number:"Vui lòng nhập số nguyên!",
					min: "Level nằm trong khoảng 0-100",
					max: "Level nằm trong khoảng 0-100",
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