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

public class  PublicCommentLoadMoreController	 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PublicCommentLoadMoreController() {
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
		SimpleDateFormat formatter = new SimpleDateFormat("dd-M-yyyy hh:mm:ss");
		int start = Integer.parseInt(request.getParameter("start"));
		System.out.println(start);
		int end = start+5;
		System.out.println(end);
		int nid=Integer.parseInt(request.getParameter("nid"));
		System.out.println("nid"+nid);
		NewsDAO newsDAO= new NewsDAO();
		
		 List<Comment> commentList = commentDAO.getItems(nid);
		 if(end>commentList.size()) { end=commentList.size(); }
		 for(int i=start;i<end;i++) {
			 out.print("<div style=\"margin-left: 18px;\">\r\n" + 
			 		"									<div class=\"media-left\">\r\n" + 
			 		"										<img class=\"media-object\" src=\""+request.getContextPath()+"/templates/public/blogpost//img/avatar.png\" alt=\"\">\r\n" + 
			 		"									</div>\r\n" + 
			 		"										<div class=\"media-body\">\r\n" + 
			 		"										<div class=\"media-heading\">\r\n" + 
			 		"											<h4>"+commentList.get(i).getName()+"</h4>\r\n" + 
			 		"											<span class=\"time\">"+formatter.format(commentList.get(i).getTime())+"</span>\r\n" + 
			 		"											<a href=\"#\" class=\"reply\">Reply</a>\r\n" + 
			 		"										</div>\r\n" + 
			 		"										<p>"+commentList.get(i).getComment()+"</p>\r\n" + 
			 		"									</div>\r\n" + 
			 		"									</div>");
		 }
		 
		
			
	}

}
