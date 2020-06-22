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
import model.News;
import model.Project;
import model.ProjectCat;
import model.Skill;
import utils.DefineUtil;

public class PublicContactController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PublicContactController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/public/index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		ContactDAO contactDAO = new ContactDAO();
		String name= request.getParameter("cname");
		String email=request.getParameter("cemail");
		String phone=request.getParameter("cphone");
		String messgae=request.getParameter("cmessage");
		System.out.println(name);
		Contact contact = new Contact(0, name, email, phone, messgae);
		int addContact = contactDAO.additem(contact);
		if(addContact>0) {
			out.print("done");
		} else {
			out.print("error");
		}
	}

}
