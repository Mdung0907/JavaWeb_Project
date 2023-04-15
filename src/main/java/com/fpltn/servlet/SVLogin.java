package com.fpltn.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.fpltn.dao.AccountDao;
import com.fpltn.entities.Account;

/**
 * Servlet implementation class SVLogin
 */
public class SVLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SVLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String name = request.getParameter("uname");
		String ps = request.getParameter("psw");
		Account acc=AccountDao.getAccountbyUsname(name,ps);
		jakarta.servlet.http.HttpSession session = request.getSession();
		if(acc!=null) {
			session.setAttribute("AccountLogin", acc);
			session.setAttribute("Userlogin", true);
			response.sendRedirect("/MyWeb");
		}
		else {
			return;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
