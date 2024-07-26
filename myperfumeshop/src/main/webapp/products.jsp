<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product List</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <h1>Product List</h1>
    <c:forEach var="product" items="${products}">
        <div>
            <h2><a href="productDetails?id=${product.id}">${product.name}</a></h2>
            <p>${product.description}</p>
            <form action="addToCart" method="post">
                <input type="hidden" name="id" value="${product.id}" />
                <button type="submit">Add to Cart</button>
            </form>
        </div>
    </c:forEach>
</body>
</html>
