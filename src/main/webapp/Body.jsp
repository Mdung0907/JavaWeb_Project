<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="/WEB-INF/laydulieu"%>
<%@include file="include/Head.jsp"%>
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
	<div class="main-banner">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="top-text header-text">
						<h6>Hơn 36,500+ sản phẩm đang hoạt động</h6>
						<h2>Tìm kiếm các sản phẩm gần bạn</h2>
					</div>
				</div>
				<div class="col-lg-12">
					<form id="search-form" name="gs" method="get" role="search"
						action="index">
						<div class="row">
							<div class="col-lg-3 align-self-center" style="width: 33%">
								<fieldset>
									<input type="text" name="namekeyword" class="searchText"
										id="test" placeholder="Nhập tên cần tìm" autocomplete="on">
								</fieldset>
							</div>
	
							<div class="col-lg-3 align-self-center" style="width: 33%">
								<fieldset>
									<select name="price" class="form-select"
										aria-label="Default select example" id="chooseCategory"
										onchange="this.form.click()">
										<option value="">Mức giá</option>
										<option value="1000">Dưới 1.000.000vnđ</option>
										<option value="1000to5000">1.000.000-5.000.000vnđ</option>
										<option value="5000to10000">5.000.000-10.000.000vnđ</option>
										<option value="10000">Lớn hơn 10.000.000vnđ</option>
									</select>
								</fieldset>
							</div>
							<div class="col-lg-3" style="width: 33%; padding: 0">
								<fieldset>
									<button class="main-button" type="submit">
										<i class="fa fa-search"></i>Tìm kiếm
									</button>
								</fieldset>
							</div>
						</div>
					</form>
				</div>
				<div class="col-lg-10 offset-lg-1">
					<ul class="categories">
						<li><a href="index?danhmuc=2"><span class="icon"><img
									src="assets/images/search-icon-01.png" alt="Home"></span> Căn hộ</a></li>
						<li><a href="index?danhmuc=3"><span class="icon"><img
									src="assets/images/search-icon-02.png" alt="Ẩm thực"></span> Ẩm
								thực &amp; Đời sống</a></li>
						<li><a href="index?danhmuc=4"><span class="icon"><img
									src="assets/images/search-icon-03.png" alt="Vehicle"></span> Xe
								cộ</a></li>
						<li><a href="index?danhmuc=5"><span class="icon"><img
									src="assets/images/search-icon-04.png" alt="Mua sắm"></span> Mua
								sắm</a></li>
						<li><a href="index?danhmuc=6"><span class="icon"><img
									src="assets/images/search-icon-05.png" alt="Travel"></span> Du
								lịch</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-left: 8%">
		<a href="index?order=asc">
			<button style="border: none; font-size: 20px">Sắp xếp tăng
				dần</button>
		</a> <a href="index?order=desc">
			<button style="border: none; font-size: 20px">Sắp xếp giảm
				dần</button>
		</a>
	</div>

	<c:choose>
		<c:when test="${param.order!=null&&param.order=='asc' }">

			<c:set var="soluong" value="3"></c:set>
			<c:choose>

				<c:when test="${param.vitri == null}">
					<c:set var="vitri" value="0"></c:set>
				</c:when>
				<c:otherwise>
					<c:set var="vitri" value="${(param.vitri - 1)*3}"></c:set>
				</c:otherwise>
			</c:choose>
			<div class="recent-listing" style="margin-top: 0">
				<div class="container">
					<div class="row">
						<c:forEach var="product" items="${f:ascProduct()}">
							<div class="col-lg-12">
								<div class="owl-carousel owl-listing">
									<div class="item">
										<div class="row">
											<div class="col-lg-12">
												<div class="listing-item">
													<div class="left-image">
														<a href="#"><img src="${product.getHinhanh() }" alt=""></a>
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
																alt=""> Mô tả: ${product.getMota()}</li>

														</ul>
														<div class="main-white-button">
															<a href="Detail.jsp?id=${product.getId() }"><i
																class="fa fa-eye"></i> Chi tiết</a>
														</div>
													</div>
												</div>
											</div>

										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						<c:set var="tong" value="${f:demProductsearch(param.namekeyword)}"></c:set>
						<c:choose>
							<c:when test="${tong%3!=0 }">
								<c:set var="sotrang" value="${tong/3 + 1}"></c:set>

							</c:when>
							<c:otherwise>
								<c:set var="sotrang" value="${tong/3}"></c:set>
							</c:otherwise>
						</c:choose>
						<div style="display: flex">
							<c:forEach var="i" begin="1" end="${sotrang}" step="1">
								<a
									style="text-align: center; margin: auto; font-size: 22px; color: black; font-weight: 600"
									href="index?vitri=${i }">${i }</a>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>

		</c:when>
		<c:when test="${param.order!=null&&param.order=='desc' }">
			<c:set var="soluong" value="3"></c:set>
			<c:choose>

				<c:when test="${param.vitri == null}">
					<c:set var="vitri" value="0"></c:set>
				</c:when>
				<c:otherwise>
					<c:set var="vitri" value="${(param.vitri - 1)*3}"></c:set>
				</c:otherwise>
			</c:choose>
			<div class="recent-listing" style="margin-top: 0">
				<div class="container">
					<div class="row">
						<c:forEach var="product" items="${f:descProduct()}">
							<div class="col-lg-12">
								<div class="owl-carousel owl-listing">
									<div class="item">
										<div class="row">
											<div class="col-lg-12">
												<div class="listing-item">
													<div class="left-image">
														<a href="#"><img src="${product.getHinhanh() }" alt=""></a>
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
																alt=""> Mô tả: ${product.getMota()}</li>

														</ul>
														<div class="main-white-button">
															<a href="Detail.jsp?id=${product.getId() }"><i
																class="fa fa-eye"></i> Chi tiết</a>
														</div>
													</div>
												</div>
											</div>

										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						<c:set var="tong" value="${f:demProductsearch(param.namekeyword)}"></c:set>
						<c:choose>
							<c:when test="${tong%3!=0 }">
								<c:set var="sotrang" value="${tong/3 + 1}"></c:set>

							</c:when>
							<c:otherwise>
								<c:set var="sotrang" value="${tong/3}"></c:set>
							</c:otherwise>
						</c:choose>
						<div style="display: flex">
							<c:forEach var="i" begin="1" end="${sotrang}" step="1">
								<a
									style="text-align: center; margin: auto; font-size: 22px; color: black; font-weight: 600"
									href="index?vitri=${i }">${i }</a>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>

		</c:when>

		<c:otherwise>
			<c:choose>
				<c:when test="${param.danhmuc==null }">
					<c:choose>
						<c:when test="${param.namekeyword!=null }">
							<c:set var="soluong" value="3"></c:set>
							<c:choose>

								<c:when test="${param.vitri == null}">
									<c:set var="vitri" value="0"></c:set>
								</c:when>
								<c:otherwise>
									<c:set var="vitri" value="${(param.vitri - 1)*3}"></c:set>
								</c:otherwise>
							</c:choose>
							<div class="recent-listing" style="margin-top: 0">
								<div class="container">
									<div class="row">
										<c:forEach var="product"
											items="${f:getProductbyname(param.namekeyword)}">
											<div class="col-lg-12">
												<div class="owl-carousel owl-listing">
													<div class="item">
														<div class="row">
															<div class="col-lg-12">
																<div class="listing-item">
																	<div class="left-image">
																		<a href="#"><img src="${product.getHinhanh() }"
																			alt=""></a>
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
																				alt=""> Mô tả: ${product.getMota()}</li>

																		</ul>
																		<div class="main-white-button">
																			<a href="Detail.jsp?id=${product.getId() }"><i
																				class="fa fa-eye"></i> Chi tiết</a>
																		</div>
																	</div>
																</div>
															</div>

														</div>
													</div>
												</div>
											</div>
										</c:forEach>
										<c:set var="tong"
											value="${f:demProductsearch(param.namekeyword)}"></c:set>
										<c:choose>
											<c:when test="${tong%3!=0 }">
												<c:set var="sotrang" value="${tong/3 + 1}"></c:set>

											</c:when>
											<c:otherwise>
												<c:set var="sotrang" value="${tong/3}"></c:set>
											</c:otherwise>
										</c:choose>
										<div style="display: flex">
											<c:forEach var="i" begin="1" end="${sotrang}" step="1">
												<a
													style="text-align: center; margin: auto; font-size: 22px; color: black; font-weight: 600"
													href="index?vitri=${i }">${i }</a>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</c:when>
						<c:when test="${param.namekeyword==null&&param.price=='1000' }">
							<c:set var="soluong" value="3"></c:set>
							<c:choose>

								<c:when test="${param.vitri == null}">
									<c:set var="vitri" value="0"></c:set>
								</c:when>
								<c:otherwise>
									<c:set var="vitri" value="${(param.vitri - 1)*3}"></c:set>
								</c:otherwise>
							</c:choose>
							<div class="recent-listing" style="margin-top: 0">
								<div class="container">
									<div class="row">
										<c:forEach var="product"
											items="${f:getAllproductbyGia()}">
											<div class="col-lg-12">
												<div class="owl-carousel owl-listing">
													<div class="item">
														<div class="row">
															<div class="col-lg-12">
																<div class="listing-item">
																	<div class="left-image">
																		<a href="#"><img src="${product.getHinhanh() }"
																			alt=""></a>
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
																				alt=""> Mô tả: ${product.getMota()}</li>

																		</ul>
																		<div class="main-white-button">
																			<a href="Detail.jsp?id=${product.getId() }"><i
																				class="fa fa-eye"></i> Chi tiết</a>
																		</div>
																	</div>
																</div>
															</div>

														</div>
													</div>
												</div>
											</div>
										</c:forEach>
										<c:set var="tong"
											value="${f:demProductsearch(param.namekeyword)}"></c:set>
										<c:choose>
											<c:when test="${tong%3!=0 }">
												<c:set var="sotrang" value="${tong/3 + 1}"></c:set>

											</c:when>
											<c:otherwise>
												<c:set var="sotrang" value="${tong/3}"></c:set>
											</c:otherwise>
										</c:choose>
										<div style="display: flex">
											<c:forEach var="i" begin="1" end="${sotrang}" step="1">
												<a
													style="text-align: center; margin: auto; font-size: 22px; color: black; font-weight: 600"
													href="index?vitri=${i }">${i }</a>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</c:when>
						<c:when
							test="${param.price=='1000to5000' }">
							<c:set var="soluong" value="3"></c:set>
							<c:choose>

								<c:when test="${param.vitri == null}">
									<c:set var="vitri" value="0"></c:set>
								</c:when>
								<c:otherwise>
									<c:set var="vitri" value="${(param.vitri - 1)*3}"></c:set>
								</c:otherwise>
							</c:choose>
							<div class="recent-listing" style="margin-top: 0">
								<div class="container">
									<div class="row">
										<c:forEach var="product"
											items="${f:getAllproductbyGia()}">
											<div class="col-lg-12">
												<div class="owl-carousel owl-listing">
													<div class="item">
														<div class="row">
															<div class="col-lg-12">
																<div class="listing-item">
																	<div class="left-image">
																		<a href="#"><img src="${product.getHinhanh() }"
																			alt=""></a>
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
																				alt=""> Mô tả: ${product.getMota()}</li>

																		</ul>
																		<div class="main-white-button">
																			<a href="Detail.jsp?id=${product.getId() }"><i
																				class="fa fa-eye"></i> Chi tiết</a>
																		</div>
																	</div>
																</div>
															</div>

														</div>
													</div>
												</div>
											</div>
										</c:forEach>
										<c:set var="tong"
											value="${f:demProducttest()}"></c:set>
										<c:choose>
											<c:when test="${tong%3!=0 }">
												<c:set var="sotrang" value="${tong/3 + 1}"></c:set>

											</c:when>
											<c:otherwise>
												<c:set var="sotrang" value="${tong/3}"></c:set>
											</c:otherwise>
										</c:choose>
										<div style="display: flex">
											<c:forEach var="i" begin="1" end="${sotrang}" step="1">
												<a
													style="text-align: center; margin: auto; font-size: 22px; color: black; font-weight: 600"
													href="index?vitri=${i }">${i }</a>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</c:when>
						<c:when
							test="${param.namekeyword==null&&param.price=='5000to10000' }">
							<c:set var="soluong" value="3"></c:set>
							<c:choose>

								<c:when test="${param.vitri == null}">
									<c:set var="vitri" value="0"></c:set>
								</c:when>
								<c:otherwise>
									<c:set var="vitri" value="${(param.vitri - 1)*3}"></c:set>
								</c:otherwise>
							</c:choose>
							<div class="recent-listing" style="margin-top: 0">
								<div class="container">
									<div class="row">
										<c:forEach var="product"
											items="${f:getAllproductbyGia()}">
											<div class="col-lg-12">
												<div class="owl-carousel owl-listing">
													<div class="item">
														<div class="row">
															<div class="col-lg-12">
																<div class="listing-item">
																	<div class="left-image">
																		<a href="#"><img src="${product.getHinhanh() }"
																			alt=""></a>
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
																				alt=""> Mô tả: ${product.getMota()}</li>

																		</ul>
																		<div class="main-white-button">
																			<a href="Detail.jsp?id=${product.getId() }"><i
																				class="fa fa-eye"></i> Chi tiết</a>
																		</div>
																	</div>
																</div>
															</div>

														</div>
													</div>
												</div>
											</div>
										</c:forEach>
										<c:set var="tong"
											value="${f:demProductsearch(param.namekeyword)}"></c:set>
										<c:choose>
											<c:when test="${tong%3!=0 }">
												<c:set var="sotrang" value="${tong/3 + 1}"></c:set>

											</c:when>
											<c:otherwise>
												<c:set var="sotrang" value="${tong/3}"></c:set>
											</c:otherwise>
										</c:choose>
										<div style="display: flex">
											<c:forEach var="i" begin="1" end="${sotrang}" step="1">
												<a
													style="text-align: center; margin: auto; font-size: 22px; color: black; font-weight: 600"
													href="index?vitri=${i }">${i }</a>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</c:when>
						<c:when test="${param.namekeyword==null&&param.price=='10000' }">
							<c:set var="soluong" value="3"></c:set>
							<c:choose>

								<c:when test="${param.vitri == null}">
									<c:set var="vitri" value="0"></c:set>
								</c:when>
								<c:otherwise>
									<c:set var="vitri" value="${(param.vitri - 1)*3}"></c:set>
								</c:otherwise>
							</c:choose>
							<div class="recent-listing" style="margin-top: 0">
								<div class="container">
									<div class="row">
										<c:forEach var="product"
											items="${f:getAllproductbyGia()}">
											<div class="col-lg-12">
												<div class="owl-carousel owl-listing">
													<div class="item">
														<div class="row">
															<div class="col-lg-12">
																<div class="listing-item">
																	<div class="left-image">
																		<a href="#"><img src="${product.getHinhanh() }"
																			alt=""></a>
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
																				alt=""> Mô tả: ${product.getMota()}</li>

																		</ul>
																		<div class="main-white-button">
																			<a href="Detail.jsp?id=${product.getId() }"><i
																				class="fa fa-eye"></i> Chi tiết</a>
																		</div>
																	</div>
																</div>
															</div>

														</div>
													</div>
												</div>
											</div>
										</c:forEach>
										<c:set var="tong"
											value="${f:demProductsearch(param.namekeyword)}"></c:set>
										<c:choose>
											<c:when test="${tong%3!=0 }">
												<c:set var="sotrang" value="${tong/3 + 1}"></c:set>

											</c:when>
											<c:otherwise>
												<c:set var="sotrang" value="${tong/3}"></c:set>
											</c:otherwise>
										</c:choose>
										<div style="display: flex">
											<c:forEach var="i" begin="1" end="${sotrang}" step="1">
												<a
													style="text-align: center; margin: auto; font-size: 22px; color: black; font-weight: 600"
													href="index?vitri=${i }">${i }</a>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<c:set var="soluong" value="3"></c:set>
							<c:choose>
								<c:when test="${param.vitri == null}">
									<c:set var="vitri" value="0"></c:set>
								</c:when>
								<c:otherwise>
									<c:set var="vitri" value="${(param.vitri - 1)*3}"></c:set>
								</c:otherwise>
							</c:choose>
							<div class="recent-listing" style="margin-top: 0">
								<div class="container">
									<div class="row">
										<c:forEach var="product"
											items="${f:getAllProductPhanTrang(vitri, soluong)}">
											<div class="col-lg-12">
												<div class="owl-carousel owl-listing">
													<div class="item">
														<div class="row">
															<div class="col-lg-12">
																<div class="listing-item">
																	<div class="left-image">
																		<a href="#"><img src="${product.getHinhanh() }"
																			alt=""></a>
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
																				alt=""> Mô tả: ${product.getMota()}</li>

																		</ul>
																		<div class="main-white-button">
																			<a href="Detail.jsp?id=${product.getId() }"><i
																				class="fa fa-eye"></i> Chi tiết</a>
																		</div>
																	</div>
																</div>
															</div>

														</div>
													</div>
												</div>
											</div>
										</c:forEach>
										<c:set var="tong" value="${f:demProduct()}"></c:set>
										<c:choose>
											<c:when test="${tong%3!=0 }">
												<c:set var="sotrang" value="${tong/3 + 1}"></c:set>

											</c:when>
											<c:otherwise>
												<c:set var="sotrang" value="${tong/3}"></c:set>
											</c:otherwise>
										</c:choose>
										<div style="display: flex">
											<c:forEach var="i" begin="1" end="${sotrang}" step="1">
												<a
													style="text-align: center; margin: auto; font-size: 22px; color: black; font-weight: 600"
													href="index?vitri=${i }">${i }</a>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<c:set var="soluong" value="3"></c:set>
					<c:choose>

						<c:when test="${param.vitri == null}">
							<c:set var="vitri" value="0"></c:set>
						</c:when>
						<c:otherwise>
							<c:set var="vitri" value="${(param.vitri - 1)*3}"></c:set>
						</c:otherwise>
					</c:choose>
					<div class="recent-listing" style="margin-top: 0">
						<div class="container">
							<div class="row">
								<c:forEach var="product"
									items="${f:getAllproductbyDanhmuc(vitri, soluong,param.danhmuc)}">
									<div class="col-lg-12">
										<div class="owl-carousel owl-listing">
											<div class="item">
												<div class="row">
													<div class="col-lg-12">
														<div class="listing-item">
															<div class="left-image">
																<a href="#"><img src="${product.getHinhanh() }"
																	alt=""></a>
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
																		alt=""> Mô tả: ${product.getMota()}</li>

																</ul>
																<div class="main-white-button">
																	<a href="Detail.jsp?id=${product.getId() }"><i
																		class="fa fa-eye"></i> Chi tiết</a>
																</div>
															</div>
														</div>
													</div>

												</div>
											</div>
										</div>
									</div>
								</c:forEach>
								<c:set var="tong" value="${f:demProduct()}"></c:set>
								<c:choose>
									<c:when test="${tong%3!=0 }">
										<c:set var="sotrang" value="${tong/3 + 1}"></c:set>

									</c:when>
									<c:otherwise>
										<c:set var="sotrang" value="${tong/3}"></c:set>
									</c:otherwise>
								</c:choose>
								<div style="display: flex">
									<c:forEach var="i" begin="1" end="${sotrang}" step="1">
										<a
											style="text-align: center; margin: auto; font-size: 22px; color: black; font-weight: 600"
											href="index?vitri=${i }">${i }</a>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>













	<div class="popular-categories">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-heading">
						<h2>Danh mục phổ biến</h2>
						<h6>Check Them Out</h6>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="naccs">
						<div class="grid">
							<div class="row">
								<div class="col-lg-3">
									<div class="menu">
										<div class="first-thumb active">
											<div class="thumb">
												<span class="icon"><img
													src="assets/images/search-icon-01.png" alt=""></span> Căn hộ
											</div>
										</div>
										<div>
											<div class="thumb">
												<span class="icon"><img
													src="assets/images/search-icon-02.png" alt=""></span> Ẩm
												thực &amp; Đời sống
											</div>
										</div>
										<div>
											<div class="thumb">
												<span class="icon"><img
													src="assets/images/search-icon-03.png" alt=""></span> Xe cộ
											</div>
										</div>
										<div>
											<div class="thumb">
												<span class="icon"><img
													src="assets/images/search-icon-04.png" alt=""></span> Mua
												sắm
											</div>
										</div>
										<div class="last-thumb">
											<div class="thumb">
												<span class="icon"><img
													src="assets/images/search-icon-05.png" alt=""></span> Du
												lịch
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-9 align-self-center">
									<ul class="nacc">
										<li class="active">
											<div>
												<div class="thumb">
													<div class="row">
														<div class="col-lg-5 align-self-center">
															<div class="left-text">
																<h4>One Of The Most Trending Stuffs Right Now!</h4>
																<p>Plot Listing is a responsive Bootstrap 5 website
																	template that included 4 different HTML pages. This
																	template is provided by TemplateMo website. You can
																	apply this layout for your static or dynamic CMS
																	websites.</p>
																<div class="main-white-button">
																	<a href="#"><i class="fa fa-eye"></i> Discover More</a>
																</div>
															</div>
														</div>
														<div class="col-lg-7 align-self-center">
															<div class="right-image">
																<img src="assets/images/tabs-image-01.jpg" alt="">
															</div>
														</div>
													</div>
												</div>
											</div>
										</li>
										<li>
											<div>
												<div class="thumb">
													<div class="row">
														<div class="col-lg-5 align-self-center">
															<div class="left-text">
																<h4>Ẩm thực and Đời sốngtyle category is here</h4>
																<p>You can feel free to download, edit and apply
																	this template for your website. Please tell your
																	friends about TemplateMo website.</p>
																<div class="main-white-button">
																	<a href="#"><i class="fa fa-eye"></i> Explore More</a>
																</div>
															</div>
														</div>
														<div class="col-lg-7 align-self-center">
															<div class="right-image">
																<img src="assets/images/tabs-image-02.jpg"
																	alt="Ẩm thựcs on the table">
															</div>
														</div>
													</div>
												</div>
											</div>
										</li>
										<li>
											<div>
												<div class="thumb">
													<div class="row">
														<div class="col-lg-5 align-self-center">
															<div class="left-text">
																<h4>Best car rentals for your trips!</h4>
																<p>Did you know? You can get the best free HTML
																	templates on Too CSS blog. Visit the blog pages and
																	explore fresh and latest website templates.</p>
																<div class="main-white-button">
																	<a href="listing.html"><i class="fa fa-eye"></i>
																		More Listing</a>
																</div>
															</div>
														</div>
														<div class="col-lg-7 align-self-center">
															<div class="right-image">
																<img src="assets/images/tabs-image-03.jpg"
																	alt="Xe cộ in the city">
															</div>
														</div>
													</div>
												</div>
											</div>
										</li>
										<li>
											<div>
												<div class="thumb">
													<div class="row">
														<div class="col-lg-5 align-self-center">
															<div class="left-text">
																<h4>Mua sắm List: Images from Unsplash</h4>
																<p>Image credits go to Unsplash website that
																	provides free stock photos for anyone. Images used in
																	this Plot Listing template are from Unsplash.</p>
																<div class="main-white-button">
																	<a href="#"><i class="fa fa-eye"></i> Discover More</a>
																</div>
															</div>
														</div>
														<div class="col-lg-7 align-self-center">
															<div class="right-image">
																<img src="assets/images/tabs-image-04.jpg"
																	alt="Mua sắm Girl">
															</div>
														</div>
													</div>
												</div>
											</div>
										</li>
										<li>
											<div>
												<div class="thumb">
													<div class="row">
														<div class="col-lg-5 align-self-center">
															<div class="left-text">
																<h4>Information and Safety Tips for Du lịch</h4>
																<p>You are allowed to use this template for your
																	commercial websites. You are NOT allowed to
																	redistribute this template ZIP file on any Free CSS
																	collection websites.</p>
																<div class="main-white-button">
																	<a rel="nofollow" href="https://templatemo.com/contact"><i
																		class="fa fa-eye"></i> Read More</a>
																</div>
															</div>
														</div>
														<div class="col-lg-7 align-self-center">
															<div class="right-image">
																<img src="assets/images/tabs-image-05.jpg"
																	alt="Du lịch Beach">
															</div>
														</div>
													</div>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="recent-listing">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-heading">
						<h2>Các sản phẩm gần đây</h2>
						<h6>Check Them Out</h6>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="owl-carousel owl-listing">
						<div class="item">
							<div class="row">
								<div class="col-lg-12">
									<div class="listing-item">
										<div class="left-image">
											<a href="#"><img src="assets/images/listing-01.jpg"
												alt=""></a>
										</div>
										<div class="right-content align-self-center">
											<a href="#"><h4>1. First Apartment Unit</h4></a>
											<h6>by: Sale Agent</h6>
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
												</div> $450 - $950 / month with taxes</span> <span class="details">Details:
												<em>2760 sq ft</em>
											</span>
											<ul class="info">
												<li><img src="assets/images/listing-icon-02.png" alt="">
													4 Bedrooms</li>
												<li><img src="assets/images/listing-icon-03.png" alt="">
													4 Bathrooms</li>
											</ul>
											<div class="main-white-button">
												<a href="Contact.jsp"><i class="fa fa-eye"></i> Contact
													Now</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-12">
									<div class="listing-item">
										<div class="left-image">
											<a href="#"><img src="assets/images/listing-02.jpg"
												alt=""></a>
										</div>
										<div class="right-content align-self-center">
											<a href="#"><h4>2. Another House of Gaming</h4></a>
											<h6>by: Top Sale Agent</h6>
											<ul class="rate">
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li>(24) Reviews</li>
											</ul>
											<span class="price"><div class="icon">
													<img src="assets/images/listing-icon-01.png" alt="">
												</div> $1,400 - $3,500 / month with taxes</span> <span class="details">Details:
												<em>3650 sq ft</em>
											</span>
											<ul class="info">
												<li><img src="assets/images/listing-icon-02.png" alt="">
													4 Bedrooms</li>
												<li><img src="assets/images/listing-icon-03.png" alt="">
													3 Bathrooms</li>
											</ul>
											<div class="main-white-button">
												<a href="Contact.jsp"><i class="fa fa-eye"></i> Contact
													Now</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-12">
									<div class="listing-item">
										<div class="left-image">
											<a href="#"><img src="assets/images/listing-03.jpg"
												alt=""></a>
										</div>
										<div class="right-content align-self-center">
											<a href="#"><h4>3. Secret Place Hidden House</h4></a>
											<h6>by: Best Property</h6>
											<ul class="rate">
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li>(36) Reviews</li>
											</ul>
											<span class="price"><div class="icon">
													<img src="assets/images/listing-icon-01.png" alt="">
												</div> $1,500 - $3,600 / month with taxes</span> <span class="details">Details:
												<em>5500 sq ft</em>
											</span>
											<ul class="info">
												<li><img src="assets/images/listing-icon-02.png" alt="">
													4 Bedrooms</li>
												<li><img src="assets/images/listing-icon-03.png" alt="">
													3 Bathrooms</li>
											</ul>
											<div class="main-white-button">
												<a href="Contact.jsp"><i class="fa fa-eye"></i> Contact
													Now</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="row">
								<div class="col-lg-12">
									<div class="listing-item">
										<div class="left-image">
											<a href="#"><img src="assets/images/listing-04.jpg"
												alt=""></a>
										</div>
										<div class="right-content align-self-center">
											<a href="#"><h4>4. Sunshine Fourth Apartment</h4></a>
											<h6>by: Sale Agent</h6>
											<ul class="rate">
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li>(24) Reviews</li>
											</ul>
											<span class="price"><div class="icon">
													<img src="assets/images/listing-icon-01.png" alt="">
												</div> $3,600 / month with taxes</span> <span class="details">Details:
												<em>3660 sq ft</em>
											</span>
											<ul class="info">
												<li><img src="assets/images/listing-icon-02.png" alt="">
													5 Bedrooms</li>
												<li><img src="assets/images/listing-icon-03.png" alt="">
													3 Bathrooms</li>
											</ul>
											<div class="main-white-button">
												<a href="Contact.jsp"><i class="fa fa-eye"></i> Contact
													Now</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-12">
									<div class="listing-item">
										<div class="left-image">
											<a href="#"><img src="assets/images/listing-05.jpg"
												alt=""></a>
										</div>
										<div class="right-content align-self-center">
											<a href="#"><h4>5. Best House Of the Town</h4></a>
											<h6>by: Sale Agent</h6>
											<ul class="rate">
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li>(32) Reviews</li>
											</ul>
											<span class="price"><div class="icon">
													<img src="assets/images/listing-icon-01.png" alt="">
												</div> $5,600 / month with taxes</span> <span class="details">Details:
												<em>1750 sq ft</em>
											</span>
											<ul class="info">
												<li><img src="assets/images/listing-icon-02.png" alt="">
													6 Bedrooms</li>
												<li><img src="assets/images/listing-icon-03.png" alt="">
													3 Bathrooms</li>
											</ul>
											<div class="main-white-button">
												<a href="Contact.jsp"><i class="fa fa-eye"></i> Contact
													Now</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-12">
									<div class="listing-item">
										<div class="left-image">
											<a href="#"><img src="assets/images/listing-06.jpg"
												alt=""></a>
										</div>
										<div class="right-content align-self-center">
											<a href="#"><h4>6. Amazing Pool Party Villa</h4></a>
											<h6>by: Sale Agent</h6>
											<ul class="rate">
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li>(40) Reviews</li>
											</ul>
											<span class="price"><div class="icon">
													<img src="assets/images/listing-icon-01.png" alt="">
												</div> $3,850 / month with taxes</span> <span class="details">Details:
												<em>3660 sq ft</em>
											</span>
											<ul class="info">
												<li><img src="assets/images/listing-icon-02.png" alt="">
													4 Bedrooms</li>
												<li><img src="assets/images/listing-icon-03.png" alt="">
													3 Bathrooms</li>
											</ul>
											<div class="main-white-button">
												<a href="Contact.jsp"><i class="fa fa-eye"></i> Contact
													Now</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="row">
								<div class="col-lg-12">
									<div class="listing-item">
										<div class="left-image">
											<a href="#"><img src="assets/images/listing-05.jpg"
												alt=""></a>
										</div>
										<div class="right-content align-self-center">
											<a href="#"><h4>7. Sunny Apartment</h4></a>
											<h6>by: Sale Agent</h6>
											<ul class="rate">
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li>(24) Reviews</li>
											</ul>
											<span class="price"><div class="icon">
													<img src="assets/images/listing-icon-01.png" alt="">
												</div> $5,450 / month with taxes</span> <span class="details">Details:
												<em>1640 sq ft</em>
											</span>
											<ul class="info">
												<li><img src="assets/images/listing-icon-02.png" alt="">
													8 Bedrooms</li>
												<li><img src="assets/images/listing-icon-03.png" alt="">
													5 Bathrooms</li>
											</ul>
											<div class="main-white-button">
												<a href="Contact.jsp"><i class="fa fa-eye"></i> Contact
													Now</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-12">
									<div class="listing-item">
										<div class="left-image">
											<a href="#"><img src="assets/images/listing-02.jpg"
												alt=""></a>
										</div>
										<div class="right-content align-self-center">
											<a href="#"><h4>8. Third House of Gaming</h4></a>
											<h6>by: Sale Agent</h6>
											<ul class="rate">
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li>(15) Reviews</li>
											</ul>
											<span class="price"><div class="icon">
													<img src="assets/images/listing-icon-01.png" alt="">
												</div> $5,520 / month with taxes</span> <span class="details">Details:
												<em>1660 sq ft</em>
											</span>
											<ul class="info">
												<li><img src="assets/images/listing-icon-02.png" alt="">
													5 Bedrooms</li>
												<li><img src="assets/images/listing-icon-03.png" alt="">
													4 Bathrooms</li>
											</ul>
											<div class="main-white-button">
												<a href="Contact.jsp"><i class="fa fa-eye"></i> Contact
													Now</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-12">
									<div class="listing-item">
										<div class="left-image">
											<a href="#"><img src="assets/images/listing-06.jpg"
												alt=""></a>
										</div>
										<div class="right-content align-self-center">
											<a href="#"><h4>9. Relaxing BBQ Party Villa</h4></a>
											<h6>by: Sale Agent</h6>
											<ul class="rate">
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li><i class="fa fa-star-o"></i></li>
												<li>(20) Reviews</li>
											</ul>
											<span class="price"><div class="icon">
													<img src="assets/images/listing-icon-01.png" alt="">
												</div> $4,760 / month with taxes</span> <span class="details">Details:
												<em>2880 sq ft</em>
											</span>
											<ul class="info">
												<li><img src="assets/images/listing-icon-02.png" alt="">
													6 Bedrooms</li>
												<li><img src="assets/images/listing-icon-03.png" alt="">
													4 Bathrooms</li>
											</ul>
											<div class="main-white-button">
												<a href="Contact.jsp"><i class="fa fa-eye"></i> Contact
													Now</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- Scripts -->
	<%@include file="include/Script.jsp"%>
</body>