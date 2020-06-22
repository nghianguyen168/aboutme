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
import dao.NewsCatDAO;
import dao.NewsDAO;
import dao.ProjectCatDAO;
import dao.SkillDAO;
import model.Comment;
import model.Education;
import model.Info;
import model.News;
import model.NewsCat;
import model.ProjectCat;
import model.Skill;
import utils.FileUtil;
import utils.StringUtil;

public class  PublicCatPhanTrangController	 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PublicCatPhanTrangController() {
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
		int cid=Integer.parseInt(request.getParameter("cid"));
		System.out.println(cid);
		NewsDAO newsDAO= new NewsDAO();
		List<News> newsListByCat = newsDAO.getListByCat(cid);
		NewsCatDAO newsCatDAO = new NewsCatDAO();
		if(newsListByCat.size()>4) {
			if(end>newsListByCat.size()) {
				end=newsListByCat.size();
			}
		for(int i=start;i<end;i++) {
			String urlSlug = request.getContextPath()+"/"+StringUtil.makeSlug(newsListByCat.get(i).getName())+"-"+newsListByCat.get(i).getId()+".html";
			String urlSlugCat = request.getContextPath()+"/tin-tuc/"+StringUtil.makeSlug(newsCatDAO.getItem(newsListByCat.get(i).getCat_id()).getName())+"-"+newsCatDAO.getItem(newsListByCat.get(i).getCat_id()).getId()+".html";
			out.print("<div class=\"col-md-12\">\r\n" + 
					"							<div class=\"post post-row\">\r\n" + 
					"								<a class=\"post-img\"\r\n" + 
					"									href=\""+request.getContextPath()+"/public/news/detail?id="+newsListByCat.get(i).getId()+"\"><img\r\n" + 
					"									src=\""+request.getContextPath()+"/files/"+newsListByCat.get(i).getPicture()+"\"\r\n" + 
					"									alt=\"\"></a>\r\n" + 
					"								<div class=\"post-body\">\r\n" + 
					"									<div class=\"post-meta\">\r\n" + 
					"										<a class=\"post-category cat-2\"\r\n" + 
					"											href=\""+urlSlugCat+"\">"+newsListByCat.get(i).getCat()+"</a>\r\n" + 
					"										<span class=\"post-date\">"+newsListByCat.get(i).getDate_create()+"</span>\r\n" + 
					"									</div>\r\n" + 
					"									<h3 class=\"post-title\">\r\n" + 
					"										<a\r\n" + 
					"											href=\""+urlSlug+"\">"+newsListByCat.get(i).getName()+"</a>\r\n" + 
					"									</h3>\r\n" + 
					"									<p>"+newsListByCat.get(i).getDescription()+"</p>\r\n" + 
					"								</div>\r\n" + 
					"							</div>\r\n" + 
					"						</div>");
		}
			
	}
	}
}
