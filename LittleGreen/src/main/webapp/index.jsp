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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-color: #f2f2f2;
        }
        .navbar-custom {
            background-color: #f4cd8e;
        }
        .navbar-custom .navbar-brand,
        .navbar-custom .navbar-nav .nav-link {
            color: #348129;
        }
        .card {
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: 0.3s;
        }
        .card:hover {
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
        }
        .card img {
            height: 180px;
            object-fit: contain;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .btn-success {
            background-color: #28a745;
            border: none;
        }
        .btn-success:hover {
            background-color: #218838;
        }
        .form-group label {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-custom">
        <a class="navbar-brand" href="#">Little Green Shop</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mr-auto">
                <!-- Add other nav items here if needed -->
            </ul>
            <form class="form-inline my-2 my-lg-0 mr-3" action="searchProducts.jsp" method="get">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="query">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="cart.jsp">
                        <i class="fas fa-shopping-cart"></i> View Cart
                    </a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container mt-5">
        <form action="filterProducts.jsp" method="get" class="form-inline mb-4">
            <div class="form-group mr-3">
                <label for="brand" class="mr-2">Brand</label>
                <select class="form-control" id="brand" name="brand">
                    <option value="">All</option>
                    <option value="BrandA">Brand A</option>
                    <option value="BrandB">Brand B</option>
                    <!-- Add more brands as needed -->
                </select>
            </div>
            <div class="form-group mr-3">
                <label for="gender" class="mr-2">Gender</label>
                <select class="form-control" id="gender" name="gender">
                    <option value="">All</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <!-- Add more gender options as needed -->
                </select>
            </div>
            <div class="form-group mr-3">
                <label for="price" class="mr-2">Price</label>
                <select class="form-control" id="price" name="price">
                    <option value="">All</option>
                    <option value="0-50">0 - 50</option>
                    <option value="50-100">50 - 100</option>
                    <option value="100-200">100 - 200</option>
                    <!-- Add more price ranges as needed -->
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Filter</button>
        </form>
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
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
