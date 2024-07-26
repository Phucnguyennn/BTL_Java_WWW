<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin - Manage Products</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <h1>Manage Products</h1>
    <a href="addProduct.jsp">Add New Product</a>
    <c:forEach var="product" items="${products}">
        <div>
            <h2>${product.name}</h2>
            <p>${product.description}</p>
            <a href="editProduct.jsp?id=${product.id}">Edit</a>
            <form action="deleteProduct" method="post" style="display:inline;">
                <input type="hidden" name="id" value="${product.id}" />
                <button type="submit">Delete</button>
            </form>
        </div>
    </c:forEach>
</body>
</html>
