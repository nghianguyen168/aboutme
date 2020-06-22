package controller;	

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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

public class AdminSkillUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminSkillUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/skill/index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SkillDAO skillDAO = new SkillDAO();
		int id = Integer.parseInt(request.getParameter("ID"));
		int level = Integer.parseInt(request.getParameter("level"));
		System.out.println(level);
		System.out.println(id);
		int updateSkill = skillDAO.updateItem(id,level);
		if(updateSkill >0) {
			response.setCharacterEncoding("utf-8");
			
			PrintWriter out = response.getWriter();
			

				out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
				out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
				out.println("<script>");
				
				out.println("$(document).ready(function(){");
				out.println("swal({\r\n" + 
						"  position: 'top-end',\r\n" + 
						"  type: 'success',\r\n" + 
						"  title: 'Cập nhật thông tin thành công!',\r\n" + 
						"  showConfirmButton: false,\r\n" + 
						"  timer: 1500\r\n" + 
						"});");
				out.println("});");
				out.println("</script>");
		
			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/skill/index.jsp?msg="+CommonConstant.SUCCESS);
			rd.include(request, response);
		} else {
			response.setCharacterEncoding("utf-8");
			
			PrintWriter out = response.getWriter();
			

				out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
				out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
				out.println("<script>");
				
				out.println("$(document).ready(function(){");
				out.println("swal({\r\n" + 
						"  position: 'top-end',\r\n" + 
						"  type: 'error',\r\n" + 
						"  title: 'Cập nhật thông tin thất bại!',\r\n" + 
						"  showConfirmButton: false,\r\n" + 
						"  timer: 1500\r\n" + 
						"});");
				out.println("});");
				out.println("</script>");
		
			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/skill/index.jsp?msg="+CommonConstant.ERROR);
			rd.include(request, response);
		}
		
	}

}
