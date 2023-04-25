<%@include file="include/Head.jsp"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="f" uri="/WEB-INF/laydulieu"%>

<body>

	<!-- ***** Preloader Start ***** -->
	<div id="js-preloader" class="js-preloader">
		<div class="preloader-inner">
			<span class="dot"></span>
			<div class="dots">
				<span></span> <span></span> <span></span>
			</div>
		</div>
	</div>
	<!-- ***** Preloader End ***** -->

	<%@include file="include/Header.jsp"%>
	<%@include file="CreateProduct.jsp"%>
	<%@include file="UpdateProduct.jsp"%>
	<%@include file="ConfirmDeleteProduct.jsp"%>
	<div class="page-heading">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="top-text header-text">
						<h6>Danh sách sản phẩm của bạn</h6>
						<h2>Các sản phẩm với các danh mục khác nhau</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<button class="btncreate" style="margin-left: 7%"
		data-bs-toggle="modal" data-bs-target="#exampleModal">Tạo sản
		phẩm mới</button>
	<div class="recent-listing" style="margin-top: 0">
		<div class="container">
			<div class="row">
				<c:forEach var="product"
					items="${f:getAllproductbyAccount(AccountLogin.getId())}">
					<div class="col-lg-12">
						<div class="owl-carousel owl-listing">
							<div class="item">
								<div class="row">
									<div class="col-lg-12">
										<div class="listing-item">
											<div class="left-image">
												<a href="#"><img width="300px"
													style="height: auto; width: 300px"
													src="${product.getHinhanh() } " alt=""></a>
											</div>
											<div class="right-content align-self-center"
												style="padding: 0; margin-left: 30px">
												<a href="#"><h4>${product.getName()}</h4></a>
												<h6>by: ${product.getNguoitao().getFullname() }</h6>
												<ul class="rate">
													<li><i class="fa fa-star-o"></i></li>
													<li><i class="fa fa-star-o"></i></li>
													<li><i class="fa fa-star-o"></i></li>
													<li><i class="fa fa-star-o"></i></li>
													<li><i class="fa fa-star-o"></i></li>
													<li>(18) Reviews</li>
												</ul>
												<span class="price"><div class="icon">
														<img src="assets/images/listing-icon-01.png" alt="">
													</div> ${product.getGia()} vnđ</span> <span class="details">Danh
													mục: <em>${product.getDanhmuc().getTendanhmuc()}</em>
												</span>
												<ul class="info">
													<li><img src="assets/images/listing-icon-02.png"
														alt="">Mô tả: ${product.getMota() }</li>
												</ul>

												<div class="main-white-button">
													<a style="color: red"
														href="Listing.jsp?id=${product.getId() }"><i
														class="fa fa-eye"></i> Xóa</a> <a
														href="Listing.jsp?product=${product.getName() }&idproduct=${product.getId()}"><i
														class="fa fa-eye"></i> Chỉnh sửa</a>
												</div>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<%@include file="include/Footer.jsp"%>

	<!-- Scripts -->
	<%@include file="include/Script.jsp"%>
</body>