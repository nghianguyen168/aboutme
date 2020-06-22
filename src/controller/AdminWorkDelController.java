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
import dao.SkillDAO;
import dao.WorkDAO;
import model.Education;
import model.Info;
import model.ProjectCat;
import model.Skill;
import utils.AuthUtil;
import utils.DBConnectionUtil;
import utils.FileUtil;
import utils.StringUtil;
@MultipartConfig
public class AdminWorkDelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminWorkDelController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		WorkDAO workDAO = new WorkDAO();
		int id=Integer.parseInt(request.getParameter("id"));
		int delWork= workDAO.delItem(id);
		
		if(delWork>0) {
			response.sendRedirect(request.getContextPath()+"/admin/work/index?msg="+CommonConstant.SUCCESS);
			return;
		} else {
			response.sendRedirect(request.getContextPath()+"/admin/work/index?msg="+CommonConstant.ERROR);
			return;
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		}
		
		
		

}
