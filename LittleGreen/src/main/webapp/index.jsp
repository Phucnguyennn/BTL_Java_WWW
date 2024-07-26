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
    <title>Product List</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1 class="mt-5">Product List</h1>
        <div class="d-flex justify-content-end mb-4">
            <a href="cart.jsp" class="btn btn-success">View Cart</a>
        </div>
        <div class="row">
            <% for (Product product : products) { %>
                <div class="col-md-4">
                    <div class="card mb-4">
                        <img class="card-img-top" src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>">
                        <div class="card-body">
                            <h5 class="card-title"><%= product.getName() %></h5>
                            <p class="card-text">Price: $<%= product.getPrice() %></p>
                            <a href="productDetails.jsp?id=<%= product.getId() %>" class="btn btn-primary">View Details</a>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    </div>
</body>
</html>
