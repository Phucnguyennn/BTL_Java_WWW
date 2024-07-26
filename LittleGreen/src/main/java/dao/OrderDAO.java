package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.Order;
import util.DatabaseConnection;

public class OrderDAO {
    private Connection getConnection() {
        return DatabaseConnection.getConnection();
    }

    public void addOrder(Order order) throws SQLException {
        String sql = "INSERT INTO orders (userId, orderDate, totalAmount, status) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, order.getUserId());
            pstmt.setDate(2, new java.sql.Date(order.getOrderDate().getTime()));
            pstmt.setBigDecimal(3, order.getTotalAmount());
            pstmt.setString(4, order.getStatus());
            pstmt.executeUpdate();
        }
    }

    public List<Order> getOrdersByUserId(int userId) throws SQLException {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE userId = ?";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, userId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order();
                    order.setId(rs.getInt("id"));
                    order.setUserId(rs.getInt("userId"));
                    order.setOrderDate(rs.getDate("orderDate"));
                    order.setTotalAmount(rs.getBigDecimal("totalAmount"));
                    order.setStatus(rs.getString("status"));
                    orders.add(order);
                }
            }
        }
        return orders;
    }

    public void updateOrder(Order order) throws SQLException {
        String sql = "UPDATE orders SET orderDate = ?, totalAmount = ?, status = ? WHERE id = ?";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setDate(1, new java.sql.Date(order.getOrderDate().getTime()));
            pstmt.setBigDecimal(2, order.getTotalAmount());
            pstmt.setString(3, order.getStatus());
            pstmt.setInt(4, order.getId());
            pstmt.executeUpdate();
        }
    }

    public void deleteOrder(int id) throws SQLException {
        String sql = "DELETE FROM orders WHERE id = ?";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }
    }
}

