package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EducationDAO;
import dao.InfoDAO;
import dao.ProjectCatDAO;
import dao.ProjectDAO;
import dao.SkillDAO;
import model.Education;
import model.Info;
import model.Project;
import model.ProjectCat;
import model.Skill;

public class PublicIndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PublicIndexController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		InfoDAO infoDAO = new InfoDAO();
		SkillDAO skillDAO = new SkillDAO();
		ProjectCatDAO projectCatDAO = new ProjectCatDAO();
		EducationDAO educationDAO = new EducationDAO();
		ProjectDAO projectDAO = new ProjectDAO();
		
		Info info = infoDAO.getItem();
		List<Skill> skillList = skillDAO.getItems();
		List<ProjectCat> projectCatList = projectCatDAO.getItems();
		List<Education> eduList = educationDAO.getItem();
		List<Project> projectList = projectDAO.getItems();
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/public/index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
			
	}

}
