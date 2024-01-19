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
import java.sql.Timestamp;
import java.time.LocalDateTime;

@WebServlet("/completeOrder")
public class OrderComplete extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));

        try {
            // Establish database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineegas_db", "root", "Harish");

            // Update order status to 'Completed' and set delivered_date to current date in the database based on the order ID
            String query = "UPDATE tbl_orders SET order_status = 'Completed', delivered_date = ? WHERE id = ?";
            try (PreparedStatement ps = con.prepareStatement(query)) {
                // Set delivered_date to the current date and time
                LocalDateTime currentDateTime = LocalDateTime.now();
                Timestamp currentTimestamp = Timestamp.valueOf(currentDateTime);

                ps.setTimestamp(1, currentTimestamp);
                ps.setInt(2, orderId);

                int rowsAffected = ps.executeUpdate();

                if (rowsAffected > 0) {
                    // Successful update
                    // Display an alert to the user
                    response.getWriter().println("<script>\r\n" +
                            "        alert('Order Completed');\r\n" +
                            "        window.location.href = '" + request.getContextPath() + "/inprocess'; // Redirect to the inprocessorder.jsp\r\n" +
                            "    </script>");
                } else {
                    // Order not found or update unsuccessful
                    response.getWriter().println("Order not found or update unsuccessful.");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
