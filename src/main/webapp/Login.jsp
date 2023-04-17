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
		var validRegex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
		if (name == "") {
			alert('Họ và tên trống')
			return false;
		}
		if (username == "") {
			alert('Tên đăng nhập trống')
			return false;
		} else if (password == '') {
			alert('Mật khẩu trống')
			return false;
		} else if (password.length<6||password.length>12) {
			alert('Mật khẩu phải từ 6-12 kí tự')
			return false;
		} else if (confilm == '') {
			alert('Vui lòng nhập lại mật khẩu')
			return false;
		} else if (confilm != password) {
			alert('Nhập lại mật khẩu phải trùng với mật khẩu')
			return false;
		} else if (email == '') {
			alert('Email trống')
			return false;
		}
		 else {
			alert('Đăng kí thành công')
			return true;
		}
	}
	function Validatelogin() {
		var username = document.frmLogin.uname.value;
		var password = document.frmLogin.psw.value;
		if (username == "") {
			alert('Tên đăng nhập trống')
			return false;
		} else if (password == "") {
			alert('Mật khẩu trống')
			return false;
		} else {
			return true;
		}
	}
	function ValidateEmail(inputText)
	{
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	if(inputText.value.match(mailformat))
	{
	alert("Valid email address!");
	
	return true;
	}
	else
	{
	alert("You have entered an invalid email address!");
	
	return false;
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
					</div>
					<div class="group">
						<label for="pass" class="label">Mật khẩu</label> <input id="pass"
							type="password" class="input" data-type="password" name="psw">
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
					</div>
					<div class="group">
						<label for="user" class="label">Tên đăng nhập</label> <input
							id="user" type="text" class="input" name="user">
					</div>
					<div class="group">
						<label for="pass" class="label">Mật khẩu</label> <input id="pass"
							type="password" class="input" data-type="password"
							name="password">
					</div>
					<div class="group">
						<label for="pass" class="label">Nhập lại mật khẩu</label> <input
							id="passconfilm" type="password" class="input"
							data-type="password" name="confilm">
					</div>
					<div class="group">
						<label for="pass" class="label">Email</label> <input id="email"
							type="text" class="input" name="email">

					</div>
					<div class="group">
						<span id="testthongbao">${thongbao }</span>
					</div>
					<!-- 					<div class="group">
						<label for="pass" class="label">Giới tính</label> <input
							type="checkbox" id="vehicle2" name="gioitinhnam"> <label
							for="vehicle2">Nam</label><br> <input type="checkbox"
							id="vehicle3" name="gioitinhnu"> <label for="vehicle3">
							Nữ</label><br>
					</div> -->
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