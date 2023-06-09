<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="/WEB-INF/laydulieu"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Cập nhật thông
					tin</h5>
				<button type="button" class="close" data-bs-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="SVUpdateAccount" method="post">
					<c:if test="${param.id !=null}">
						<c:set var="item" value="${f:findAccountbyId(param.id)}"></c:set>
						<div class="form-group">
							<label for="exampleInputEmail1">ID</label> <input type="email"
								class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="id" 
								value="${item.getId() }" readonly="true">

						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Tên đăng nhập</label> <input
								type="email" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="username" 
								value="${item.getUsername() }" readonly="true">

						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Tên</label> <input type="text"
								class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="fullname"
								 value="${item.getFullname() }" required>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Mật khẩu</label> <input
								type="password" class="form-control" id="exampleInputPassword1"
								name="password" required
								value="${item.getPassword()}">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Email</label> <input type="email"
								class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="email" required
								value="${item.getEmail() }">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Loại tài khoản</label> <input
								type="email" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="role" placeholder="Email"
								value="${item.getRole() }" readonly="true">

						</div>
					</c:if>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Đóng</button>
						<button type="submit" class="btn btn-primary">Lưu</button>
					</div>
				</form>
			</div>


		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script>
	window.addEventListener("load", function() {
		let params = new URLSearchParams(window.location.search);
		var paramID = params.get("id");
		if (paramID != null) {
			$('#exampleModal').modal('show');
		}
	})
</script>
