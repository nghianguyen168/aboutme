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
import dao.ProjectCatDAO;
import dao.SkillDAO;
import dao.WorkDAO;
import model.Education;
import model.Info;
import model.ProjectCat;
import model.Skill;
import model.Work;
import utils.AuthUtil;
import utils.FileUtil;
@MultipartConfig
public class AdminWorkIndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminWorkIndexController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		WorkDAO workDAO = new WorkDAO();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		if(request.getParameter("msg")!=null) {


			out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script>");
			
			out.println("$(document).ready(function(){");
			out.println("swal({\r\n" + 
					"  position: 'top-end',\r\n" + 
					"  type: 'success',\r\n" + 
					"  title: 'Xử lý thành công!',\r\n" + 
					"  showConfirmButton: false,\r\n" + 
					"  timer: 1500\r\n" + 
					"});");
			out.println("});");
			out.println("</script>");
		}
		
		List<Work> workList = workDAO.getItem();
		request.setAttribute("workList", workList);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/work/index.jsp");
		rd.include(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		}
		
		
		

}
