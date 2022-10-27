CREATE TABLE Customer (
    customerId INTEGER,
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    email VARCHAR(255),
    phoneNum VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    postalCode VARCHAR(5),
    country VARCHAR(255),
    userId CHAR(8),
    password VARCHAR(255),

    PRIMARY KEY (customerId)
);

CREATE TABLE PaymentMethod (
    paymentMethodId CHAR(8),
    paymentType VARCHAR(25),
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
    shipToAddress VARCHAR(255),
    shipToCity VARCHAR(255),
    shipToCountry VARCHAR(255),
    shipToPostalCode VARCHAR(5),
    customerId INTEGER,

    PRIMARY KEY (orderId),
    FOREIGN KEY (customerId) REFERENCES Customer (customerId)
);

CREATE TABLE IsCart (
    inCartQuantity INTEGER,
    inCartPrice DECIMAL(9, 2),
    customerId INTEGER,

    FOREIGN KEY (customerId) REFERENCES Customer (customerId)
);

CREATE TABLE Review (
    reviewId INTEGER,
    reviewRating INTEGER,
    reviewComment VARCHAR(255),
    reviewDate DATE,
    customerId INTEGER,

    PRIMARY KEY (reviewId),
    FOREIGN KEY (customerId) REFERENCES Customer (customerId)
);
 
 somthing