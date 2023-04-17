package com.fpltn.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;

import com.fpltn.dao.AccountDao;
import com.fpltn.dao.DanhmucDao;
import com.fpltn.dao.ProductDao;
import com.fpltn.entities.Account;
import com.fpltn.entities.Danhmuc;
import com.fpltn.entities.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SVUpdateProduct
 */
@WebServlet(urlPatterns = { "/ServletUpdate", "/ServletUpdateAdmin" })
public class SVUpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SVUpdateProduct() {
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
		String path = request.getServletPath();
		switch (path) {
		case "/ServletUpdate": {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			int danhmuc = Integer.parseInt(request.getParameter("dm"));
			Danhmuc dm = DanhmucDao.findById(danhmuc);
			String gia = request.getParameter("gia");
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date ngaytao;
			String mota = request.getParameter("mota");
			String hinhanh = request.getParameter("hinhanh");
			try {
				ngaytao = formatter.parse(request.getParameter("ngaytao"));

				Product pro = new Product(id, name, dm, gia, (Account) session.getAttribute("AccountLogin"), ngaytao,
						mota, true, hinhanh);
				ProductDao.update(pro);

			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.sendRedirect("listing");
			break;
		}
		case "/ServletUpdateAdmin": {
			int pid = Integer.parseInt(request.getParameter("id"));
			String pname = request.getParameter("name");
			int pdanhmuc = Integer.parseInt(request.getParameter("dm"));
			int pnguoitao = Integer.parseInt(request.getParameter("nguoitao"));
			Account pnt = AccountDao.findById(pnguoitao);
			Danhmuc pdm = DanhmucDao.findById(pdanhmuc);
			String pgia = request.getParameter("gia");
			String pmota = request.getParameter("mota");
			String phinhanh = request.getParameter("hinhanh");
			SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd");
			Date ngaytao2;
			try {
				ngaytao2 = formatter2.parse(request.getParameter("ngaytao"));

				Product ppro = new Product(pid, pname, pdm, pgia, pnt,
						ngaytao2, pmota, true, phinhanh);
				ProductDao.update(ppro);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.sendRedirect("management");
			break;
		}
		}
		doGet(request, response);
	}

}
