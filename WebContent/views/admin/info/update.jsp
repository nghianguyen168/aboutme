<%@page import="constant.CommonConstant"%>
<%@page import="model.Info"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp"%>
<%@ include file="/templates/admin/inc/leftbar.jsp"%>
<div id="page-wrapper">
	<div id="page-inner">
		<div class="row">
			<div class="col-md-12">
				<h2>Thông tin cá nhân</h2>
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
								
								<form role="form"
									action="<%=request.getContextPath()%>/admin/info/index"
									method="post" enctype="multipart/form-data" id="form">
									<%
										Info info = null;
										String name = "";
										int age = 0;
										int exp = 0;
										String place = "";
										String email = "";
										String phone = "";
										String img = "";
										String cv = "";
										String description = "";
										if (request.getAttribute("info") != null) {
											info = (Info) request.getAttribute("info");
											name = info.getName();
											age = info.getAge();
											exp = info.getExperience();
											place = info.getPlace();

											email = info.getEmail();
											phone = info.getPhone();
											img = info.getImage();
											description = info.getDescription();
											cv = info.getCv();
										}
									%>
									
									<div class="form-group">
										<label for="name">Họ tên</label><input type="text" id="name"
											value="<%=name%>" name="name" class="form-control" />
									</div>
									<div class="form-group">
										<label for="name">Tuổi</label> <input type="text" id="age"
											value="<%=age%>" name="age" class="form-control" />
									</div>
									<div class="form-group">
										<label for="name">Kinh nghiệm</label> <input type="text"
											id="exp" value="<%=exp%>" name="exp" class="form-control" />
									</div>
									<div class="form-group">
										<label for="name">Nơi ở</label> <input type="text" id="email"
											value="<%=place%>" name="email" class="form-control" />
									</div>
									<div class="form-group">
										<label for="name">Email</label> <input type="text" id="place"
											value="<%=email%>" name="place" class="form-control" />
									</div>
									<div class="form-group">
										<label for="name">Điện thoại</label> <input type="text"
											id="phone" value="<%=phone%>" name="phone"
											class="form-control" />
									</div>

									<div class="form-group">
										<label for="picture">Hình ảnh</label> <input type="file"
											name="picture" value="" src=" <%=request.getContextPath()%>/files/<%=img%>"/>
										<img width="200px" height="100px" alt=""
											src="<%=request.getContextPath()%>/files/<%=img%>">
									</div>
									<div class="form-group">
										<label for="picture">CV</label> <input type="text"
											value="<%=cv%>" name="cv" class="form-control" />
									</div>
									<div class="form-group">
										<label for="detail">Mô tả</label>
										<textarea id="detail" class="form-control" id="detail"
											rows="5" name="description"><%=description%></textarea>
									</div>
									<button type="submit" name="submit"
										class="btn btn-success btn-md">Cập nhật</button>
									<a class="return" onclick="quay_lai_trang_truoc()">Quay lại</a>
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
	document.getElementById("info").classList.add('active-menu');
</script>
<script>
	function quay_lai_trang_truoc() {
		history.back();
	}
</script>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/inc/footer.jsp"%>