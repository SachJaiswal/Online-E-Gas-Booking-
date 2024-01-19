package com.onlineegas.logReg;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.time.LocalDate;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.annotation.WebServlet;

@SuppressWarnings("serial")
@WebServlet("/bookGas")
public class BookGas extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Extract form data
        int userId = Integer.parseInt(request.getParameter("userId"));
        String gasProvider = request.getParameter("gasProvider");
        String orderType = request.getParameter("gasType");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Additional logic to set default values


        // Get today's date
        LocalDate orderDate = LocalDate.now();

        // Set default values for order status and delivered date
        String orderStatus = "Inprocess"; // Assuming 1 represents 'In Process'
        LocalDate deliveredDate = null;

        try {
            // Establish database connection
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineegas_db", "root", "Harish");

            // Insert data into tbl_orders
            String query = "INSERT INTO tbl_orders (user_id, supplier, qty, order_type, order_date, order_status) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setString(2, gasProvider);
            ps.setInt(3, quantity);
            ps.setString(4, orderType);
            ps.setDate(5, Date.valueOf(orderDate));
            ps.setString(6, orderStatus);

            int rowsAffected = ps.executeUpdate();

            // Close resources
            ps.close();
            con.close();

         // Handle success or failure
            if (rowsAffected > 0) {
                // Order successful
                response.getWriter().println("<script>alert('Order has been placed. Your delivery will be processed in 48 hours.');"
                        + "window.location.href = '" + request.getContextPath() + "/home.jsp';</script>");
            } else {
                // Order failed
                response.getWriter().println("<script>alert('Error Occurred. Please try again.');"
                        + "window.location.href = '" + request.getContextPath() + "/ordergas.jsp';</script>");
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

