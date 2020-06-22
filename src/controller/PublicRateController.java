package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
import dao.NewsDAO;
import dao.ProjectCatDAO;
import dao.RateDAO;
import dao.SkillDAO;
import model.Comment;
import model.Education;
import model.Info;
import model.News;
import model.ProjectCat;
import model.Rate;
import model.Skill;
import model.UserGuest;
import utils.FileUtil;

public class PublicRateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PublicRateController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		UserGuest isUser = (UserGuest) session.getAttribute("userGuest");

		int star = Integer.parseInt(request.getParameter("rate"));
		int news_id = Integer.parseInt(request.getParameter("news_id"));
		String username = isUser.getUsername();
		System.out.println(username);
		System.out.println(star);
		System.out.println(news_id);
		Rate rate = new Rate(0, username, star, news_id, "");

		RateDAO rateDAO = new RateDAO();
		int checkRate = rateDAO.checkRate(rate);

		if (checkRate == 1) {
			 out.print("trung");
		} else {
			  int addItem = rateDAO.addItem(rate);
			  int star_news = rateDAO.sumRate(star, news_id);
			 out.print(star_news);
			 
		}

	}

}
