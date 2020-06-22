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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import constant.CommonConstant;
import dao.CommentDAO;
import dao.EducationDAO;
import dao.InfoDAO;
import dao.ProjectCatDAO;
import dao.SkillDAO;
import model.Comment;
import model.Education;
import model.Info;
import model.ProjectCat;
import model.Skill;
import model.UserGuest;
import utils.FileUtil;

public class AdminCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminCommentController() {
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
		
		String cmname="";
		
		String comment="";
		int parent_id=0;
		if(request.getParameter("parent_id")!=null) {
			parent_id = Integer.parseInt(request.getParameter("parent_id"));
		}
		System.out.println(parent_id);
		if(request.getParameter("comment")!=null)
			comment = request.getParameter("comment");
		String id = request.getParameter("news_id");
		HttpSession session = request.getSession();
		UserGuest isUser = (UserGuest)session.getAttribute("userGuest");
		 cmname=isUser.getFullname();
		 SimpleDateFormat formatter = new SimpleDateFormat("dd-M-yyyy hh:mm:ss");
		if(!"".equals(comment)) {
			int addComment = commentDAO.addComment(id,cmname,comment,parent_id);
			out.print(" <li> <div class=\"media\">\r\n" + 
					"									<div class=\"media-left\">\r\n" + 
					"										<img class=\"media-object\" src=\""+request.getContextPath()+"/templates/public/blogpost/img/avatar.png\" alt=\"\">\r\n" + 
					"									</div>\r\n" + 
					"									\r\n" + 
					"										<div class=\"media-body\">\r\n" + 
					"										<div class=\"media-heading\">\r\n" + 
					"											<h4>"+isUser.getFullname()+"</h4>\r\n" + 
					"											<span class=\"time\">"+formatter.format(java.util.Calendar.getInstance().getTime())+"</span>\r\n" + 
					"										</div>\r\n" + 
					"										<p>"+comment+"</p>\r\n" + 
					"									</div>\r\n" + 
					"									\r\n" + 
					"								</div> </li>");
		} else {
			out.print("<div class=\"alert alert-warning\" role=\"alert\">\r\n" + 
					" Bạn chưa nhập bình luận!\r\n" + 
					"</div>");
		
		}
			
			
	}

}
