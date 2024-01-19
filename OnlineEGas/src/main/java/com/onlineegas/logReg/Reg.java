package com.onlineegas.logReg;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/reg")
public class Reg extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name1 = req.getParameter("username");
		String pass1 = req.getParameter("password");
		String email1 = req.getParameter("email");
		String phone1 = req.getParameter("phone");
		String aadhaar1 = req.getParameter("aadhaar");
		String address1 = req.getParameter("address");

		PrintWriter out = resp.getWriter();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineegas_db", "root", "Harish");
			PreparedStatement ps = con.prepareStatement("insert into tbl_users(username,password,mobile,email,address,aadhaar) values(?,?,?,?,?,?)");
			ps.setString(1, name1);
			ps.setString(2, pass1);
			ps.setString(3, phone1);
			ps.setString(4, email1);
			ps.setString(5, address1);
			ps.setString(6, aadhaar1);

			int count = ps.executeUpdate();
			if (count > 0) {
				resp.setContentType("text/html");
				out.print("<h2 style='color:green;'>User Registered</h2>");
				RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
				rd.include(req, resp);
			} else {
				resp.setContentType("text/html");
				out.print("<h2 style='color:red;'>Internal Error</h2>");
				RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
				rd.include(req, resp);
			}
		} catch (Exception e) {
			resp.setContentType("text/html");
			out.print("<h2 style='color:red;'>Error occured" + e.getMessage() + "</h2>");
			RequestDispatcher rd = req.getRequestDispatcher("/registration.jsp");
			rd.include(req, resp);

		}
	}

}