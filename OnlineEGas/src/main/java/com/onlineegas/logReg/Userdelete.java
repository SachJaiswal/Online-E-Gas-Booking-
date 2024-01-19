package com.onlineegas.logReg;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/deleteUser")
public class Userdelete extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));

        try {
            // Establish database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineegas_db", "root", "Harish");

            // Delete user from the database based on the user ID
            String query = "DELETE FROM tbl_users WHERE id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);
            int rowsAffected = ps.executeUpdate();

            // Close resources
            ps.close();
            con.close();

            if (rowsAffected > 0) {
                // Successful deletion
                // Display an alert to the user
            	response.getWriter().println("<script>\r\n" +
            	        "        alert('User Deleted');\r\n" +
            	        "        window.location.href = '" + request.getContextPath() + "/userlist'; // Redirect to the userlist servlet\r\n" +
            	        "    </script>");

            } else {
                // User not found or deletion unsuccessful
                response.getWriter().println("User not found or deletion unsuccessful.");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
