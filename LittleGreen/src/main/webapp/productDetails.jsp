<%@ page import="dao.ProductDAO" %>
<%@ page import="model.Product" %>
<%
    int productId = Integer.parseInt(request.getParameter("id"));
    ProductDAO productDAO = new ProductDAO();
    Product product = productDAO.getProductById(productId);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product Details</title>
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
            </ul>
        </div>
    </nav>

    <div class="container mt-5">
        <h1><%=product.getName()%></h1>
        <div class="row">
            <div class="col-md-6">
                <img src="<%=product.getImageUrl()%>" class="img-fluid" alt="<%=product.getName()%>">
            </div>
            <div class="col-md-6">
                <p><%=product.getDescription()%></p>
                <p>Price: $<%=product.getPrice()%></p>
                <p>Brand: <%=product.getBrand()%></p>
                <p>Volume: <%=product.getVolume()%> ml</p>
                <p>Gender: <%=product.getGender()%></p>
                <p>Launch Year: <%=product.getLaunchYear()%></p>
                <form action="addToCart" method="post">
                    <input type="hidden" name="productId" value="<%=product.getId()%>">
                    <div class="form-group">
                        <label for="quantity">Quantity:</label>
                        <input type="number" class="form-control" id="quantity" name="quantity" min="1" max="<%=product.getStockQuantity()%>" value="1">
                    </div>
                    <button type="submit" class="btn btn-primary">Add to Cart</button>
                </form>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
