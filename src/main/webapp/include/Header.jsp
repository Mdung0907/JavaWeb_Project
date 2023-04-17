<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="header-area header-sticky wow slideInDown"
	data-wow-duration="0.75s" data-wow-delay="0s">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav class="main-nav">
					<a href="/MyWeb/index" class="logo"> </a>
					<ul class="nav">
						<c:choose>
							<c:when test="${Userlogin != 'true' }">
								<li><a href="/MyWeb/index" class="active">Trang chủ</a></li>
								<li><a href="/MyWeb/contact">Liên hệ</a></li>
								<li><div class="main-white-button">
										<a href="/MyWeb/login"> Đăng nhập</a>
									</div></li>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${AccountLogin.getRole() != true }">
										<li><a href="/MyWeb/index" class="active">Trang chủ</a></li>
										<li><a href="/MyWeb/category">Danh mục</a></li>
										<li><a href="/MyWeb/listing">Sản phẩm</a></li>
										<li><a href="/MyWeb/contact">Liên hệ</a></li>
										<li class="tm-nav-li"><a href="/MyWeb/information"
											class="tm-nav-link">${AccountLogin.getFullname()}</a></li>
										<li><div class="main-white-button">
												<a href="/MyWeb/logout"> Đăng xuất</a>
											</div></li>
									</c:when>
									<c:otherwise>
										<li><a href="/MyWeb/index" class="active">Trang chủ</a></li>
										<li><a href="/MyWeb/category">Danh mục</a></li>
										<li><a href="/MyWeb/listing">Sản phẩm</a></li>
										<li><a href="/MyWeb/contact">Liên hệ</a></li>
										<li class="tm-nav-li"><a href="/MyWeb/management"
											class="tm-nav-link">${AccountLogin.getFullname()}</a></li>
										<li><div class="main-white-button">
												<a href="/MyWeb/logout"> Đăng xuất</a>
											</div></li>
									</c:otherwise>
								</c:choose>

							</c:otherwise>
						</c:choose>
					</ul>
					<a class='menu-trigger'> <span>Menu</span>
					</a>
				</nav>
			</div>
		</div>
	</div>
</header>