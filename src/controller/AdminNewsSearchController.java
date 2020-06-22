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
import utils.DefineUtil;
import utils.FileUtil;

public class AdminNewsSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminNewsSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		NewsDAO newsDAO = new NewsDAO();
		String searchText="";
		if(request.getParameter("searchText")!=null) {
			searchText = request.getParameter("searchText");
		}
			int nid = Integer.parseInt(request.getParameter("category"));
		
			int month = Integer.parseInt(request.getParameter("month"));
			
			
		List<News> newsListSearch = newsDAO.getListSearch(searchText, nid,month);
		int numberOfItems = newsListSearch.size();
		int numberOfPages = (int)(numberOfItems/DefineUtil.NUMBER_PER_PAGE_CONTACT);
		if(numberOfPages*DefineUtil.NUMBER_PER_PAGE_Contact<newsDAO.getItems().size()) {
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
		int offset = (curentPage  - 1)* DefineUtil.NUMBER_PER_PAGE_CONTACT;
		
		List<News> newsListSearchByPage = newsDAO.newsListSearchByPage(searchText, nid,month,offset);
		
		if(newsListSearch.size()>0) {
			request.setAttribute("searchText", searchText);
			request.setAttribute("nid", nid);
			request.setAttribute("month", month);
			request.setAttribute("newsListSearch", newsListSearchByPage);
			request.setAttribute("numberOfPagesSearch", numberOfPages);
			request.setAttribute("curentPageSearch", curentPage);
			request.setAttribute("offsetSearch", offset);
			request.setAttribute("numberOfItemsSearch", numberOfItems);
			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/news/index.jsp");
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/news/index.jsp?msg="+CommonConstant.ERROR);
			rd.forward(request, response);
		}
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
