package com.fpltn.servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/category", "/login", "/contact", "/detail", "/index", "/management", "/information",
		"/logout", "/listing" })
public class HomeController extends HttpServlet {

	private static final long serialVersionUID = 8509554900990908773L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String path = req.getServletPath();
		switch (path) {
		case "/category":
			doGetCategory(req, resp);
			break;

		case "/login":
			doGetLogin(req, resp);
			break;

		case "/contact":
			doGetContact(req, resp);
			break;

		case "/detail":
			doGetDetail(req, resp);
			break;

		case "/index":
			doGetIndex(req, resp);
			break;

		case "/management":
			doGetManagement(req, resp);
			break;

		case "/information":
			doGetInfo(req, resp);
			break;

		case "/listing":
			doGetListing(req, resp);
			break;

		case "/logout":
			doGetLogout(req, resp);
			break;
		default:
			break;
		}
	}

	private void doGetLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("Login.jsp");
		requestDispatcher.forward(req, resp);
	}

	private void doGetInfo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("Information.jsp");
		requestDispatcher.forward(req, resp);
	}

	private void doGetContact(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("Contact.jsp");
		requestDispatcher.forward(req, resp);
	}

	private void doGetDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("Detail.jsp");
		requestDispatcher.forward(req, resp);
	}

	private void doGetIndex(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("index.jsp");
		requestDispatcher.forward(req, resp);
	}

	private void doGetLogout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("Logout.jsp");
		requestDispatcher.forward(req, resp);
	}

	private void doGetManagement(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("ManagementAdmin.jsp");
		requestDispatcher.forward(req, resp);
	}

	private void doGetCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("Category.jsp");
		requestDispatcher.forward(req, resp);
	}

	private void doGetListing(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("Listing.jsp");
		requestDispatcher.forward(req, resp);
	}

}
