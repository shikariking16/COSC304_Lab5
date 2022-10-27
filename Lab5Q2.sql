CREATE TABLE Customer (
    customerId INTEGER,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    email VARCHAR(MAX),
    phoneNum INTEGER,
    address VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postalCode VARCHAR(10),
    country VARCHAR(20),
    userId int,
    password VARCHAR(20),

    PRIMARY KEY (customerId)
);

CREATE TABLE PaymentMethod (
    paymentMethodId INTEGER,
    paymentType VARCHAR(50),
    paymentNumber INTEGER,
    paymentExpiryDate DATE,
    customerId INTEGER,

    PRIMARY KEY (paymentMethodId),
    FOREIGN KEY (customerId) REFERENCES Customer (customerId)
);

CREATE TABLE OrderSummary (
    orderId INTEGER,
    orderDate DATE,
    totalAmount INTEGER,
    shipToAddress VARCHAR(50),
    shipToCity VARCHAR(50),
    shipToCountry VARCHAR(50),
    shipToPostalCode VARCHAR(10),
    customerId INTEGER,

    PRIMARY KEY (orderId),
    FOREIGN KEY (customerId) REFERENCES Customer (customerId)
);

CREATE TABLE InCart (
    inCartQuantity INTEGER,
    inCartPrice DECIMAL(9, 2),
    customerId INTEGER,
    productId INTEGER,

    FOREIGN KEY (customerId) REFERENCES Customer (customerId),
    FOREIGN KEY (productId) REFERENCES Product (productId)
);

CREATE TABLE Review (
    reviewId INTEGER,
    reviewRating INTEGER,
    reviewComment VARCHAR(1000),
    reviewDate DATE,
    customerId INTEGER,
    productId INTEGER

    PRIMARY KEY (reviewId),
    FOREIGN KEY (customerId) REFERENCES Customer (customerId),
    FOREIGN KEY (productId) REFERENCES Product (productId)
);

CREATE TABLE InShipment (
    orderId INTEGER,
    shipmentId INTEGER,

    FOREIGN KEY (orderId) REFERENCES OrderSummary (orderId),
    FOREIGN KEY (shipmentId) REFERENCES Shipment (shipmentId)
);

CREATE TABLE Shipment (
    shipmentId INTEGER,
    shipmentDate DATE,
    shipmentDesc VARCHAR(50),
    warehouseId INTEGER,

    PRIMARY KEY (shipmentId),
    FOREIGN KEY (warehouseId) REFERENCES Warehouse (warehouseId)
);

CREATE TABLE OrderProduct (
    orderProductQuantity INTEGER,
    orderProductPrice DECIMAL(9,2),
    orderId INTEGER,
    productId INTEGER,

    FOREIGN KEY (orderId) REFERENCES OrderSummary (orderId),
    FOREIGN KEY (productId) REFERENCES Product (productId)
);

CREATE TABLE Warehouse (
    warehouseId INTEGER,
    warehouseName VARCHAR(30),

    PRIMARY KEY (warehouseId)
);

CREATE TABLE ProductInventory (
    inventoryQuantity INTEGER,
    warehouseId INTEGER,
    productId INTEGER,

    FOREIGN KEY (warehouseId) REFERENCES Warehouse (warehouseId),
    FOREIGN KEY (productId) REFERENCES Product (productId)
);

CREATE TABLE Product (
    productId INTEGER,
    productName VARCHAR(50),
    productPrice DECIMAL(9,2),
    productImageURL VARCHAR(1000),
    productImage VARCHAR(1000),
    productDesc VARCHAR(1000),
    categoryId INTEGER,

    PRIMARY KEY (productId),
    FOREIGN KEY (categoryId) REFERENCES Category (categoryId)
);

CREATE TABLE Category (
    categoryId INTEGER,
    categoryName VARCHAR(40),

    PRIMARY KEY (categoryId)
)