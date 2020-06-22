package controller;	

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import constant.CommonConstant;
import dao.CommentDAO;
import dao.EducationDAO;
import dao.InfoDAO;
import dao.NewsCatDAO;
import dao.ProjectCatDAO;
import dao.SkillDAO;
import model.Comment;
import model.Education;
import model.Info;
import model.News;
import model.ProjectCat;
import model.Skill;
import utils.AuthUtil;
import utils.DefineUtil;
import utils.FileUtil;

public class AdminNewsCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminNewsCommentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CommentDAO commentDAO = new CommentDAO();
		List<Comment> commentList = commentDAO.getItems();
		
		int numberOfItems = commentDAO.getItems().size();
		int numberOfPages = (int)(numberOfItems/DefineUtil.NUMBER_PER_PAGE_Comment);
		if(numberOfPages*DefineUtil.NUMBER_PER_PAGE_Comment<commentDAO.getItems().size()) {
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
		int offset = (curentPage  - 1)* DefineUtil.NUMBER_PER_PAGE;
		List<Comment> commentListByPageAdmin = commentDAO.getItemsByPageAdmin(offset);
		request.setAttribute("commentListByPageAdmin", commentListByPageAdmin);
		request.setAttribute("numberOfPages", numberOfPages);
		request.setAttribute("curentPage", curentPage);
		request.setAttribute("offset", offset);
		request.setAttribute("numberOfItems", numberOfItems);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/comment/index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			
	}

}
