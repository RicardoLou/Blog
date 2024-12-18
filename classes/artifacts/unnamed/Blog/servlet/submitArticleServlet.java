package blog.servlet;

import blog.model.Article;
import blog.service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.*;
import java.sql.*;

@WebServlet("/SubmitArticleServlet")
public class submitArticleServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/Ricardo?useSSL=false&serverTimezone=UTC";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "123456";
    Connection connection = null;
    private PreparedStatement statement = null;
    PrintWriter out = null;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            // 设置响应内容类型
            response.setContentType("text/html;charset=UTF-8");
            out = response.getWriter();

            // 获取表单数据
            String title = request.getParameter("title");
            String dateString = request.getParameter("time");
            String author = request.getParameter("author");
            String category = request.getParameter("category");
            String content = request.getParameter("content");
            java.sql.Timestamp date = java.sql.Timestamp.valueOf(dateString + " 00:00:00");
            statement = connection.prepareStatement("insert into t_article(title, author, sort, time, content) values(?, ?, ?, ?, ?)");
            statement.setString(1, title);
            statement.setString(2, author);
            statement.setString(3, category);
            statement.setTimestamp(4, date);
            statement.setString(5, content);
            // 执行插入操作
            int rowsInserted = statement.executeUpdate();

            // 根据插入结果返回响应
            if (rowsInserted > 0) {
                out.println("<h2>文章提交成功！</h2>");
                out.println("<a href='/Blog/loadingServlet'>返回首页</a>");
            } else {
                out.println("<h2>文章提交失败，请稍后重试。</h2>");
                out.println("<a href='/Blog/index.jsp'>返回首页</a>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<h2>数据库连接失败，请稍后重试。</h2>");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } finally {
            // 关闭数据库连接
            try {
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
