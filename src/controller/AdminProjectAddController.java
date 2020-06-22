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
import dao.ProjectDAO;
import dao.SkillDAO;
import model.Education;
import model.Info;
import model.Project;
import model.ProjectCat;
import model.Skill;
import utils.AuthUtil;
import utils.DBConnectionUtil;
import utils.FileUtil;
import utils.StringUtil;

@MultipartConfig
public class AdminProjectAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminProjectAddController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/project/add.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		ProjectDAO projectDAO = new ProjectDAO();
		String name = request.getParameter("name");
		int cid = Integer.parseInt(request.getParameter("category"));
		String link=request.getParameter("link");
		String description = request.getParameter("description");

		//up load hÃ¬nh áº£nh
		Part filePart = request.getPart("picture");

		String fileName = FileUtil.rename(filePart.getSubmittedFileName());
		String filePath = "";

		if (!"".equals(fileName)) {
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
			System.out.println("file:" + filePath);

		}
		
		Project project = new Project(0, name, fileName, link, description, cid);
		int addProject = projectDAO.addItem(project);
		if(addProject>0) {
			response.sendRedirect(request.getContextPath()+"/admin/project/index?msg="+CommonConstant.SUCCESS);
			return;
		} else {
			response.sendRedirect(request.getContextPath()+"/admin/project/add?msg="+CommonConstant.ERROR);
			return;
		}

	}

}
