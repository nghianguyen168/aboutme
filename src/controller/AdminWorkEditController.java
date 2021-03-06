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
import model.Work;
import utils.AuthUtil;
import utils.DBConnectionUtil;
import utils.FileUtil;
import utils.StringUtil;
@MultipartConfig
public class AdminWorkEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminWorkEditController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		WorkDAO workDAO = new WorkDAO();
		int id=Integer.parseInt(request.getParameter("id"));
		Work work=workDAO.getWork(id);
		request.setAttribute("work", work);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/work/edit.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		WorkDAO workDAO = new WorkDAO();

		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String time_from = request.getParameter("time_from");
		String timefrom=StringUtil.DaoChuoi(time_from.substring(0,7));
		String time_to = request.getParameter("time_to");
		String timeto =StringUtil.DaoChuoi(time_to.substring(0,7));
		String description = request.getParameter("description");
		
		
		Work work = new Work(id,name, timefrom, timeto, description);
		int editWork = workDAO.editItem(work);
		if(editWork>0) {
			response.sendRedirect(request.getContextPath()+"/admin/work/index?msg="+CommonConstant.SUCCESS);
			return;
		} else {
			response.sendRedirect(request.getContextPath()+"/admin/work/add?msg="+CommonConstant.ERROR);
			return;
		}
		}
		
		
		

}
