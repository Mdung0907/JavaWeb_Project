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
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	
<div class="modal fade abc" id="abc" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Cập nhật thông
					tin</h5>
				<a href="management">
					<button type="button" class="close" data-bs-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</a>
			</div>
			<div class="modal-body">
				<form action="SVUpdateAccountAdmin" method="post">
					<c:if test="${param.accid !=null}">
						<c:set var="item" value="${f:findAccountbyId(param.accid)}"></c:set>
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
								required value="${item.getFullname() }">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Mật khẩu</label> <input
								type="password" class="form-control" id="exampleInputPassword1"
								name="password" 
								value="${item.getPassword()}" required>
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
								value="${item.getRole() }">

						</div>
					</c:if>
					<div class="modal-footer">
						<a href="management">
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
		var paramID = params.get("accid");
		var paramName = params.get("account");
		if (paramName != null && paramID!=null) {
			
			$('.abc').modal('show');
		}
	})
</script>
