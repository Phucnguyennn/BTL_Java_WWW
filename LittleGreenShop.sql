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
    phoneNumber NVARCHAR(50),
	role VARCHAR(50) NOT NULL
);

CREATE TABLE orders (
    id INT PRIMARY KEY IDENTITY,
    userId INT FOREIGN KEY REFERENCES users(id),
    orderDate DATE NOT NULL,
    totalAmount DECIMAL(10, 2) NOT NULL,
    status NVARCHAR(50)
);
INSERT INTO products (name, description, price, brand, fragranceType, volume, gender, launchYear, stockQuantity, imageUrl) VALUES
('Chanel No. 5', 'A classic fragrance with a floral bouquet.', 120.00, 'Chanel', 'Floral', 100, 'Female', 1921, 50, 'images/chanel-no5.jpg'),
('Dior Sauvage', 'A fresh and spicy scent with notes of bergamot and pepper.', 95.00, 'Dior', 'Woody', 100, 'Male', 2015, 60, 'images/dior-sauvage.jpg'),
('Gucci Bloom', 'A rich floral fragrance with notes of jasmine and tuberose.', 110.00, 'Gucci', 'Floral', 100, 'Female', 2017, 45, 'images/gucci-bloom.jpg'),
('Creed Aventus', 'A bold and sophisticated fragrance with notes of pineapple and musk.', 300.00, 'Creed', 'Fruity', 100, 'Male', 2010, 30, 'images/creed-aventus.jpg'),
('Yves Saint Laurent Black Opium', 'A sweet and spicy fragrance with coffee and vanilla notes.', 100.00, 'Yves Saint Laurent', 'Oriental', 90, 'Female', 2014, 70, 'images/ysl-black-opium.jpg'),
('Tom Ford Noir', 'A warm and spicy fragrance with notes of amber and leather.', 150.00, 'Tom Ford', 'Oriental', 100, 'Male', 2012, 40, 'images/tom-ford-noir.jpg'),
('Calvin Klein Euphoria', 'A luxurious fragrance with notes of pomegranate and orchid.', 85.00, 'Calvin Klein', 'Floral', 100, 'Female', 2005, 65, 'images/ck-euphoria.jpg'),
('Dolce & Gabbana Light Blue', 'A fresh and fruity fragrance with notes of Sicilian lemon and apple.', 95.00, 'Dolce & Gabbana', 'Citrus', 100, 'Female', 2001, 50, 'images/dg-light-blue.jpg'),
('Burberry Brit Rhythm', 'A bold and edgy fragrance with notes of basil and leather.', 120.00, 'Burberry', 'Woody', 100, 'Male', 2013, 35, 'images/burberry-brit-rhythm.jpg'),
('Marc Jacobs Daisy', 'A youthful and playful fragrance with notes of wild strawberry and violet.', 90.00, 'Marc Jacobs', 'Floral', 75, 'Female', 2007, 55, 'images/marc-jacobs-daisy.jpg'),
('Paco Rabanne 1 Million', 'A spicy and woody fragrance with notes of cinnamon and leather.', 110.00, 'Paco Rabanne', 'Spicy', 100, 'Male', 2008, 40, 'images/paco-rabanne-1-million.jpg'),
('Jean Paul Gaultier Le Male', 'A classic fragrance with notes of mint and vanilla.', 100.00, 'Jean Paul Gaultier', 'Oriental', 125, 'Male', 1995, 60, 'images/jpg-le-male.jpg'),
('Chloe Eau de Parfum', 'A sophisticated fragrance with notes of peony and rose.', 130.00, 'Chloe', 'Floral', 75, 'Female', 2008, 45, 'images/chloe-eau-de-parfum.jpg'),
('Givenchy Gentlemen Only', 'A refined fragrance with notes of leather and patchouli.', 105.00, 'Givenchy', 'Woody', 100, 'Male', 2013, 50, 'images/givenchy-gentlemen-only.jpg'),
('Prada Candy', 'A sweet and sensual fragrance with notes of caramel and musk.', 95.00, 'Prada', 'Oriental', 80, 'Female', 2011, 70, 'images/prada-candy.jpg'),
('Hermes Terre dHermes', 'A woody and spicy fragrance with notes of orange and vetiver.', 140.00, 'Hermes', 'Woody', 100, 'Male', 2006, 40, 'images/hermes-terre-dhermes.jpg'),
('Giorgio Armani Si', 'A modern and elegant fragrance with notes of blackcurrant and vanilla.', 115.00, 'Giorgio Armani', 'Floral', 100, 'Female', 2013, 60, 'images/armani-si.jpg'),
('Hugo Boss Bottled', 'A fresh and woody fragrance with notes of apple and cinnamon.', 85.00, 'Hugo Boss', 'Woody', 100, 'Male', 1998, 75, 'images/hugo-boss-bottled.jpg'),
('Bvlgari Omnia Crystalline', 'A light and floral fragrance with notes of bamboo and lotus.', 90.00, 'Bvlgari', 'Floral', 65, 'Female', 2005, 65, 'images/bvlgari-omnia-crystalline.jpg'),
('Issey Miyake Issey', 'A fresh and aquatic fragrance with notes of yuzu and lotus.', 100.00, 'Issey Miyake', 'Aquatic', 100, 'Female', 1992, 50, 'images/issey-miyake-leau-dissey.jpg'),
('Kenzo Flower by Kenzo', 'A floral fragrance with notes of poppy and vanilla.', 100.00, 'Kenzo', 'Floral', 100, 'Female', 2000, 55, 'images/kenzo-flower.jpg'),
('Jo Malone London Peony & Blush Suede', 'A delicate and feminine fragrance with notes of peony and suede.', 125.00, 'Jo Malone', 'Floral', 100, 'Female', 2013, 45, 'images/jomalone-peony-blush-suede.jpg'),
('Maison Francis Kurkdjian Baccarat Rouge 540', 'A luxurious and complex fragrance with notes of amber and saffron.', 350.00, 'Maison Francis Kurkdjian', 'Oriental', 70, 'Female', 2015, 30, 'images/maison-francis-kurkdjian-baccarat-rouge-540.jpg'),
('Tiffany & Co. Tiffany', 'A sparkling fragrance with notes of bergamot and iris.', 120.00, 'Tiffany & Co.', 'Floral', 75, 'Female', 2017, 50, 'images/tiffany-co-tiffany.jpg'),
('Burberry My Burberry', 'A modern and elegant fragrance with notes of rose and patchouli.', 110.00, 'Burberry', 'Floral', 90, 'Female', 2014, 65, 'images/burberry-my-burberry.jpg'),
('Montblanc Legend', 'A fresh and woody fragrance with notes of bergamot and oakmoss.', 100.00, 'Montblanc', 'Woody', 100, 'Male', 2011, 50, 'images/montblanc-legend.jpg'),
('Dolce & Gabbana The One', 'A warm and spicy fragrance with notes of amber and tobacco.', 110.00, 'Dolce & Gabbana', 'Oriental', 100, 'Male', 2008, 60, 'images/dg-the-one.jpg'),
('Abercrombie & Fitch Fierce', 'A bold and masculine fragrance with notes of musk and sandalwood.', 85.00, 'Abercrombie & Fitch', 'Woody', 100, 'Male', 2002, 70, 'images/abercrombie-fierce.jpg');


INSERT INTO Users (email, password, name, address, phoneNumber, role) VALUES
('admin@example.com', 'admin123', 'Admin User', '123 Admin Street', '1234567890', 'admin'),
('customer1@example.com', 'cust123', 'Customer One', '456 Customer Lane', '2345678901', 'customer'),
('customer2@example.com', 'cust123', 'Customer Two', '789 Customer Blvd', '3456789012', 'customer'),
('customer3@example.com', 'cust123', 'Customer Three', '101 Customer Road', '4567890123', 'customer'),
('customer4@example.com', 'cust123', 'Customer Four', '202 Customer Avenue', '5678901234', 'customer');



INSERT INTO orders (userId, orderDate, totalAmount, status)
VALUES 
(1, '2024-07-20', 120.00, 'Shipped'),
(2, '2024-07-21', 85.00, 'Processing'),
(1, '2024-07-22', 95.00, 'Delivered');
