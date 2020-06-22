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
import dao.CommentDAO;
import dao.EducationDAO;
import dao.InfoDAO;
import dao.NewsDAO;
import dao.ProjectCatDAO;
import dao.SkillDAO;
import model.Education;
import model.Info;
import model.ProjectCat;
import model.Skill;
import utils.AuthUtil;
import utils.FileUtil;

public class AdminNewsDelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public AdminNewsDelController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int curentPage=Integer.parseInt(request.getParameter("p"));
		NewsDAO newsDAO = new NewsDAO();
		CommentDAO commentDAO = new CommentDAO();
		int id = Integer.parseInt(request.getParameter("id"));
		 String dirPath = request.getServletContext().getRealPath("") + CommonConstant.DIR_UPLOAD;
			String filePath = dirPath + File.separator + newsDAO.getItem(id).getPicture();
			File file = new File(filePath);
			if(file.exists()) {
				file.delete();
	  
	  }
		int delItem=newsDAO.delItem(id);
		
		if(delItem>0) {
			int delComment = commentDAO.delItem(id); 
			response.sendRedirect(request.getContextPath()+"/admin/news/index?page="+curentPage+"&msg="+CommonConstant.SUCCESS);
			return;
		}else {
			response.sendRedirect(request.getContextPath()+"/admin/news/index?page="+curentPage+"&msg="+CommonConstant.ERROR);
					
			return;
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			
	}

}
