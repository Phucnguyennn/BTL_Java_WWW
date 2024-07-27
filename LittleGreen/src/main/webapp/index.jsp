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
        .navbar-custom .navbar-brand {
            font-weight: bold;
            font-style: italic;
            padding: 2px 5px;
        }
        .navbar-custom .navbar-nav .nav-link.home-link {
            color: #d9534f;
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
                <li class="nav-item">
                    <a class="nav-link home-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link home-link" href="index.jsp">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link home-link" href="#">Contact</a>
                </li>
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
                <!-- Button trigger modal for login/register -->
                <li class="nav-item">
                    <a class="nav-link" href="#" data-toggle="modal" data-target="#authModal">Login / Register</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Modal -->
    <div class="modal fade" id="authModal" tabindex="-1" role="dialog" aria-labelledby="authModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="authModalLabel">Login / Register</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <ul class="nav nav-tabs" id="authTabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="login-tab" data-toggle="tab" href="#login" role="tab" aria-controls="login" aria-selected="true">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="register-tab" data-toggle="tab" href="#register" role="tab" aria-controls="register" aria-selected="false">Register</a>
                        </li>
                    </ul>
                    <div class="tab-content" id="authTabsContent">
                        <div class="tab-pane fade show active" id="login" role="tabpanel" aria-labelledby="login-tab">
                            <form action="login.jsp" method="post">
                                <div class="form-group">
                                    <label for="loginEmail">Email address</label>
                                    <input type="email" class="form-control" id="loginEmail" name="email" placeholder="Enter email">
                                </div>
                                <div class="form-group">
                                    <label for="loginPassword">Password</label>
                                    <input type="password" class="form-control" id="loginPassword" name="password" placeholder="Password">
                                </div>
                                <button type="submit" class="btn btn-primary">Login</button>
                            </form>
                        </div>
                        <div class="tab-pane fade" id="register" role="tabpanel" aria-labelledby="register-tab">
                            <form action="register.jsp" method="post">
                                <div class="form-group">
                                    <label for="registerName">Name</label>
                                    <input type="text" class="form-control" id="registerName" name="name" placeholder="Enter name">
                                </div>
                                <div class="form-group">
                                    <label for="registerEmail">Email address</label>
                                    <input type="email" class="form-control" id="registerEmail" name="email" placeholder="Enter email">
                                </div>
                                <div class="form-group">
                                    <label for="registerPassword">Password</label>
                                    <input type="password" class="form-control" id="registerPassword" name="password" placeholder="Password">
                                </div>
                                <button type="submit" class="btn btn-primary">Register</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

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


    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
