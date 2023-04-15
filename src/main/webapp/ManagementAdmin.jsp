<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="include/Head.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="/WEB-INF/laydulieu"%>
<%@include file="../include/Header.jsp"%>
<body>

	<%@include file="UpdateAccountAdmin.jsp"%>
	<main class="main-banner ">
		<div class="container" style="margin-top: -7%; color: white;">
			<div>

				<h2>Quản lí tài khoản</h2>
				<button class="btncreate">Tạo tài khoản mới mới</button>
				<table class="table" style="margin-top: 3%; color: white;">
					<thead>
						<tr>
							<th>Mã tài khoản</th>
							<th>Tên tài khoản</th>
							<th>Tên đăng nhập</th>
							<th>Mật khẩu</th>
							<th>Email</th>
							<th>Loại tài khoản</th>
							<th>Chỉnh sửa</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="account" items="${f:getAllaccount()}">
							<tr>
								<td>${account.getId() }</td>
								<td>${account.getFullname() }</td>
								<td>${account.getUsername() }</td>
								<td>${account.getPassword() }</td>
								<td>${account.getEmail() }</td>
								<c:choose>
									<c:when test="${account.getRole() ==false}">
										<td>User</td>
									</c:when>
									<c:otherwise>
										<td>Admin</td>
									</c:otherwise>
								</c:choose>
								<td><c:choose>
										<c:when test="${account.getRole() ==false}">
											<button>
												<a href="SVDeleteAccountAdmin?id=${account.getId() }"
													style="color: red"> Xóa</a>
											</button>
											<a href="ManagementAccount.jsp?id=${account.getId()}">
												<button type="button">Cập nhật</button>
											</a>

										</c:when>
										<c:otherwise>
											<a href="ManagementAccount.jsp?id=${account.getId()}">
												<button type="button">Cập nhật</button>
											</a>
										</c:otherwise>
									</c:choose> <!-- <i class="fa fa-star-o"></i>
						<i class="fa fa-star-o"></i> --></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div style="margin-top: 10%">
				<h2>Quản lí sản phẩm</h2>
				<button class="btncreate">Tạo sản phẩm mới</button>
				<table class="table" style="margin-top: 3%; color: white;">
					<thead>
						<tr>
							<th>Mã sản phẩm</th>
							<th>Danh mục</th>
							<th>Tên sản phẩm</th>
							<th>Giá</th>
							<th>Người tạo</th>
							<th>Ngày tạo</th>
							<th>Mô tả</th>
							<th>Tình trạng</th>
							<th>Hình ảnh</th>
							<th>Chỉnh sửa</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="product" items="${f:getAllproduct()}">
							<tr>
								<td>${product.getId()}</td>
								<td>${product.getDanhmuc().getTendanhmuc()}</td>
								<td>${product.getName()}</td>
								<td>${product.getGia()}</td>
								<td>${product.getNguoitao().getFullname()}</td>
								<td>${product.getNgaytao()}</td>
								<td>${product.getMota()}</td>
								<td>${product.getTinhtrang()}</td>
								<td>><img src="${product.getHinhanh() }"></td>
								<td><button>
										<a href="" style="color: red"> Xóa</a>
									</button> <a href="">
										<button type="button">Cập nhật</button>
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div style="margin-top: 10%">
				<h2>Quản lí danh mục</h2>
				<button class="btncreate">Tạo danh mục mới</button>
				<table class="table" style="margin-top: 3%; color: white;">
					<thead>
						<tr>
							<th>Mã</th>
							<th>Tên danh mục</th>
							<th>Mô tả</th>
							<th>Chỉnh sửa</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>John</td>
							<td>Doe</td>
							<td>Doe</td>
							<td><button>
									<a href="" style="color: red"> Xóa</a>
								</button> <a href="">
									<button type="button">Cập nhật</button>
							</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</main>
	<%@include file="../include/Footer.jsp"%>
</body>