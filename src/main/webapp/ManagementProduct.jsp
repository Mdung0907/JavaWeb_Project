<%@include file="/include/Head.jsp"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
	<%@include file="/include/Header.jsp"%>
	<main class="main-banner ">

		<div class="container" style="margin-top: -10%; color: white;">
			<h2>Quản lí sản phẩm</h2>
			<button class="btncreate">Tạo sản phẩm mới</button>
			<table class="table" style="margin-top: 3%; color: white;">
				<thead>
					<tr>
						<th>STT</th>
						<th>Mã sản phẩm</th>
						<th>Danh mục</th>
						<th>Tên sản phẩm</th>
						<th>Giá</th>
						<th>Số lượng</th>
						<th>Người tạo</th>
						<th>Ngày tạo</th>
						<th>Tình trạng</th>
						<th>Mô tả</th>
						<th>Chỉnh sửa</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>John</td>
						<td>Doe</td>
						<td>john@example.com</td>
						<td>John</td>
						<td>Doe</td>
						<td>john@example.com</td>
						<td>John</td>
						<td>John</td>
						<td>Doe</td>
						<td>john@example.com</td>
						<td>
						<i class="fa fa-star-o"></i>
						<i class="fa fa-star-o"></i>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

	</main>
	<%@include file="/include/Footer.jsp"%>
</body>
