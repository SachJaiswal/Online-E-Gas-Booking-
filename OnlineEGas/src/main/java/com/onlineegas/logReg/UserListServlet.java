package com.onlineegas.logReg;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("serial")
@WebServlet("/userlist")
public class UserListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<User> userList = new ArrayList<>();

        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish database connection
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineegas_db", "root", "Harish");

            // Execute SQL query to get user data
            PreparedStatement ps = con.prepareStatement("SELECT * FROM tbl_users");
            ResultSet rs = ps.executeQuery();
            HttpSession session = request.getSession(true);
            // Process the result set
            int counter = 1; // Counter for creating dynamic attribute names
            while (rs.next()) {
                // Create dynamic attribute names based on the counter
                String userKey = "user" + counter;

                // Set session attributes for the current row
                
                session.setAttribute(userKey + "Id", rs.getInt("id"));
                session.setAttribute(userKey + "Username", rs.getString("username"));
                session.setAttribute(userKey + "Password", rs.getString("password"));
                session.setAttribute(userKey + "Mobile", rs.getString("mobile"));
                session.setAttribute(userKey + "Email", rs.getString("email"));
                session.setAttribute(userKey + "Address", rs.getString("address"));
                session.setAttribute(userKey + "Aadhaar", rs.getString("aadhaar"));

                counter++; // Increment the counter for the next row
            }
            session.setAttribute("counter",counter);
            // Close resources
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        //request.setAttribute("userList", userList);
        request.getRequestDispatcher("/manageusers.jsp").forward(request, response);
    }
}
