<%@include file="include/Head.jsp"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
	<%@include file="include/Header.jsp"%>
	<%@include file="UpdateAccount.jsp"%>
	<main class="main-banner ">

		<div class="container" style="margin-top: -10%; color: white;">
			<h2>Tài khoản của bạn</h2>
			<button class="btncreate">
				<a href="Delete?id=${AccountLogin.getId() }"
					style="color: red"> Xóa tài khoản</a>
			</button>
			<table class="table" style="margin-top: 3%; color: white;">
				<thead>
					<tr>
						<th>Tên tài khoản</th>
						<th>Tên đăng nhập</th>
						<th>Mật khẩu</th>
						<th>Email</th>
						<th>Chỉnh sửa</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${AccountLogin.getFullname()}</td>
						<td>${AccountLogin.getUsername()}</td>
						<td>${AccountLogin.getPassword()}</td>
						<td>${AccountLogin.getEmail()}</td>
						<td><a href="Information.jsp?id=${AccountLogin.getId()}">
								<button type="button">Cập nhật</button>
						</a></td>
					</tr>
				</tbody>
			</table>
		</div>

	</main>
	<%@include file="include/Footer.jsp"%>
</body>
