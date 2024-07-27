package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import util.DatabaseConnection;

public class ProductDAO {
	 @SuppressWarnings("unused")
	private Connection getConnection() {
	        return DatabaseConnection.getConnection();
	    }
    // SQL queries
    private static final String INSERT_PRODUCT_SQL = "INSERT INTO Products (name, description, price, brand, fragranceType, volume, gender, launchYear, stockQuantity, imageUrl) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_PRODUCT_BY_ID = "SELECT * FROM Products WHERE id = ?";
    private static final String SELECT_ALL_PRODUCTS = "SELECT * FROM Products";
    private static final String UPDATE_PRODUCT_SQL = "UPDATE Products SET name = ?, description = ?, price = ?, brand = ?, fragranceType = ?, volume = ?, gender = ?, launchYear = ?, stockQuantity = ?, imageUrl = ? WHERE id = ?";
    private static final String DELETE_PRODUCT_SQL = "DELETE FROM Products WHERE id = ?";

    // Method to get all products
    public List<Product> getAllProducts() throws SQLException {
        List<Product> products = new ArrayList<>();
        try (Connection connection = DatabaseConnection.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(SELECT_ALL_PRODUCTS)) {

            while (resultSet.next()) {
                Product product = new Product();
                product.setId(resultSet.getInt("id"));
                product.setName(resultSet.getString("name"));
                product.setDescription(resultSet.getString("description"));
                product.setPrice(resultSet.getBigDecimal("price"));
                product.setBrand(resultSet.getString("brand"));
                product.setFragranceType(resultSet.getString("fragranceType"));
                product.setVolume(resultSet.getInt("volume"));
                product.setGender(resultSet.getString("gender"));
                product.setLaunchYear(resultSet.getInt("launchYear"));
                product.setStockQuantity(resultSet.getInt("stockQuantity"));
                product.setImageUrl(resultSet.getString("imageUrl"));
                products.add(product);
            }
        }
        return products;
    }

    // Method to get a product by ID
    public Product getProductById(int id) throws SQLException {
        Product product = null;
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                product = new Product();
                product.setId(resultSet.getInt("id"));
                product.setName(resultSet.getString("name"));
                product.setDescription(resultSet.getString("description"));
                product.setPrice(resultSet.getBigDecimal("price"));
                product.setBrand(resultSet.getString("brand"));
                product.setFragranceType(resultSet.getString("fragranceType"));
                product.setVolume(resultSet.getInt("volume"));
                product.setGender(resultSet.getString("gender"));
                product.setLaunchYear(resultSet.getInt("launchYear"));
                product.setStockQuantity(resultSet.getInt("stockQuantity"));
                product.setImageUrl(resultSet.getString("imageUrl"));
            }
        }
        return product;
    }

    // Method to insert a new product
    public void insertProduct(Product product) throws SQLException {
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT_SQL)) {
            preparedStatement.setString(1, product.getName());
            preparedStatement.setString(2, product.getDescription());
            preparedStatement.setBigDecimal(3, product.getPrice());
            preparedStatement.setString(4, product.getBrand());
            preparedStatement.setString(5, product.getFragranceType());
            preparedStatement.setInt(6, product.getVolume());
            preparedStatement.setString(7, product.getGender());
            preparedStatement.setInt(8, product.getLaunchYear());
            preparedStatement.setInt(9, product.getStockQuantity());
            preparedStatement.setString(10, product.getImageUrl());
            preparedStatement.executeUpdate();
        }
    }

    // Method to update a product
    public void updateProduct(Product product) throws SQLException {
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PRODUCT_SQL)) {
            preparedStatement.setString(1, product.getName());
            preparedStatement.setString(2, product.getDescription());
            preparedStatement.setBigDecimal(3, product.getPrice());
            preparedStatement.setString(4, product.getBrand());
            preparedStatement.setString(5, product.getFragranceType());
            preparedStatement.setInt(6, product.getVolume());
            preparedStatement.setString(7, product.getGender());
            preparedStatement.setInt(8, product.getLaunchYear());
            preparedStatement.setInt(9, product.getStockQuantity());
            preparedStatement.setString(10, product.getImageUrl());
            preparedStatement.setInt(11, product.getId());
            preparedStatement.executeUpdate();
        }
    }

    // Method to delete a product
    public void deleteProduct(int id) throws SQLException {
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PRODUCT_SQL)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        }
    }
}
