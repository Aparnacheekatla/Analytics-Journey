-- Amazon Marketplace Operations Analytics
-- File: 01_schema.sql
-- Purpose:
-- Create the transactional sales table for storing Amazon marketplace order data.
-- Author: Aparna Cheekatla
-- Date: 2026-06-29

CREATE DATABASE IF NOT EXISTS amazon_marketplace;

USE amazon_marketplace;

CREATE TABLE amazon_sales(
	OrderID VARCHAR(30) primary key,
	OrderDate DATE NOT NULL,
	CustomerID VARCHAR(30) NOT NULL,
	CustomerName VARCHAR(50) NOT NULL,
	ProductID VARCHAR(20) not NULL,
	ProductName VARCHAR(150) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Brand VARCHAR(50) NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    Discount DECIMAL(4,3) NOT NULL,
    Tax DECIMAL(10,2) NOT NULL,
    ShippingCost DECIMAL(10,2) NOT NULL,
    TotalAmount DECIMAL(12,2) NOT NULL,
    PaymentMethod VARCHAR(30) NOT NULL,
    OrderStatus VARCHAR(30) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    SellerID VARCHAR(20) NOT NULL
);

SHOW TABLES;

