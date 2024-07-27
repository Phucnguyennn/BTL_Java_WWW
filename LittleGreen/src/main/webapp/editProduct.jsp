<%@ page import="model.Product" %>
<%@ page import="dao.ProductDAO" %>
<%
    int productId = Integer.parseInt(request.getParameter("id"));
    ProductDAO productDAO = new ProductDAO();
    Product product = productDAO.getProductById(productId);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Product</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Edit Product</h2>
        <form action="editProduct" method="post">
            <input type="hidden" name="id" value="<%= product.getId() %>">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name" value="<%= product.getName() %>" required>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea class="form-control" id="description" name="description" required><%= product.getDescription() %></textarea>
            </div>
            <div class="form-group">
                <label for="price">Price</label>
                <input type="number" class="form-control" id="price" name="price" value="<%= product.getPrice() %>" step="0.01" required>
            </div>
            <div class="form-group">
                <label for="brand">Brand</label>
                <input type="text" class="form-control" id="brand" name="brand" value="<%= product.getBrand() %>" required>
            </div>
            <div class="form-group">
                <label for="fragranceType">Fragrance Type</label>
                <input type="text" class="form-control" id="fragranceType" name="fragranceType" value="<%= product.getFragranceType() %>" required>
            </div>
            <div class="form-group">
                <label for="volume">Volume (ml)</label>
                <input type="number" class="form-control" id="volume" name="volume" value="<%= product.getVolume() %>" required>
            </div>
            <div class="form-group">
                <label for="gender">Gender</label>
                <input type="text" class="form-control" id="gender" name="gender" value="<%= product.getGender() %>" required>
            </div>
            <div class="form-group">
                <label for="launchYear">Launch Year</label>
                <input type="number" class="form-control" id="launchYear" name="launchYear" value="<%= product.getLaunchYear() %>" required>
            </div>
            <div class="form-group">
                <label for="stockQuantity">Stock Quantity</label>
                <input type="number" class="form-control" id="stockQuantity" name="stockQuantity" value="<%= product.getStockQuantity() %>" required>
            </div>
            <div class="form-group">
                <label for="imageUrl">Image URL</label>
                <input type="text" class="form-control" id="imageUrl" name="imageUrl" value="<%= product.getImageUrl() %>" required>
            </div>
            <button type="submit" class="btn btn-primary">Save Changes</button>
            <a href="indexAdmin.jsp" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</body>
</html>
