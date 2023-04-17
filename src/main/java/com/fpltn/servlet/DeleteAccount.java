package com.fpltn.servlet;

import java.io.IOException;

import com.fpltn.dao.AccountDao;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteAccount
 */
@WebServlet(urlPatterns = { "/Delete", "/DeleteAccountAdmin" })
public class DeleteAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteAccount() {
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
		String path = request.getServletPath();
		jakarta.servlet.http.HttpSession session = request.getSession();
		switch (path) {
		case "/Delete":
			int id = Integer.parseInt(request.getParameter("id"));
			AccountDao.delete(id);

			session.setAttribute("AccountLogin", null);
			session.setAttribute("Userlogin", false);
			response.sendRedirect("index.jsp");
			break;

		case "/DeleteAccountAdmin":
			int uid = Integer.parseInt(request.getParameter("id"));
			AccountDao.delete(uid);
			response.sendRedirect("management");
			break;
		default:
			break;
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
