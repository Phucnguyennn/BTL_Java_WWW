<%@ page import="dao.ProductDAO"%>
<%@ page import="model.Product"%>
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div class="container mt-5">
		<h1><%=product.getName()%></h1>
		<div class="row">
			<div class="col-md-6">
				<img src="<%=product.getImageUrl()%>" class="img-fluid"
					alt="<%=product.getName()%>">
			</div>
			<div class="col-md-6">
				<p><%=product.getDescription()%></p>
				<p>
					Price: $<%=product.getPrice()%></p>
				<p>
					Brand:
					<%=product.getBrand()%></p>
				<p>
					Volume:
					<%=product.getVolume()%>ml
				</p>
				<p>
					Gender:
					<%=product.getGender()%></p>
				<p>
					Launch Year:
					<%=product.getLaunchYear()%></p>
				<form action="addToCart" method="post">
					<input type="hidden" name="productId"
						value="<%=product.getId()%>">
					<div class="form-group">
						<label for="quantity">Quantity:</label> <input type="number"
							class="form-control" id="quantity" name="quantity" min="1"
							max="<%=product.getStockQuantity()%>" value="1">
					</div>
					<button type="submit" class="btn btn-primary">Add to Cart</button>
				</form>

			</div>
		</div>
	</div>
</body>
</html>
