package dao;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.Product;
import util.DatabaseConnection;

public class ProductDAO {
    private Connection getConnection() {
        return DatabaseConnection.getConnection();
    }

    public void addProduct(Product product) throws SQLException {
        String sql = "INSERT INTO products (name, description, price, brand, fragranceType, volume, gender, launchYear, stockQuantity, imageUrl) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection(); 
        	PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, product.getName());
            pstmt.setString(2, product.getDescription());
            pstmt.setBigDecimal(3, product.getPrice());
            pstmt.setString(4, product.getBrand());
            pstmt.setString(5, product.getFragranceType());
            pstmt.setInt(6, product.getVolume());
            pstmt.setString(7, product.getGender());
            pstmt.setInt(8, product.getLaunchYear());
            pstmt.setInt(9, product.getStockQuantity());
            pstmt.setString(10, product.getImageUrl());
            pstmt.executeUpdate();
        }
    }

    public Product getProductById(int id) throws SQLException {
        String sql = "SELECT * FROM products WHERE id = ?";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Product product = new Product();
                    product.setId(rs.getInt("id"));
                    product.setName(rs.getString("name"));
                    product.setDescription(rs.getString("description"));
                    product.setPrice(rs.getBigDecimal("price"));
                    product.setBrand(rs.getString("brand"));
                    product.setFragranceType(rs.getString("fragranceType"));
                    product.setVolume(rs.getInt("volume"));
                    product.setGender(rs.getString("gender"));
                    product.setLaunchYear(rs.getInt("launchYear"));
                    product.setStockQuantity(rs.getInt("stockQuantity"));
                    product.setImageUrl(rs.getString("imageUrl"));
                    return product;
                }
            }
        }
        return null;
    }

    public List<Product> getAllProducts() throws SQLException {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM products";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getBigDecimal("price"));
                product.setBrand(rs.getString("brand"));
                product.setFragranceType(rs.getString("fragranceType"));
                product.setVolume(rs.getInt("volume"));
                product.setGender(rs.getString("gender"));
                product.setLaunchYear(rs.getInt("launchYear"));
                product.setStockQuantity(rs.getInt("stockQuantity"));
                product.setImageUrl(rs.getString("imageUrl"));
                products.add(product);
            }
        }
        return products;
    }

    public void updateProduct(Product product) throws SQLException {
        String sql = "UPDATE products SET name = ?, description = ?, price = ?, brand = ?, fragranceType = ?, volume = ?, gender = ?, launchYear = ?, stockQuantity = ?, imageUrl = ? WHERE id = ?";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, product.getName());
            pstmt.setString(2, product.getDescription());
            pstmt.setBigDecimal(3, product.getPrice());
            pstmt.setString(4, product.getBrand());
            pstmt.setString(5, product.getFragranceType());
            pstmt.setInt(6, product.getVolume());
            pstmt.setString(7, product.getGender());
            pstmt.setInt(8, product.getLaunchYear());
            pstmt.setInt(9, product.getStockQuantity());
            pstmt.setString(10, product.getImageUrl());
            pstmt.setInt(11, product.getId());
            pstmt.executeUpdate();
        }
    }

    public void deleteProduct(int id) throws SQLException {
        String sql = "DELETE FROM products WHERE id = ?";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }
    }
}
