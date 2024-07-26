<%@ page import="java.util.List" %>
<%@ page import="model.CartItem" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cart</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <h1>Cart</h1>
    <c:if test="${cart != null && !cart.isEmpty()}">
        <form action="updateCart" method="post">
            <c:forEach var="item" items="${cart}">
                <div>
                    <h2>${item.product.name}</h2>
                    <p>${item.product.description}</p>
                    <p>Price: ${item.product.price}</p>
                    <p>Quantity: <input type="number" name="quantity_${item.product.id}" value="${item.quantity}" min="0" /></p>
                    <button type="submit" formaction="removeFromCart">Remove</button>
                </div>
            </c:forEach>
            <button type="submit">Update Cart</button>
        </form>
        <form action="checkout" method="post">
            <button type="submit">Checkout</button>
        </form>
    </c:if>
    <c:if test="${cart == null || cart.isEmpty()}">
        <p>Your cart is empty.</p>
    </c:if>
</body>
</html>
