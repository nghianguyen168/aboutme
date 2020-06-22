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

public class AdminNewsCatEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminNewsCatEditController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		NewsCatDAO newsCatDAO=new NewsCatDAO();
		int id = Integer.parseInt(request.getParameter("id"));
		NewsCat newsCat = newsCatDAO.getItem(id);
		request.setAttribute("newsCat", newsCat);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/newscat/edit.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		NewsCatDAO newsCatDAO=new NewsCatDAO();
		int id = Integer.parseInt(request.getParameter("id"));
		String name=request.getParameter("name");
		int editItem = newsCatDAO.editItem(id,name);
		if(editItem>0) {
			response.sendRedirect(request.getContextPath()+"/admin/news/cat?msg="+CommonConstant.SUCCESS);
			return;
		} else {
			response.sendRedirect(request.getContextPath()+"/admin/news/cat/edit?msg="+CommonConstant.ERROR);
			return;
		}
			
	}

}
