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
import dao.SkillDAO;
import model.Education;
import model.Info;
import model.NewsCat;
import model.ProjectCat;
import model.Skill;
import utils.AuthUtil;
import utils.DBConnectionUtil;
import utils.DefineUtil;
import utils.FileUtil;
import utils.StringUtil;

public class AdminNewsCatAddChildController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminNewsCatAddChildController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		InfoDAO infoDAO = new InfoDAO();
		NewsCatDAO newsCatDAO = new NewsCatDAO();
		List<NewsCat> newsCatList = newsCatDAO.getItems();
		request.setAttribute("newsCatList", newsCatList);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/newscat/index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		NewsCatDAO newsCatDAO = new NewsCatDAO();
		String childname = request.getParameter("newscatchild");
		int pid = Integer.parseInt(request.getParameter("pid"));
		
		 NewsCat checkTrungNewsCat = newsCatDAO.checkNewsCat(childname); 
		 if (checkTrungNewsCat != null) {
			String catChildErr = childname;
			request.setAttribute("catChildErr", catChildErr);
			InfoDAO infoDAO = new InfoDAO();
			List<NewsCat> newsCatList = newsCatDAO.getItems2();
			request.setAttribute("newsCatList", newsCatList);
			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/newscat/index.jsp?msg=" + CommonConstant.DOUBLECAT);
			rd.forward(request, response);
			return;
		} else {
		
			int addItem = newsCatDAO.addItem(pid,childname);
			if (addItem > 0) {
				response.sendRedirect(request.getContextPath() + "/admin/news/cat?msg=" + CommonConstant.SUCCESS);
				return;
			} else {
				response.sendRedirect(request.getContextPath() + "/admin/news/cat/add?msg=" + CommonConstant.ERROR);
				return;

			
		}
		}
	}

}
