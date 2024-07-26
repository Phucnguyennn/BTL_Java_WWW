<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Product</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1>Add New Product</h1>
        <form action="addProduct" method="post">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea class="form-control" id="description" name="description" required></textarea>
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" step="0.01" class="form-control" id="price" name="price" required>
            </div>
            <div class="form-group">
                <label for="brand">Brand:</label>
                <input type="text" class="form-control" id="brand" name="brand" required>
            </div>
            <div class="form-group">
                <label for="fragranceType">Fragrance Type:</label>
                <input type="text" class="form-control" id="fragranceType" name="fragranceType" required>
            </div>
            <div class="form-group">
                <label for="volume">Volume (ml):</label>
                <input type="number" class="form-control" id="volume" name="volume" required>
            </div>
            <div class="form-group">
                <label for="gender">Gender:</label>
                <select class="form-control" id="gender" name="gender" required>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Unisex">Unisex</option>
                </select>
            </div>
            <div class="form-group">
                <label for="launchYear">Launch Year:</label>
                <input type="number" class="form-control" id="launchYear" name="launchYear" required>
            </div>
            <div class="form-group">
                <label for="stockQuantity">Stock Quantity:</label>
                <input type="number" class="form-control" id="stockQuantity" name="stockQuantity" required>
            </div>
            <div class="form-group">
                <label for="imageUrl">Image URL:</label>
                <input type="text" class="form-control" id="imageUrl" name="imageUrl" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Product</button>
        </form>
    </div>
</body>
</html>
