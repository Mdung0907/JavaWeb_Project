package com.fpltn.servlet;

import java.io.IOException;

import com.fpltn.dao.AccountDao;
import com.fpltn.entities.Account;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SVUpdateAccount
 */
public class SVUpdateAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SVUpdateAccount() {
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
		int id = Integer.parseInt(request.getParameter("id"));
		String usname = request.getParameter("username");
		String name = request.getParameter("fullname");
		boolean role = Boolean.parseBoolean(request.getParameter("role"));
		String pw = request.getParameter("password");
		String email = request.getParameter("email");

		Account acc = new Account(id, usname, pw, name, email, role);
		AccountDao.update(acc);
		response.sendRedirect("Logout.jsp");
		doGet(request, response);
	}

}
