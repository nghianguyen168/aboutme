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
import javax.servlet.http.Part;

import constant.CommonConstant;
import dao.EducationDAO;
import dao.InfoDAO;
import dao.NewsDAO;
import dao.ProjectCatDAO;
import dao.SkillDAO;
import model.Education;
import model.Info;
import model.News;
import model.ProjectCat;
import model.Skill;
import utils.FileUtil;

public class PublicNewsCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PublicNewsCatController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NewsDAO newsDAO = new NewsDAO();
		int id = Integer.parseInt(request.getParameter("id"));
		List<News> newsListByCat = newsDAO.getListByCat(id);
		System.out.println("list wc:"+newsListByCat.size());
		request.setAttribute("id", id);
		request.setAttribute("newsListByCat", newsListByCat);
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/public/cat.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			
	}

}
