<%@ page import="model.ProductDAO" %>
<%@ page import="model.Product" %>
<%
    ProductDAO productDAO = new ProductDAO();
    int productId = Integer.parseInt(request.getParameter("id"));
    Product product = productDAO.getProductById(productId);
%>
<!DOCTYPE html>
<html>
<head>
    <title><%= product.getName() %></title>
</head>
<body>
    <h1><%= product.getName() %></h1>
    <p>Description: <%= product.getDescription() %></p>
    <p>Price: <%= product.getPrice() %></p>
    <p>Brand: <%= product.getBrand() %></p>
    <p>Fragrance Type: <%= product.getFragranceType() %></p>
    <p>Volume: <%= product.getVolume() %> ml</p>
    <p>Gender: <%= product.getGender() %></p>
    <p>Launch Year: <%= product.getLaunchYear() %></p>
    <p>Stock Quantity: <%= product.getStockQuantity() %></p>
    <img src="<%= product.getImageUrl() %>" alt="Product Image">
    <form action="addToCart" method="post">
        <input type="hidden" name="productId" value="<%= product.getId() %>">
        <label for="quantity">Quantity:</label>
        <input type="number" name="quantity" min="1" value="1">
        <button type="submit">Add to Cart</button>
    </form>
    <a href="index.jsp">Back to Products</a>
</body>
</html>
