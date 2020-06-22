package controller;

import java.io.File;
import java.io.IOException;
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
import dao.ProjectCatDAO;
import dao.ProjectDAO;
import dao.SkillDAO;
import model.Education;
import model.Info;
import model.ProjectCat;
import model.Skill;
import utils.AuthUtil;
import utils.DBConnectionUtil;
import utils.FileUtil;
import utils.StringUtil;

public class AdminProjectDelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminProjectDelController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		ProjectDAO projectDAO = new ProjectDAO();
		
		int id=Integer.parseInt(request.getParameter("id"));
		int delProject= projectDAO.delItem(id);
		
		if(delProject>0) {
			response.sendRedirect(request.getContextPath()+"/admin/project/index?msg="+CommonConstant.SUCCESS);
			return;
		} else {
			response.sendRedirect(request.getContextPath()+"/admin/project/index?msg="+CommonConstant.ERROR);
			return;
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProjectDAO projectDAO = new ProjectDAO();
		int id=Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		int delProject= projectDAO.delItem(id); 
		
		}
		
		
		

}
