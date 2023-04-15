/**
 * 
 */
function Validate(){
	 var username= request.getParameter("user");
	 alert(username)
 	e.preventDefault();
	var username=document.addEventListener('click')
	let password=document.getElementById('pass').value
	let confilmpassword=document.getElementById('passconfilm').value
	let email=document.getElementById('email').value
	alert(username)
	if(username==""){
		alert(username)
		alert(username)
	}else if(password==''){
		alert('Mật khẩu trống')
	}else if(confilmpassword==''){
		alert('Vui lòng nhập lại mật khẩu')
	}else if(confilmpassword!=password){
		alert('Nhập lại mật khẩu phải trùng với mật khẩu')
	}else if(email==''){
		alert('Email trống')
	}else{
		alert('Ok')
	}
}
function Getvalue(e){
	console.log('abc')
	let a=e.target.value;
	console.log(a)
}