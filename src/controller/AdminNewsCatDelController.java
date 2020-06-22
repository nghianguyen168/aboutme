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
import dao.NewsDAO;
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

public class AdminNewsCatDelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminNewsCatDelController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		NewsCatDAO newsCatDAO= new NewsCatDAO();
		NewsDAO newsDAO = new NewsDAO();
		int id = Integer.parseInt(request.getParameter("id"));
		int delItem = newsCatDAO.delItem(id);
		if(delItem>0) {
			int delChildCat = newsCatDAO.delChildItem(id);
			int delNews = newsDAO.delItemByCid(id);
			response.sendRedirect(request.getContextPath()+"/admin/news/cat?msg="+CommonConstant.SUCCESS);
			return;
		} else {
			response.sendRedirect(request.getContextPath()+"/admin/news/cat?msg="+CommonConstant.ERROR);
			return;
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
			
	}

}
