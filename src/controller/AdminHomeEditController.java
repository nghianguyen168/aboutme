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
import dao.HomeDAO;
import dao.InfoDAO;
import dao.ProjectCatDAO;
import dao.SkillDAO;
import model.Education;
import model.Home;
import model.Info;
import model.ProjectCat;
import model.Skill;
import utils.AuthUtil;
import utils.FileUtil;
@MultipartConfig
public class AdminHomeEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminHomeEditController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HomeDAO homeDAO = new HomeDAO();
		int id = Integer.parseInt(request.getParameter("id"));	
		Home home = homeDAO.getItem(id);
		request.setAttribute("home", home);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/home/edit.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HomeDAO homeDAO = new HomeDAO();
		int id=Integer.parseInt(request.getParameter("id"));
		Home home = homeDAO.getItem(id);
		String title = request.getParameter("title");
		String intro = request.getParameter("intro");
		
		String picture=home.getPicture();
		
		Part filePart = request.getPart("picture");
		
		String fileName = FileUtil.rename(filePart.getSubmittedFileName());
		String filePath = "";

		if (!"".equals(fileName)) {
			picture=fileName;
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
			System.out.println(fileName);
			// File.separator tá»± Ä‘á»™ng láº¥y dáº¥u /
			filePart.write(filePath);
			request.setAttribute("filePath", filePath);
			System.out.println("file:" + filePath);

		}
		
		Home home1 = new Home(id, title, intro, picture, 0);
		int updateBanner = homeDAO.editItem(home1);
		if(updateBanner>0) {
			response.sendRedirect(request.getContextPath()+"/admin/home/index?msg="+CommonConstant.SUCCESS);
			return;
		} else {
			response.sendRedirect(request.getContextPath()+"/admin/home/edit?id="+id+"&msg="+CommonConstant.ERROR);
			return;
		}
			
	}

}
