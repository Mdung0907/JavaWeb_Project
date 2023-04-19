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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<div class="modal fade huhu" id="huhu" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Cập nhật sản
					phẩm</h5>
				<a href="listing">
					<button type="button" class="close" data-bs-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</a>
			</div>
			<div class="modal-body">
				<form action="ServletUpdate" method="post">
					<c:if test="${param.idproduct !=null}">
						<c:set var="item" value="${f:findProductbyId(param.idproduct)}"></c:set>
						<div class="form-group">
							<label for="exampleInputEmail1">Mã sản phẩm</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="id" placeholder="Tên"
								value="${item.getId() }" readonly="true">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Tên sản phẩm</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="name" placeholder="Tên"
								value="${item.getName() }" required>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Danh mục</label> <select
								name="dm" id="lang-select" style="width: 100%; height: 40px">
								<c:forEach var="danhmucitem" items="${f:getAlldanhmuc()}">
									<option value="${danhmucitem.id}">${danhmucitem.getTendanhmuc() }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Giá</label> <input type="text"
								class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="gia" placeholder="Nhập giá"
								value="${item.getGia() }" required>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Người tạo</label> <input
								class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="nguoitao" placeholder="Mô tả"
								value="${item.getNguoitao().getFullname() }" readonly="true"></input>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Ngày tạo</label> <input
								type="datetime" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="ngaytao" placeholder="Mô tả"
								value="${item.getNgaytao() }" readonly="true"></input>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Tình trạng</label> <input
								class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="tinhtrang"
								placeholder="Mô tả" value="${item.getTinhtrang() }" required></input>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Mô tả</label>
							<textarea class="form-control" id="exampleInputEmail1" required
								aria-describedby="emailHelp" name="mota" placeholder="Mô tả">${item.getMota() }</textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Hình ảnh</label> <input
								type="file" class="form-control" id="inputImage"
								aria-describedby="emailHelp" name="role"> <input
								type="hidden" id="srcImg" name="hinhanh"
								value="${item.getHinhanh() }"></input> <img style="width: 150px"
								src="${item.getHinhanh() }" id="imgload">
						</div>
					</c:if>
					<div class="modal-footer">
						<a href="listing">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Đóng</button>
						</a>
						<button type="submit" class="btn btn-primary">Lưu</button>
					</div>
				</form>
			</div>


		</div>
	</div>
</div>
<script>
	window.addEventListener("load", function() {
		let params = new URLSearchParams(window.location.search);
		var paramID = params.get("idproduct");
		var paramName = params.get("product");
		if (paramName != null && paramID != null) {
			$('.huhu').modal('show');
		}
	})
</script>
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



