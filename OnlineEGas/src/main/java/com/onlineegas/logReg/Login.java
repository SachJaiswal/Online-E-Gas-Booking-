package com.onlineegas.logReg;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		PrintWriter out = response.getWriter();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineegas_db", "root", "Harish");
			PreparedStatement ps = con.prepareStatement("SELECT * FROM tbl_users WHERE username=? AND password=?");
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				// Creating a session
				HttpSession session = request.getSession(true);

				// Storing user information in the session
				session.setAttribute("userId", rs.getInt("id"));
                session.setAttribute("username", rs.getString("username"));
                session.setAttribute("password", rs.getString("password"));
                session.setAttribute("mobile", rs.getString("mobile"));
                session.setAttribute("email", rs.getString("email"));
                session.setAttribute("address", rs.getString("address"));
                session.setAttribute("aadhaar", rs.getString("aadhaar"));

				if (username.equals("admin")) {
					response.sendRedirect(request.getContextPath() + "/inprocessorder.jsp"); // Redirect to admin home page
				} else {
					response.sendRedirect(request.getContextPath() + "/home.jsp"); // Redirect to user home page
				}
			} else {
				response.setContentType("text/html");
				out.print("<h2 style='color:red;'>Email or password mismatch</h2>");
				RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
				rd.include(request, response);
			}
		} catch (Exception e) {
			response.setContentType("text/html");
			out.print("<h2 style='color:red;'>An error occurred: " + e.getMessage() + "</h2>");
			RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
			rd.include(request, response);
		}
	}
}
