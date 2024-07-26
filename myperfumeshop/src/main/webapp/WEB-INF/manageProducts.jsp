<%@ page import="model.ProductDAO" %>
<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%
    ProductDAO productDAO = new ProductDAO();
    List<Product> products = productDAO.getAllProducts();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Products</title>
</head>
<body>
    <h1>Manage Products</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Brand</th>
            <th>Fragrance Type</th>
            <th>Volume</th>
            <th>Gender</th>
            <th>Launch Year</th>
            <th>Stock Quantity</th>
            <th>Image URL</th>
            <th>Actions</th>
        </tr>
        <% for (Product product : products) { %>
        <tr>
            <td><%= product.getId() %></td>
            <td><%= product.getName() %></td>
            <td><%= product.getDescription() %></td>
            <td><%= product.getPrice() %></td>
            <td><%= product.getBrand() %></td>
            <td><%= product.getFragranceType() %></td>
            <td><%= product.getVolume() %></td>
            <td><%= product.getGender() %></td>
            <td><%= product.getLaunchYear() %></td>
            <td><%= product.getStockQuantity() %></td>
            <td><img src="<%= product.getImageUrl() %>" alt="Product Image" width="100"></td>
            <td>
                <a href="updateProduct.jsp?id=<%= product.getId() %>">Edit</a> |
                <a href="deleteProduct?id=<%= product.getId() %>" onclick="return confirm('Are you sure?')">Delete</a>
            </td>
        </tr>
        <% } %>
    </table>
    <a href="addProduct.jsp">Add New Product</a>
    <a href="index.jsp">Back to Home</a>
</body>
</html>
