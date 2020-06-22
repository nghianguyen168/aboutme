	package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import constant.CommonConstant;
import dao.EducationDAO;
import dao.InfoDAO;
import dao.ProjectCatDAO;
import dao.ProjectDAO;
import dao.SkillDAO;
import dao.UserGuestDAO;
import model.Education;
import model.Info;
import model.Project;
import model.ProjectCat;
import model.Skill;
import model.User;
import model.UserGuest;
import utils.StringUtil;

public class PublicLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public int id = 0;

	public PublicLoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("id")!=null) {
			id = Integer.parseInt(request.getParameter("id"));
		}
		RequestDispatcher rd = request.getRequestDispatcher("/views/public/guest_login.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		UserGuestDAO userGuestDAO = new UserGuestDAO();
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String pass = request.getParameter("password");
		String password = StringUtil.md5(pass);
		UserGuest userGuest = userGuestDAO.checkUser(username, password);
		if (userGuest != null) {
			HttpSession session = request.getSession();
			session.setAttribute("userGuest", userGuest);

			if (id != 0) {
				response.sendRedirect(request.getContextPath() + "/public/news/detail?id=" + id);
			} else {
				response.sendRedirect(request.getContextPath() + "/public/news/cat?id=1");
			}
			return;
		} else {
			User userErr = new User(0, username, pass, 0);
			request.setAttribute("userErr", userErr);

			RequestDispatcher rd = request
					.getRequestDispatcher("/views/public/guest_login.jsp?msg="+CommonConstant.ERROR);
			rd.include(request, response);
		}
	}

}
