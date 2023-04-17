<%@include file="include/Head.jsp"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>

	<%@include file="include/Header.jsp"%>

	<div class="page-heading">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="top-text header-text">
						<h6>Giữ liên lạc với chúng tôi</h6>
						<h2>Liên hệ với chúng tôi nếu bạn cần</h2>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="contact-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="inner-content">
						<div class="row">
							<div class="col-lg-6">
								<div id="map">
									<iframe
										src="https://maps.google.com/maps?q=Av.+L%C3%BAcio+Costa,+Rio+de+Janeiro+-+RJ,+Brazil&t=&z=13&ie=UTF8&iwloc=&output=embed"
										width="100%" height="650px" frameborder="0" style="border: 0"
										allowfullscreen></iframe>
								</div>
							</div>
							<div class="col-lg-6 align-self-center">
								<form id="contact" action="" method="get">
									<div class="row">
										<div class="col-lg-6">
											<fieldset>
												<input type="name" name="name" id="name" placeholder="Name"
													autocomplete="on" required>
											</fieldset>
										</div>
										<div class="col-lg-6">
											<fieldset>
												<input type="surname" name="surname" id="surname"
													placeholder="Surname" autocomplete="on" required>
											</fieldset>
										</div>
										<div class="col-lg-12">
											<fieldset>
												<input type="text" name="email" id="email"
													pattern="[^ @]*@[^ @]*" placeholder="Your Email" required>
											</fieldset>
										</div>
										<div class="col-lg-12">
											<ul>
												<li><input type="checkbox" name="option1" value="Xe cộ"><span>Xe
														cộ</span></li>
												<li><input type="checkbox" name="option2"
													value="aparmtents"><span>Căn hộs</span></li>
												<li><input type="checkbox" name="option3"
													value="Mua sắm"><span>Mua sắm</span></li>
												<li><input type="checkbox" name="option4"
													value="Ẩm thực"><span>Ẩm thực &amp; Đời sống</span></li>
												<li><input type="checkbox" name="option5"
													value="Du lịch"><span>Du lịch</span></li>
											</ul>
										</div>
										<div class="col-lg-12">
											<fieldset>
												<textarea name="message" type="text" class="form-control"
													id="message" placeholder="Message" required=""></textarea>
											</fieldset>
										</div>
										<div class="col-lg-12">
											<fieldset>
												<button type="submit" id="form-submit" class="main-button ">
													<i class="fa fa-paper-plane"></i> Send Message
												</button>
											</fieldset>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="include/Footer.jsp"%>


	<!-- Scripts -->
	<%@include file="include/Script.jsp"%>

</body>