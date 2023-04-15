<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<form style="width: 40%;margin: auto">
  <div class="form-group">
    <label for="exampleInputEmail1">Tên sản phẩm</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
  </div>
  <div class="form-group">
  <label for="exampleInputEmail1">Danh mục</label>
      <select id="select" name="select" class="custom-select">
        <option value="rabbit">Rabbit</option>
        <option value="duck">Duck</option>
        <option value="fish">Fish</option>
      </select>
    </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Giá bán</label>
    <input type="number" class="form-control" id="exampleInputPassword1">
  </div>
    <div class="form-group">
    <label for="exampleInputPassword1">Số lượng</label>
    <input type="number" class="form-control" id="exampleInputPassword1" >
  </div>
    <div class="form-group">
    <label for="exampleInputPassword1">Mô tả</label>
    <textarea class="form-control" id="exampleInputPassword1" ></textarea>
  </div>
  <button type="submit" class="btn btn-primary">Xác nhận</button>
</form>
</body>
</html>