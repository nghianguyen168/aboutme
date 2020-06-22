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
import dao.ProjectCatDAO;
import dao.SkillDAO;
import model.Education;
import model.Info;
import model.ProjectCat;
import model.Skill;
import utils.AuthUtil;
import utils.FileUtil;

public class AdminSkillAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminSkillAddController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		InfoDAO infoDAO = new InfoDAO();
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/skill/add.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		SkillDAO skillDAO= new SkillDAO();
		String name=request.getParameter("name");
		int level=Integer.parseInt(request.getParameter("level"));
		System.out.println(name);
		System.out.println(level);
		Skill skill= new Skill(name, level);
		int addSkill = skillDAO.addItem(skill);
		if(addSkill>0) {
			response.sendRedirect(request.getContextPath()+"/admin/skill/index?msg="+CommonConstant.SUCCESS);
			return;
			
		} else {
			response.sendRedirect(request.getContextPath()+"/admin/skill/add?msg="+CommonConstant.ERROR);
			return;
		}
	}

}
