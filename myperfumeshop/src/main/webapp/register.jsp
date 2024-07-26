<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <h1>Register</h1>
    <form action="register" method="post">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        <label for="confirmPassword">Confirm Password:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required>
        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" required>
        <button type="submit">Register</button>
    </form>
    <p>Already have an account? <a href="login.jsp">Login here</a>.</p>
</body>
</html>
