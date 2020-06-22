package controller;	

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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
import model.News;
import model.NewsCat;
import model.ProjectCat;
import model.Skill;
import utils.AuthUtil;
import utils.FileUtil;
@WebServlet("/xuly-active")
public class AdminNewsActiveController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminNewsActiveController() {
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
		String img="";
		if(request.getParameter("img")!=null)
		 img = request.getParameter("img");
		String id=request.getParameter("idnews");
		
		System.out.println(img);
		System.out.println("id:"+id);
		NewsDAO newsDAO = new NewsDAO();
		
		if(img.equals(request.getContextPath()+"/templates/admin/assets/img/active1.png")) {
			img = request.getContextPath()+"/templates/admin/assets/img/deactive1.png";
			out.print(img);
			int sta=2;
			int editStatus = newsDAO.editItem(id,sta);
		} else {
			img = request.getContextPath()+"/templates/admin/assets/img/active1.png";
			int sta=1;
			int editStatus = newsDAO.editItem(id,sta);
			out.print(img);
		}
			
	}

}
