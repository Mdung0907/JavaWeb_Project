package com.fpltn.servlet;

import java.io.IOException;

import com.fpltn.dao.ProductDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SVDeleteProduct
 */
@WebServlet(urlPatterns = { "/DeleteProduct", "/DeleteProductAdmin" })
public class SVDeleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SVDeleteProduct() {
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
		switch (path) {
		case "/DeleteProduct":
			int id = Integer.parseInt(request.getParameter("id"));
			ProductDao.delete(id);
			response.sendRedirect("listing");
			break;

		case "/DeleteProductAdmin":
			int uid = Integer.parseInt(request.getParameter("id"));
			ProductDao.delete(uid);
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
