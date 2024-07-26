package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.DatabaseConnection;

public class ProductDAO {
	// Phương thức lấy tất cả sản phẩm
	public List<Product> getAllProducts() {
		List<Product> products = new ArrayList<>();
		String sql = "SELECT * FROM products";
		try (Connection connection = DatabaseConnection.getConnection();
				Statement statement = connection.createStatement();
				ResultSet resultSet = statement.executeQuery(sql)) {
			while (resultSet.next()) {
				Product product = new Product();
				product.setId(resultSet.getInt("id"));
				product.setName(resultSet.getString("name"));
				product.setDescription(resultSet.getString("description"));
				product.setPrice(resultSet.getBigDecimal("price"));
				product.setBrand(resultSet.getString("brand"));
				product.setFragranceType(resultSet.getString("fragrance_type"));
				product.setVolume(resultSet.getInt("volume"));
				product.setGender(resultSet.getString("gender"));
				product.setLaunchYear(resultSet.getInt("launch_year"));
				product.setStockQuantity(resultSet.getInt("stock_quantity"));
				product.setImageUrl(resultSet.getString("image_url"));
				products.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return products;
	}

	// Phương thức lấy sản phẩm theo ID
	public Product getProductById(int id) {
		Product product = null;
		String sql = "SELECT * FROM products WHERE id = ?";
		try (Connection connection = DatabaseConnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setInt(1, id);
			try (ResultSet resultSet = statement.executeQuery()) {
				if (resultSet.next()) {
					product = new Product();
					product.setId(resultSet.getInt("id"));
					product.setName(resultSet.getString("name"));
					product.setDescription(resultSet.getString("description"));
					product.setPrice(resultSet.getBigDecimal("price"));
					product.setBrand(resultSet.getString("brand"));
					product.setFragranceType(resultSet.getString("fragrance_type"));
					product.setVolume(resultSet.getInt("volume"));
					product.setGender(resultSet.getString("gender"));
					product.setLaunchYear(resultSet.getInt("launch_year"));
					product.setStockQuantity(resultSet.getInt("stock_quantity"));
					product.setImageUrl(resultSet.getString("image_url"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return product;
	}

	// Phương thức thêm sản phẩm mới
	public void addProduct(Product product) {
		String sql = "INSERT INTO products (name, description, price, brand, fragrance_type, volume, gender, launch_year, stock_quantity, image_url) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try (Connection connection = DatabaseConnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, product.getName());
			statement.setString(2, product.getDescription());
			statement.setBigDecimal(3, product.getPrice());
			statement.setString(4, product.getBrand());
			statement.setString(5, product.getFragranceType());
			statement.setInt(6, product.getVolume());
			statement.setString(7, product.getGender());
			statement.setInt(8, product.getLaunchYear());
			statement.setInt(9, product.getStockQuantity());
			statement.setString(10, product.getImageUrl());
			statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Phương thức cập nhật sản phẩm
	public void updateProduct(Product product) {
		String sql = "UPDATE products SET name = ?, description = ?, price = ?, brand = ?, fragrance_type = ?, volume = ?, gender = ?, launch_year = ?, stock_quantity = ?, image_url = ? WHERE id = ?";
		try (Connection connection = DatabaseConnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, product.getName());
			statement.setString(2, product.getDescription());
			statement.setBigDecimal(3, product.getPrice());
			statement.setString(4, product.getBrand());
			statement.setString(5, product.getFragranceType());
			statement.setInt(6, product.getVolume());
			statement.setString(7, product.getGender());
			statement.setInt(8, product.getLaunchYear());
			statement.setInt(9, product.getStockQuantity());
			statement.setString(10, product.getImageUrl());
			statement.setInt(11, product.getId());
			statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Phương thức xóa sản phẩm
	public void deleteProduct(int id) {
		String sql = "DELETE FROM products WHERE id = ?";
		try (Connection connection = DatabaseConnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setInt(1, id);
			statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
