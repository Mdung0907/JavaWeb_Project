<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<%
	session = request.getSession();
	session.setAttribute("Userlogin", "false");
	session.setAttribute("AccountLogin", "null");
%>

<c:redirect url="index.jsp"></c:redirect>
    