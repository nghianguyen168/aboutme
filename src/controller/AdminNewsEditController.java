package controller;	

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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
import dao.NewsCatDAO;
import dao.NewsDAO;
import dao.ProjectCatDAO;
import dao.SkillDAO;
import model.Education;
import model.Info;
import model.News;
import model.NewsCat;
import model.ProjectCat;
import model.Skill;
import utils.AuthUtil;
import utils.FileUtil;
@MultipartConfig
public class AdminNewsEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int curentPage=0;
    public AdminNewsEditController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		NewsDAO newsDAO = new NewsDAO();
		int id = Integer.parseInt(request.getParameter("id"));
		News news = newsDAO.getItem(id);
		 curentPage = Integer.parseInt(request.getParameter("p"));
		request.setAttribute("news", news);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/news/edit.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		NewsDAO newsDao = new NewsDAO();
		int id = Integer.parseInt(request.getParameter("id"));
		News news1 = newsDao.getItem(id);
		String name= request.getParameter("name");
		
		int cat_id = Integer.parseInt(request.getParameter("category")); 
		String preview = request.getParameter("preview");
		String detail= request.getParameter("detail");
		String author = request.getParameter("author");
		
		String picture=news1.getPicture();
		//up load hÃ¬nh áº£nh
				Part filePart = request.getPart("picture");

				String fileName = FileUtil.rename(filePart.getSubmittedFileName());
				String filePath = "";
		/*
		 * if (!"".equals(fileName) ) { if(!"".equals(news1.getPicture())){ Path path =
		 * Paths.get(request.getServletContext().getRealPath("") + "/files/" +
		 * news1.getPicture()); System.out.println("xÃ³a:" + path); Files.delete(path);
		 * 
		 * } }
		 */
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
					// File.separator tá»± Ä‘á»™ng láº¥y dáº¥u /
					filePart.write(filePath);
					request.setAttribute("filePath", filePath);
					System.out.println("file:" + filePath);

				}
			
		
			News news = new News(id, name, picture, "", preview, detail, "", author, cat_id, "", 0);
			int editNews = newsDao.EditItems(news);
			if(editNews>0) {
				response.sendRedirect(request.getContextPath()+"/admin/news/index?page="+curentPage+"&msg="+CommonConstant.SUCCESS);
				
				
				return;
			} else {
				response.sendRedirect(request.getContextPath()+"/admin/news/edit?id="+id+"&msg="+CommonConstant.ERROR);
				return;
			}
			
	}

}
