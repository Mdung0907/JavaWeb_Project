package com.fpltn.servlet;

import java.io.IOException;
import java.util.Date;

import com.fpltn.dao.DanhmucDao;
import com.fpltn.dao.ProductDao;
import com.fpltn.entities.Account;
import com.fpltn.entities.Danhmuc;
import com.fpltn.entities.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SVAddproduct
 */
public class SVAddproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SVAddproduct() {
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
		jakarta.servlet.http.HttpSession session = request.getSession();
		String name = request.getParameter("name");
		int danhmuc = Integer.parseInt(request.getParameter("dm"));
		Danhmuc dm = DanhmucDao.findById(danhmuc);
		String gia = request.getParameter("gia");
		String mota = request.getParameter("mota");
		String hinhanh = request.getParameter("hinhanh");
		Date newdate = new Date();
		Product pro = new Product(name, dm, gia, (Account) session.getAttribute("AccountLogin"), newdate, mota, true,
				hinhanh);
		ProductDao.saveProduct(pro);
		String uri = request.getParameter("jspPath");
		response.sendRedirect(uri);
		doGet(request, response);
	}

}
