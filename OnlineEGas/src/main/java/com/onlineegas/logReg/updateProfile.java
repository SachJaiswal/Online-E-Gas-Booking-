package com.onlineegas.logReg;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/profileUpdate")
public class updateProfile extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        int userId = Integer.parseInt(request.getParameter("userId"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String aadhaar = request.getParameter("aadhaar");

        try {
            // Establish database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineegas_db", "root", "Harish");

            // Update user data in the database
            String query = "UPDATE tbl_users SET username=?, password=?, mobile=?, email=?, address=?, aadhaar=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, mobile);
            ps.setString(4, email);
            ps.setString(5, address);
            ps.setString(6, aadhaar);
            ps.setInt(7, userId);

            int rowsAffected = ps.executeUpdate();

            // Close resources
            ps.close();
            con.close();

            if (rowsAffected > 0) {
                // Successful update
                response.getWriter().println("<script>\r\n" +
                        "        alert('Profile Updated!! Please Login Again');\r\n" +
                        "        window.location.href = 'index.jsp'; // Redirect to the profile page\r\n" +
                        "    </script>");
            } else {
                // Update unsuccessful
                response.getWriter().println("<script>\r\n" +
                        "        alert('Profile Update Failed!! !! Please Login Again');\r\n" +
                        "        window.location.href = 'index.jsp'; // Redirect to the profile page\r\n" +
                        "    </script>");
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
