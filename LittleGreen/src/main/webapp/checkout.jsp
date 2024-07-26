<%@ page import="model.Cart" %>
<%@ page import="model.CartItem" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%
    Cart cart = (Cart) session.getAttribute("cart");
    if (cart == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    List<CartItem> items = cart.getItems();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Checkout</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1>Checkout</h1>
        <% if (items.isEmpty()) { %>
            <p>Your cart is empty. <a href="index.jsp">Shop now</a>.</p>
        <% } else { %>
            <form action="placeOrder" method="post">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" class="form-control" id="address" name="address" required>
                </div>
                <div class="form-group">
                    <label for="phoneNumber">Phone Number:</label>
                    <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" required>
                </div>
                <div class="form-group">
                    <label for="paymentMethod">Payment Method:</label>
                    <select class="form-control" id="paymentMethod" name="paymentMethod" required>
                        <option value="Credit Card">Credit Card</option>
                        <option value="PayPal">PayPal</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-success">Place Order</button>
            </form>
        <% } %>
    </div>
</body>
</html>
