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

public class AdminUserAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminUserAddController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RoleDAO roleDAO= new RoleDAO();
		List<Role> roleList = roleDAO.getItem();
		request.setAttribute("roleList", roleList);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/useradmin/add.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		UserDAO userDAO = new UserDAO();
		String username=request.getParameter("name");
		String password=StringUtil.md5(request.getParameter("password"));
		String fullname=request.getParameter("fullname");
		int role_id = Integer.parseInt(request.getParameter("category"));
		User user = new User(0, username, password, fullname, role_id);
		User checkTrungUser = userDAO.checkTrungUser(username);
		if(checkTrungUser!=null) {
			request.setAttribute("checkTrungUser", checkTrungUser);
			RoleDAO roleDAO= new RoleDAO();
			List<Role> roleList = roleDAO.getItem();
			request.setAttribute("roleList", roleList);
			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user/add.jsp?msg="+CommonConstant.DOUBLECAT);
			rd.forward(request, response);
		} else {
			int addItem= userDAO.addItem(user);
			if(addItem>0) {
				response.sendRedirect(request.getContextPath()+"/admin/user/index?msg="+CommonConstant.SUCCESS);
				return;
			} else {
				response.sendRedirect(request.getContextPath()+"/admin/user/add?msg="+CommonConstant.ERROR);
				return;
			}
		}
		
			
	}

}
