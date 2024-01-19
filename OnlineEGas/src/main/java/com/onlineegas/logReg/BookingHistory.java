package com.onlineegas.logReg;

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

@WebServlet("/bookingHistory")
public class BookingHistory extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // Establish database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineegas_db", "root", "Harish")) {

                HttpSession session = request.getSession(false);
                if (session != null) {
                    int userId = (int) session.getAttribute("userId");

                    String query = "SELECT supplier, qty, order_date, order_type, order_status, delivered_date FROM tbl_orders WHERE user_id = ?";
                    try (PreparedStatement ps = con.prepareStatement(query)) {
                        ps.setInt(1, userId);

                        try (ResultSet rs = ps.executeQuery()) {

                            // Display the orders
                            HttpSession session2 = request.getSession(true);
                            int counter = 1; // Counter for creating dynamic attribute names

                            while (rs.next()) {
                                // Create dynamic attribute names based on the counter
                                String orderKey = "booking" + counter;

                                // Set session attributes for the current row
                                session2.setAttribute(orderKey + "Supplier", rs.getString("supplier"));
                                session2.setAttribute(orderKey + "Qty", rs.getInt("qty"));
                                session2.setAttribute(orderKey + "OrderDate", rs.getDate("order_date").toString());
                                session2.setAttribute(orderKey + "OrderType", rs.getString("order_type"));
                                session2.setAttribute(orderKey + "OrderStatus", rs.getString("order_status"));
                                session2.setAttribute(orderKey + "DeliveredDate", rs.getString("delivered_date"));
                                counter++; // Increment the counter for the next row
                            }

                            session2.setAttribute("counterbk", counter); // Store the counter in the session
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/bookinghistory.jsp").forward(request, response);
    }
}
