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
import javax.servlet.http.Part;

import constant.CommonConstant;
import dao.ContactDAO;
import dao.EducationDAO;
import dao.InfoDAO;
import dao.ProjectCatDAO;
import dao.ProjectDAO;
import dao.SkillDAO;
import model.Contact;
import model.Education;
import model.Info;
import model.Project;
import model.ProjectCat;
import model.Skill;
import utils.FileUtil;
@MultipartConfig
public class AdminContactDelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminContactDelController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ContactDAO contactDAO = new ContactDAO();
		int id =Integer.parseInt(request.getParameter("id"));
		int delContact = contactDAO.delItem(id);
		if(delContact>0) {
			response.sendRedirect(request.getContextPath()+"/admin/contact/index?msg="+CommonConstant.SUCCESS);
			return;
		} else {
			response.sendRedirect(request.getContextPath()+"/admin/contact/index?msg="+CommonConstant.ERROR);
			return;
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ContactDAO contactDAO= new ContactDAO();
		int delContact=0;
		String[]contactID = request.getParameterValues("deleteContact");
		for(int i=0;i<contactID.length;i++) {
			int id = Integer.parseInt(contactID[i].toString());
			 delContact = contactDAO.delItem(id);
			
		}
		if(delContact>0) {
			response.sendRedirect(request.getContextPath()+"/admin/contact/index?msg="+CommonConstant.SUCCESS);
		} else {
			response.sendRedirect(request.getContextPath()+"/admin/contact/index?msg="+CommonConstant.ERROR);
		}
		
		}
		
		
		

}
