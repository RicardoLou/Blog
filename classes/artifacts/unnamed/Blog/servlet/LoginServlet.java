package blog.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog.dao.ArticleDao;
import blog.dao.UserDao;
import blog.daoImpl.UserDaoImpl;
import blog.db.VisitorDB;
import blog.model.Article;
import blog.model.User;
import blog.service.ArticleService;
import blog.service.TagService;
import blog.utils.LoginUtils;

/**
 * Login->index.jsp->init data
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	String username;
	String password;
	private UserDao userDao = new UserDaoImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		LoginUtils.login(request);

		User user = userDao.login(username, password);

		if (user != null) {
			// 转发到 博客主页 界面
			request.getRequestDispatcher("/loading.jsp").forward(request, response);
		} else {
			// 登录失败，返回错误信息
			request.setAttribute("errorMessage", "用户名或密码错误");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		username = request.getParameter("username");
		password = request.getParameter("password");
		doGet(request, response);
	}
}
