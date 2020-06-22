package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.User;
import utils.StringUtil;

public class AdminLogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminLogoutController() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		if (session.getAttribute("user")!=null) {
			session.removeAttribute("user");
			//RequestDispatcher rd = request.getRequestDispatcher("/views/admin/index.jsp");
			//rd.forward(request, response);
			response.sendRedirect(request.getContextPath()+"/auth/login");
			return;
		} else {
			response.sendRedirect(request.getContextPath()+"/");
			return;
		}
	}

}
