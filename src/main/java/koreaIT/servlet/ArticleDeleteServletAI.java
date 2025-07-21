package koreaIT.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import koreaIT.util.DBUtil;
import koreaIT.util.SecSql;

@WebServlet("/article/deleteAI")
public class ArticleDeleteServletAI extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		Connection conn = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL 8.0 �̻� ���� ����̹�
			String url = "jdbc:mysql://127.0.0.1:3306/AM_jsp_2025_07?useUnicode=true&characterEncoding=utf8&autoReconnect=true&serverTimezone=Asia/Seoul";
			conn = DriverManager.getConnection(url, "root", "0000");

			// id �Ķ���� ��������
			String idParam = request.getParameter("id");
			int id = 0;

			if (idParam != null && !idParam.isEmpty()) {
				try {
					id = Integer.parseInt(idParam);
				} catch (NumberFormatException e) {
					response.getWriter().append("Error: Invalid ID format.");
					return;
				}
			} else {
				response.getWriter().append("Error: ID parameter is missing.");
				return;
			}

			// ���� ���� �غ�
			SecSql sql = new SecSql();
			sql.append("DELETE FROM `article`");
			sql.append("WHERE id = ?", id);

			DBUtil dbUtil = new DBUtil(request, response);
			int affectedRows = dbUtil.delete(conn, sql);

			if (affectedRows > 0) {
				response.getWriter().append(id + "�� �Խñ��� �����Ǿ����ϴ�.");
			} else {
				response.getWriter().append(id + "�� �Խñ��� �������� ���߽��ϴ�. �ش� �Խñ��� ���ų� ������ �߻��߽��ϴ�.");
			}

		} catch (ClassNotFoundException e) {
			System.out.println("����̹� �ε� ����: " + e);
			response.getWriter().append("Error: JDBC Driver not found.");
		} catch (SQLException e) {
			System.out.println("�����ͺ��̽� ����: " + e);
			response.getWriter().append("Error: Database error occurred.");
		} finally {
			try {
				if (conn != null && !conn.isClosed()) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}