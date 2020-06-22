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
import dao.EducationDAO;
import dao.InfoDAO;
import dao.NewsCatDAO;
import dao.ProjectCatDAO;
import dao.SkillDAO;
import dao.UserDAO;
import dao.UserGuestDAO;
import model.Education;
import model.Info;
import model.ProjectCat;
import model.Skill;
import model.User;
import utils.AuthUtil;
import utils.FileUtil;

public class AdminGuestDelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminGuestDelController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		UserGuestDAO uGuestDAO = new UserGuestDAO();
		int id=Integer.parseInt(request.getParameter("id"));
		int delItem = uGuestDAO.delItem(id);
		if(delItem>0) {
			response.sendRedirect(request.getContextPath()+"/admin/guest/index?msg="+CommonConstant.SUCCESS);
			return;
			
		}else {
			response.sendRedirect(request.getContextPath()+"/admin/guest/index?msg="+CommonConstant.ERROR);
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			
	}

}
