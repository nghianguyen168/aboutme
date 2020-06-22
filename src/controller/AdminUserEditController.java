package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import constant.CommonConstant;
import dao.EducationDAO;
import dao.InfoDAO;
import dao.NewsCatDAO;
import dao.ProjectCatDAO;
import dao.RoleDAO;
import dao.SkillDAO;
import dao.UserDAO;
import model.Education;
import model.Info;
import model.ProjectCat;
import model.Role;
import model.Skill;
import model.User;
import utils.AuthUtil;
import utils.FileUtil;
import utils.StringUtil;

public class AdminUserEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminUserEditController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		InfoDAO infoDAO = new InfoDAO();
		UserDAO userDAO = new UserDAO();
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath() + "/auth/login");
			return;
		}
		User userEdit = userDAO.getItemById(id);
		request.setAttribute("userEdit", userEdit);
		RoleDAO roleDAO = new RoleDAO();
		List<Role> roleList = roleDAO.getItem();
		request.setAttribute("roleList", roleList);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/useradmin/edit.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		UserDAO userDAO = new UserDAO();
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		String password = StringUtil.md5(request.getParameter("password"));
		String fullname = request.getParameter("fullname");
		int role_id = Integer.parseInt(request.getParameter("category"));
		if (request.getParameter("password").equals(userDAO.getItemById(id).getPassword())) {
			User user = new User(id, "", "", fullname, role_id);

			int updateUser = userDAO.updateNoPass(user);
			if (updateUser > 0) {
				response.sendRedirect(request.getContextPath() + "/admin/user/index?msg=" + CommonConstant.SUCCESS);
				return;
			} else {
				response.sendRedirect(request.getContextPath() + "/admin/user/edit?msg=" + CommonConstant.ERROR);
				return;
			}
		} else {
			User user = new User(id, "", password, fullname, role_id);
			int updateUser = userDAO.update(user);
			if (updateUser > 0) {
				response.sendRedirect(request.getContextPath() + "/admin/user/index?msg=" + CommonConstant.SUCCESS);
				return;
			} else {
				response.sendRedirect(request.getContextPath() + "/admin/user/edit?msg=" + CommonConstant.ERROR);
				return;
			}
		}
	}

}
