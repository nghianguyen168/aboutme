package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constant.CommonConstant;
import dao.CommentDAO;
import dao.ContactDAO;
import dao.EducationDAO;
import dao.InfoDAO;
import dao.NewsDAO;
import dao.ProjectCatDAO;
import dao.ProjectDAO;
import dao.SkillDAO;
import model.Comment;
import model.Contact;
import model.Education;
import model.Info;
import model.News;
import model.Project;
import model.ProjectCat;
import model.Skill;

public class PublicDetailNewsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PublicDetailNewsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NewsDAO newsDAO = new NewsDAO();
		CommentDAO commentDao = new CommentDAO();
		int id=Integer.parseInt(request.getParameter("id"));
		int updateView = newsDAO.updateViews(id);
		News news = newsDAO.getItem(id);
		request.setAttribute("news", news);
		int cat_id=news.getCat_id();
		List<News> newsListRelated = newsDAO.getListRelated(id,cat_id);
		request.setAttribute("newsListRelated", newsListRelated);
		List<News> newsListMost = newsDAO.getListMost(id);
		List<Comment> commentList = commentDao.getItems(id);
		request.setAttribute("commentList", commentList);
		request.setAttribute("newsListMost", newsListMost);
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/public/detail.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
