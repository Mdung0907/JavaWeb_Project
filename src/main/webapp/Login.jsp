<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<link rel="stylesheet" href="assets/css/Login.css">
<script type="text/javascript">
	function Validatedata() {
		var name = document.frmRegister.fullname.value;
		var username = document.frmRegister.user.value;
		var password = document.frmRegister.password.value;
		var confilm = document.frmRegister.confilm.value;
		var email = document.frmRegister.email.value;
		const thongbaospan = document.getElementById("testthongbao");
		if (name == "") {
			document.getElementById("errname").innerHTML = "Tên không được để trống"
			return false;
		}
		if (username == "") {
			document.getElementById("errusname").innerHTML = "Tên đăng nhập không được để trống"
			return false;
		} else if (password == '') {
			document.getElementById("errpass").innerHTML = "Mật khẩu không được để trống"
			return false;
		} else if (password.length<6||password.length>12) {
			document.getElementById("errpass").innerHTML = "Mật khẩu phải từ 6-12 kí tự"
			return false;
		} else if (confilm == '') {
			document.getElementById("errconfirm").innerHTML = "Nhập lại mật khẩu không được để trống"
			return false;
		} else if (confilm != password) {
			document.getElementById("errconfirm").innerHTML = "Nhập lại mật khẩu phải trùng với mật khẩu"
			return false;
		} else if (email == '') {	
			document.getElementById("errmail").innerHTML = "Email không được để trống"
			return false;

		} else {
			return true;
		}
	}
	function Validatelogin() {
		var username = document.frmLogin.uname.value;
		var password = document.frmLogin.psw.value;
		if (username == "") {
			document.getElementById("errusnamelogin").innerHTML = "Tên đăng nhập không được để trống"
			return false;
		} else if (password == "") {
			document.getElementById("errpasslogin").innerHTML = "Mật khẩu không được để trống"
			return false;
		} else {
			return true;
		}
	}
</script>
</head>
<body>
	<div class="login-wrap">
		<div class="login-html">
			<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label
				for="tab-1" class="tab">Đăng nhập</label> <input id="tab-2"
				type="radio" name="tab" class="sign-up"><label for="tab-2"
				class="tab">Đăng kí</label>
			<div class="login-form">
				<form class="sign-in-htm" name="frmLogin" action="SVLogin"
					method="post" onsubmit="return Validatelogin()">
					<div class="group">
						<label for="user" class="label">Tên đăng nhập</label> <input
							id="user" type="text" class="input" name="uname">
							<span id="errusnamelogin" style="color: red"></span>
					</div>
					<div class="group">
						<label for="pass" class="label">Mật khẩu</label> <input id="pass"
							type="password" class="input" data-type="password" name="psw">
							<span id="errpasslogin" style="color: red"></span>
					</div>
					<div class="group">
						<input id="check" type="checkbox" class="check" checked> <label
							for="check"><span class="icon"></span> Lưu mật khẩu</label>
					</div>
					<div class="group">
						<span style="color: red">${param.message }</span>
					</div>

					<div class="group">
						<input type="submit" class="button" value="Đăng nhập">
					</div>
					<div class="hr"></div>
					<div class="foot-lnk">
						<a href="#forgot">Quên mật khẩu?</a>
					</div>
				</form>
				<form class="sign-up-htm" name="frmRegister" action="Register"
					method="post" onsubmit="return Validatedata()">
					<div class="group">
						<label for="fulname" class="label">Họ và tên</label> <input
							id="fullname" type="text" class="input" name="fullname">
						<span id="errname" style="color: red"></span>
					</div>
					<div class="group">
						<label for="user" class="label">Tên đăng nhập</label> <input
							id="user" type="text" class="input" name="user"> <span
							id="errusname" style="color: red"></span>
					</div>
					<div class="group">
						<label for="pass" class="label">Mật khẩu</label> <input id="pass"
							type="password" class="input" data-type="password"
							name="password"> <span id="errpass" style="color: red"></span>
					</div>
					<div class="group">
						<label for="pass" class="label">Nhập lại mật khẩu</label> <input
							id="passconfilm" type="password" class="input"
							data-type="password" name="confilm"> <span id="errconfirm"
							style="color: red"></span>
					</div>
					<div class="group">
						<label for="pass" class="label">Email</label> <input id="email"
							type="email" class="input" name="email"> <span
							id="errmail" style="color: red"></span>
					</div>
					<c:if test="${thongbao==true }">
						<div class="group">
							<span style="color: red" id="testthongbao">Tên đăng nhập
								đã tồn tại</span>
						</div>
					</c:if>

					<div class="group">
						<button type="submit" class="button">Đăng kí</button>
					</div>
					<div class="foot-lnk">
						<a href="Login.jsp">Bạn đã có tài khoản</a>

					</div>
				</form>
			</div>
		</div>
	</div>

</body>