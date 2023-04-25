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
<div class="modal fade delete" id="exampleModal" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Xóa sản phẩm</h5>
				<button type="button" class="close" data-bs-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<c:choose>
				<c:when test="${param.ischeck=='admin' }">
					<div class="modal-body">
						<form action="DeleteProductAdmin?id=${param.id}" method="post">
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Đóng</button>
								<button type="submit" class="btn btn-primary">Xóa</button>
							</div>
						</form>
					</div>
				</c:when>
				<c:otherwise>
					<div class="modal-body">
						<form action="DeleteProduct?id=${param.id}" method="post">
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Đóng</button>
								<button type="submit" class="btn btn-primary">Xóa</button>
							</div>
						</form>
					</div>
				</c:otherwise>
			</c:choose>

		</div>
	</div>
</div>
<script>
	window.addEventListener("load", function() {
		let params = new URLSearchParams(window.location.search);
		var paramID = params.get("id");
		if (paramID != null) {
			$('.delete').modal('show');
		}
	})
</script>

