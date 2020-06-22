package controller;	

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import constant.CommonConstant;
import dao.CommentDAO;
import dao.EducationDAO;
import dao.InfoDAO;
import dao.NewsDAO;
import dao.ProjectCatDAO;
import dao.SkillDAO;
import model.Comment;
import model.Education;
import model.Info;
import model.News;
import model.ProjectCat;
import model.Skill;
import utils.FileUtil;
import utils.StringUtil;

public class  PublicPhanTrangController	 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PublicPhanTrangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		CommentDAO commentDAO = new CommentDAO();
		
		int start = Integer.parseInt(request.getParameter("start"));
		System.out.println(start);
		int end = start+4;
		System.out.println(end);
		NewsDAO newsDAO= new NewsDAO();
		List<News> newsList = newsDAO.getItemsActive();
		if(end>newsList.size()) {
			end=newsList.size();
		}
		for(int i=start;i<end;i++) {
			
			String urlSlug = request.getContextPath()+"/"+StringUtil.makeSlug(newsList.get(i).getName())+"-"+newsList.get(i).getId()+".html";
			
			out.print("<div class=\"col-md-6 col-lg-3 col-xs-12 blogBox\">\r\n" + 
					"						<div class=\"blog-entry\" style=\"height: 400px; margin-bottom: 20px;\">\r\n" + 
					"							<a href=\""+request.getContextPath()+"/public/news/detail?id=+"+newsList.get(i).getId()+"\"><img\r\n" + 
					"								src=\""+request.getContextPath()+"/files/"+newsList.get(i).getPicture()+"\"\r\n" + 
					"								alt=\"Image placeholder\" class=\"img-fluid\"></a>\r\n" + 
					"							<div class=\"blog-entry-text\">\r\n" + 
					"								<p >\r\n" + 
					"									<a style=\"size: 30px; font-weight:bold;\" href=\""+urlSlug+"\">"+newsList.get(i).getName()+"</a>\r\n" + 
					"								</p>\r\n" + 
					"							</div>\r\n" + 
					"						</div>\r\n" + 
					"					</div>");
		}
		
			
	}

}
