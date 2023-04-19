<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="/WEB-INF/laydulieu"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<div class="modal fade xyz" id="exampleModal" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Tạo sản phẩm mới</h5>
				<button type="button" class="close" data-bs-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="SVAddproduct" method="post">
					<input type="hidden" name="jspPath"
						value="${pageContext.request.requestURI}" />
					<div class="form-group">
						<label for="exampleInputEmail1">Tên sản phẩm</label> <input
							type="text" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" name="name" placeholder="Tên" required>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Danh mục</label> <select name="dm"
							id="lang-select" style="width: 100%; height: 40px">
							<c:forEach var="item" items="${f:getAlldanhmuc()}">
								<option value="${item.id}">${item.getTendanhmuc() }</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Giá</label> <input type="text"
							class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" name="gia" placeholder="Nhập giá" required>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Mô tả</label>
						<textarea class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" name="mota" placeholder="Mô tả" required></textarea>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Hình ảnh</label> <input
							type="file" class="form-control" id="inputImage"
							aria-describedby="emailHelp" name="role" required> <input
							type="hidden" id="srcImg" name="hinhanh"></input >
							<img style="width:150px" src="" id="imgload">

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Đóng</button>
						<button type="submit" class="btn btn-primary">Lưu</button>
					</div>
				</form>
			</div>


		</div>
	</div>
</div>
<script>
	document.querySelector("#inputImage").addEventListener("change", readFile);

	function readFile() {
		const FR = new FileReader();
		FR.addEventListener("load", function(evt) {
			document.querySelector("#imgload").src = evt.target.result;
			document.querySelector("#srcImg").value = evt.target.result;
			/* alert(document.querySelector("#srcImg").value); */
		});
		FR.readAsDataURL(this.files[0]);
	}
</script>

