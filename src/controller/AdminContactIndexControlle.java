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
import utils.AuthUtil;
import utils.DefineUtil;
import utils.FileUtil;
@MultipartConfig
public class AdminContactIndexControlle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminContactIndexControlle() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		ContactDAO contactDAO = new ContactDAO();
		List<Contact> contactList = contactDAO.getItems();
		request.setAttribute("contactList", contactList);
		

		int numberOfItems = contactDAO.getItems().size();
		int numberOfPages = (int)(numberOfItems/DefineUtil.NUMBER_PER_PAGE_CONTACT);
		if(numberOfPages*DefineUtil.NUMBER_PER_PAGE_CONTACT<contactDAO.getItems().size()) {
			numberOfPages+=1;
		}
		int curentPage=1;
		try {
			curentPage=Integer.parseInt(request.getParameter("page"));
		}catch (NumberFormatException e) {
			// TODO: handle exception
		}
		if(curentPage>numberOfPages || curentPage<1) {
			curentPage=1;
		}
		int offset = (curentPage  - 1)* DefineUtil.NUMBER_PER_PAGE_Contact;
		List<Contact> contactListByPageAdmin = contactDAO.getItemsByPageAdmin(offset);
		request.setAttribute("numberOfPages", numberOfPages);
		request.setAttribute("curentPage", curentPage);
		request.setAttribute("offset", offset);
		request.setAttribute("numberOfItems", numberOfItems);
		response.setCharacterEncoding("utf-8");
		if(request.getParameter("msg")!=null) {
			
			PrintWriter out = response.getWriter();
			

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
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/contact/index.jsp");
		rd.include(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		}
		
		
		

}
