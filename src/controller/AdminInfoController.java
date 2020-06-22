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
import model.Education;
import model.Info;
import model.ProjectCat;
import model.Skill;
import utils.AuthUtil;
import utils.FileUtil;
@MultipartConfig
public class AdminInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminInfoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		InfoDAO infoDAO = new InfoDAO();
		Info info = infoDAO.getItem();
		request.setAttribute("info", info);
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
					"  title: 'Cập nhật thông tin thành công!',\r\n" + 
					"  showConfirmButton: false,\r\n" + 
					"  timer: 1500\r\n" + 
					"});");
			out.println("});");
			out.println("</script>");
		}
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/info/update.jsp");
		rd.include(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		InfoDAO infoDAO = new InfoDAO();
		int age= Integer.parseInt(request.getParameter("age"));
		int exp=Integer.parseInt(request.getParameter("exp"));
		String place=request.getParameter("place");
		String email=request.getParameter("email");
		String phone = request.getParameter("phone");
		String description = request.getParameter("description");
		String cv=request.getParameter("cv");
		String desctiption=request.getParameter("description");
		Part filePart = request.getPart("picture");
		if ("".equals(filePart.getSubmittedFileName())) {
			String tb = "Vui lÃ²ng chá»�n hÃ¬nh áº£nh";
			request.setAttribute("tb", tb);
		
		}
		
		String fileName = FileUtil.rename(filePart.getSubmittedFileName());
		String filePath = "";
		String img=infoDAO.getItem().getImage();
		if (!"".equals(fileName)) {
			img=fileName;
			// táº¡o thÆ° má»¥c upload chá»©a file\
			// táº¡o Ä‘Æ°á»�ng dáº«n thá»±c Ä‘áº¿n thÆ° má»¥c lÆ°u
			String webPath = request.getServletContext().getRealPath("");
			/* String dirPath = webPath + DIR_UPLOAD; */
			String dirPath = webPath + CommonConstant.DIR_UPLOAD;
			File createDir = new File(dirPath);

			if (!createDir.exists()) {
				createDir.mkdir(); // jspd4/uploads chá»‰ táº¡o Ä‘Æ°á»£c má»™t thá»­ má»¥c
			}

			filePath = dirPath + File.separator + fileName;
			
			System.out.println(filePath);
			// File.separator tá»± Ä‘á»™ng láº¥y dáº¥u /
			filePart.write(filePath);
			request.setAttribute("filePath", filePath);
			System.out.println("file:"+filePath);

		}
		
		
		Info info = new Info(name, age, exp, place, email, phone, description, img, cv);
		int updateInfo = infoDAO.updateInfo(info);
		if(updateInfo>0) {
			response.sendRedirect(request.getContextPath()+"/admin/info/index?msg="+CommonConstant.SUCCESS);
			return;
		} else {
			response.sendRedirect(request.getContextPath()+"/admin/info/index?msg="+CommonConstant.ERROR);
		}
	}

}
