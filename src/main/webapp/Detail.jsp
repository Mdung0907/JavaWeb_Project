<%@include file="include/Head.jsp"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="/WEB-INF/laydulieu"%>
<body>
	<%@include file="include/Header.jsp"%>
	<main class="main-banner ">
		<!-- Main Section-->
		<section id="main-section"
			class="main-section container-full mx-auto d-flex" style="margin-top: -100px">
			<section class="product-selected w-100 d-flex">
				<c:set var="product" value="${f:findProductbyId(param.id)}"></c:set>
					<div class="product-preview">
						<div class="product-presentation d-flex">
							<div
								class="product-display d-flex align-items-center position-relative">
								<div class="product-height d-flex align-items-center">

									<div class="line position-relative">
										<div class="line-top position-absolute"></div>
										<div class="line-center"></div>
										<div class="line-bottom position-absolute"></div>
									</div>
								</div>
								<img style="width: 600px" src="${product.getHinhanh() }"
									class="product-photo" /> <a href="#"> </a>
							</div>
						</div>
					</div>

					<div class="product-description" style="margin-left: 5%">
						<div class="product-summary-container">
							<h1 class="product-type">${product.getName() }</h1>
							<p style="font-size: 20px" class="product-text-description">
								${product.getMota() }. 
							</p>
						</div>
						 <div class="product-options d-flex align-items-center">
							<a href="#"
								class="option-btn d-flex align-items-center border-light"> <svg
									xmlns="http://www.w3.org/2000/svg" height="20"
									viewBox="0 0 24 24" width="20">
									<path d="M0 0h24v24H0z" fill="none" />
									<path
										d="M20 8h-3V4H3c-1.1 0-2 .9-2 2v11h2c0 1.66 1.34 3 3 3s3-1.34 3-3h6c0 1.66 1.34 3 3 3s3-1.34 3-3h2v-5l-3-4zM6 18.5c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5 1.5.67 1.5 1.5-.67 1.5-1.5 1.5zm13.5-9l1.96 2.5H17V9.5h2.5zm-1.5 9c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5 1.5.67 1.5 1.5-.67 1.5-1.5 1.5z" />
								</svg> Shipping
							</a> <a href="#"
								class="option-btn d-flex align-items-center border-light"> <svg
									xmlns="http://www.w3.org/2000/svg" height="24"
									viewBox="0 0 24 24" width="24">
									<path d="M0 0h24v24H0z" fill="none" />
									<path
										d="M20 4H4v2h16V4zm1 10v-2l-1-5H4l-1 5v2h1v6h10v-6h4v6h2v-6h1zm-9 4H6v-4h6v4z" />
								</svg> Stock
							</a> <a href="#"
								class="option-btn d-flex align-items-center border-light"> <svg
									xmlns="http://www.w3.org/2000/svg" height="24"
									viewBox="0 0 24 24" width="24">
									<path d="M0 0h24v24H0z" fill="none" />
									<path
										d="M21 6H3c-1.1 0-2 .9-2 2v8c0 1.1.9 2 2 2h18c1.1 0 2-.9 2-2V8c0-1.1-.9-2-2-2zm0 10H3V8h2v4h2V8h2v4h2V8h2v4h2V8h2v4h2V8h2v8z" />
								</svg> Dimensions
							</a>
						</div> 
						<div class="product-price d-flex align-items-center">
							<p style="font-size: 30px" class="price">${product.getGia() } vnđ</p>
							<button
								class="add-cart-btn rounded-pill d-flex align-items-center justify-content-between">
								Thêm vào giỏ hàng<span
									class="features-btn rounded-circle d-flex align-items-center justify-content-center">
									<svg class="rounded-circle" xmlns="http://www.w3.org/2000/svg"
										height="16" viewBox="0 0 24 24" width="16">
										<path d="M0 0h24v24H0z" fill="none" />
										<path d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z" />
									</svg>
								</span>
							</button>
						</div>
					</div>
				
			</section>
			</section>
	</main>
	<%@include file="include/Footer.jsp"%>
</body>