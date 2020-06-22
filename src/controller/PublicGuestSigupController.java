package controller;

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
import javax.servlet.jsp.JspWriter;

import org.apache.jasper.tagplugins.jstl.core.Out;

import constant.CommonConstant;
import dao.EducationDAO;
import dao.InfoDAO;
import dao.ProjectCatDAO;
import dao.ProjectDAO;
import dao.SkillDAO;
import dao.UserGuestDAO;
import model.Education;
import model.Info;
import model.Project;
import model.ProjectCat;
import model.Skill;
import model.User;
import model.UserGuest;
import utils.StringUtil;

public class PublicGuestSigupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public PublicGuestSigupController() {
        super();
        // TODO Auto-generated constructor stub
    }

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/public/signup.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		UserGuestDAO userGuestDAO = new UserGuestDAO();
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String pass = StringUtil.md5(request.getParameter("password"));
		String fullname = request.getParameter("fullname");
		
		UserGuest checkTrung = userGuestDAO.checkStrung(username);
		if(checkTrung!=null) {
			UserGuest userTrung = new UserGuest(0, username, password, fullname);
			request.setAttribute("userTrung", userTrung);
			RequestDispatcher rd= request.getRequestDispatcher("/views/public/signup.jsp?msg="+CommonConstant.DOUBLECAT);
			rd.forward(request, response);
		} else {
			int addUserGuest = userGuestDAO.addItem(username,pass,fullname);
			if(addUserGuest>0) {
					out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
					out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
					out.println("<script>");
					out.println("$(document).ready(function(){");
					out.println("swal ( 'Đăng ký tài khoản thành  công!' ,  'SUCCESS' ,  'success' );");
					out.println("});");
					out.println("</script>");
			RequestDispatcher rd = request.getRequestDispatcher("/views/public/guest_login.jsp");
			rd.include(request, response);
			} else {
				response.sendRedirect(request.getContextPath()+"/public/signup?msg="+CommonConstant.ERROR);
			}
			
		}
		
		
	}

}
