<%@ page import="model.Cart" %>
<%@ page import="model.CartItem" %>
<%
    Cart cart = (Cart) session.getAttribute("cart");
    if (cart == null) {
        cart = new Cart();
        session.setAttribute("cart", cart);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cart</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1>Your Cart</h1>
        <div class="d-flex justify-content-end mb-4">
            <a href="index.jsp" class="btn btn-success">View Product List</a>
        </div>
        <% if (cart.getItems().isEmpty()) { %>
            <p>Your cart is empty. <a href="index.jsp">Shop now</a>.</p>
        <% } else { %>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (CartItem item : cart.getItems()) { %>
                        <tr>
                            <td><%= item.getProduct().getName() %></td>
                            <td>
                                <form action="updateCart" method="post" class="form-inline">
                                    <input type="hidden" name="productId" value="<%= item.getProduct().getId() %>">
                                    <input type="number" name="quantity" value="<%= item.getQuantity() %>" class="form-control mr-2" min="0">
                                    <button type="submit" class="btn btn-primary">Update</button>
                                </form>
                            </td>
                            <td><%= item.getProduct().getPrice() %></td>
                            <td><%= item.getTotalPrice() %></td>
                            <td>
                                <form action="removeFromCart" method="post">
                                    <input type="hidden" name="productId" value="<%= item.getProduct().getId() %>">
                                    <button type="submit" class="btn btn-danger">Remove</button>
                                </form>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
            <div class="text-right">
                <h4>Total: <%= cart.getTotalPrice() %></h4>
                <a href="checkout.jsp" class="btn btn-success">Proceed to Checkout</a>
            </div>
        <% } %>
    </div>
</body>
</html>
