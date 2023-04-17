package com.fpltn.servlet;

import java.io.IOException;
import java.net.URLEncoder;

import com.fpltn.dao.AccountDao;
import com.fpltn.entities.Account;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SVRegister
 */
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Register() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (request.getCharacterEncoding() == null) {
			request.setCharacterEncoding("utf-8");
		}
		response.setContentType("text/json; charset=UTF-8");
		jakarta.servlet.http.HttpSession session = request.getSession();
		String name = request.getParameter("fullname");
		String usname = request.getParameter("user");
		Account acccc = AccountDao.findAccountbyname(usname);
		String pw = request.getParameter("password");
		String email = request.getParameter("email");
		if (acccc != null) {
			Account acc = new Account(usname, pw, name, email, false);
			AccountDao.saveAccount(acc);
			session.setAttribute("thongbao", null);
			response.sendRedirect("Login.jsp");
		} else {
			response.sendRedirect("login?message="+URLEncoder.encode("Tên đăng nhập đã tồn tại", "UTF-8"));
		}

		doGet(request, response);
	}

}
