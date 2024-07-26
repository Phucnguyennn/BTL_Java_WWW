<%@ page import="java.util.List" %>
<%@ page import="dao.ProductDAO" %>
<%@ page import="model.Product" %>
<%
    ProductDAO productDAO = new ProductDAO();
    List<Product> products = productDAO.getAllProducts();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Products</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1>Manage Products</h1>
        <a href="addProduct.jsp" class="btn btn-success mb-3">Add New Product</a>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Brand</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (Product product : products) { %>
                    <tr>
                        <td><%= product.getId() %></td>
                        <td><%= product.getName() %></td>
                        <td><%= product.getDescription() %></td>
                        <td>$<%= product.getPrice() %></td>
                        <td><%= product.getBrand() %></td>
                        <td>
                            <a href="updateProduct.jsp?id=<%= product.getId() %>" class="btn btn-primary btn-sm">Edit</a>
                            <a href="deleteProduct?id=<%= product.getId() %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?');">Delete</a>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
