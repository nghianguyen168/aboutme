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
import javax.websocket.Session;

import constant.CommonConstant;
import dao.EducationDAO;
import dao.InfoDAO;
import dao.ProjectCatDAO;
import dao.SkillDAO;
import dao.UserDAO;
import model.Education;
import model.Info;
import model.ProjectCat;
import model.Skill;
import model.User;
import utils.FileUtil;
import utils.StringUtil;

public class AdminLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		InfoDAO infoDAO = new InfoDAO();
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/auth/login.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		UserDAO userDAO = new UserDAO();
		String username=request.getParameter("username");
		String password=StringUtil.md5(request.getParameter("pass"));
		String pass = request.getParameter("pass");
		System.out.println(username);
		System.out.println(password);
		
		PrintWriter out = response.getWriter();
		
		
		User user = userDAO.checkUser(username,password);
		if(user!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			
			
			request.setCharacterEncoding("UTF-8");
			
			
			out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script>");
			
			out.println("$(document).ready(function(){");
			out.println("swal({\r\n" + 
					"  position: 'top-end',\r\n" + 
					"  type: 'success',\r\n" + 
					"  title: 'Đăng nhập thành công!',\r\n" + 
					"  showConfirmButton: false,\r\n" + 
					"  timer: 1300\r\n" + 
					"});");
			out.println("});");
			out.println("</script>");
			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/index.jsp");
			rd.include(request, response);
		} else {
			User userErr = new User(0, username, pass, 0);
			RequestDispatcher rd = request.getRequestDispatcher("/views/auth/login.jsp?msg="+CommonConstant.ERROR);
			rd.include(request, response);
			
		}
	
		
	}

}
