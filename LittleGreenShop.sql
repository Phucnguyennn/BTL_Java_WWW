CREATE TABLE products (
    id INT PRIMARY KEY IDENTITY,
    name NVARCHAR(255) NOT NULL,
    description NVARCHAR(1000),
    price DECIMAL(10, 2) NOT NULL,
    brand NVARCHAR(255),
    fragranceType NVARCHAR(255),
    volume INT,
    gender NVARCHAR(50),
    launchYear INT,
    stockQuantity INT,
    imageUrl NVARCHAR(1000)
);

CREATE TABLE users (
    id INT PRIMARY KEY IDENTITY,
    email NVARCHAR(255) UNIQUE NOT NULL,
    password NVARCHAR(255) NOT NULL,
    name NVARCHAR(255),
    address NVARCHAR(1000),
    phoneNumber NVARCHAR(50)
);

CREATE TABLE orders (
    id INT PRIMARY KEY IDENTITY,
    userId INT FOREIGN KEY REFERENCES users(id),
    orderDate DATE NOT NULL,
    totalAmount DECIMAL(10, 2) NOT NULL,
    status NVARCHAR(50)
);
INSERT INTO products (name, description, price, brand, fragranceType, volume, gender, launchYear, stockQuantity, imageUrl)
VALUES 
('Eau de Parfum 1', 'A floral and fresh fragrance for women.', 120.00, 'BrandA', 'Floral', 50, 'Female', 2022, 100, 'images/product1.jpg'),
('Eau de Toilette 2', 'A woody and spicy scent for men.', 85.00, 'BrandB', 'Woody', 100, 'Male', 2021, 150, 'images/product2.jpg'),
('Unisex Perfume 3', 'A unisex fragrance with citrus notes.', 95.00, 'BrandC', 'Citrus', 75, 'Unisex', 2023, 200, 'images/product3.jpg');

INSERT INTO users (email, password, name, address, phoneNumber)
VALUES 
('john.doe@example.com', 'hashedpassword1', 'John Doe', '123 Elm Street, Springfield', '123-456-7890'),
('jane.smith@example.com', 'hashedpassword2', 'Jane Smith', '456 Oak Avenue, Springfield', '098-765-4321'),
('admin@example.com', 'adminhashedpassword', 'Admin User', '789 Maple Road, Springfield', '111-222-3333');
INSERT INTO orders (userId, orderDate, totalAmount, status)
VALUES 
(1, '2024-07-20', 120.00, 'Shipped'),
(2, '2024-07-21', 85.00, 'Processing'),
(1, '2024-07-22', 95.00, 'Delivered');
