# Data_Digger

# 📊 Project 1 – Data Digger

A beginner-friendly **MySQL relational database project** created to practice database creation, table relationships, CRUD operations, foreign keys, constraints, filtering, sorting, and aggregate functions.

## 📌 Project Overview

**Data Digger** contains four related tables:

- **Customers** – customer information
- **Orders** – customer order information
- **Products** – product and stock information
- **OrderDetails** – products included in each order

The project demonstrates how relational tables are connected using **Primary Keys** and **Foreign Keys**.

## 🗂️ Database Structure

```text
data_digger
│
├── Customers
│   ├── Customer_id (Primary Key)
│   ├── Name
│   ├── Email
│   └── Address
│
├── Orders
│   ├── Order_id (Primary Key)
│   ├── Customer_id (Foreign Key)
│   ├── OrderDate
│   └── TotalAmount
│
├── Products
│   ├── product_id (Primary Key)
│   ├── product_name
│   ├── price
│   └── stock
│
└── OrderDetails
    ├── OrderDetail_id (Primary Key)
    ├── Order_id (Foreign Key)
    ├── product_id (Foreign Key)
    ├── quantity
    └── SubTotal
```

## 🔗 Table Relationships

```text
Customers
    │
    │ Customer_id
    ▼
Orders
    │
    │ Order_id
    ▼
OrderDetails
    ▲
    │ product_id
    │
Products
```

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| MySQL | Database management |
| SQL | Queries and data operations |
| MySQL Command Line | Query execution |

## 📚 SQL Concepts Practiced

- Database and table creation
- Primary Keys
- Foreign Keys
- `ON DELETE CASCADE`
- `INSERT`
- `SELECT`
- `UPDATE`
- `DELETE`
- `WHERE`
- `ORDER BY`
- `LIMIT`
- `BETWEEN`
- `GROUP BY`
- `SUM()`
- `COUNT()`
- `MAX()`
- `MIN()`
- `AVG()`
- Referential integrity
- Relational database concepts

## 👤 Customers

The `Customers` table stores customer ID, name, email, and address.

```sql
SELECT * FROM Customers;
```

Update a customer's address:

```sql
UPDATE Customers
SET Address = 'Varasada'
WHERE Customer_id = 103;
```

Find a specific customer:

```sql
SELECT *
FROM Customers
WHERE Name = 'Alice';
```

## 🛒 Orders

The `Orders` table stores order ID, customer ID, order date, and total amount.

```sql
SELECT * FROM Orders;
```

Find orders for a particular customer:

```sql
SELECT *
FROM Orders
WHERE Customer_id = 101;
```

Find the highest, lowest, and average order amount:

```sql
SELECT
    MAX(TotalAmount) AS Highest_Order,
    MIN(TotalAmount) AS Lowest_Order,
    AVG(TotalAmount) AS Average_Order
FROM Orders;
```

## 📦 Products

The `Products` table stores product ID, product name, price, and stock.

```sql
SELECT * FROM Products;
```

Sort products by price:

```sql
SELECT *
FROM Products
ORDER BY price DESC;
```

Find products within a price range:

```sql
SELECT *
FROM Products
WHERE price BETWEEN 500 AND 2000;
```

Find the most expensive and cheapest product prices:

```sql
SELECT
    MAX(price) AS most_expensive,
    MIN(price) AS cheapest
FROM Products;
```

## 🧾 OrderDetails

The `OrderDetails` table connects orders with products and stores quantity and subtotal.

```sql
SELECT * FROM OrderDetails;
```

Find details of a particular order:

```sql
SELECT *
FROM OrderDetails
WHERE Order_id = 103;
```

Calculate total revenue:

```sql
SELECT SUM(SubTotal) AS Total_Revenue
FROM OrderDetails;
```

Count how many order-detail records contain a product:

```sql
SELECT COUNT(*)
FROM OrderDetails
WHERE product_id = 1;
```

## 🔐 Foreign Key Relationships

### Orders → Customers

```sql
FOREIGN KEY (Customer_id)
REFERENCES Customers(Customer_id)
ON DELETE CASCADE
```

### OrderDetails → Orders

```sql
FOREIGN KEY (Order_id)
REFERENCES Orders(Order_id)
ON DELETE CASCADE
```

### OrderDetails → Products

```sql
FOREIGN KEY (product_id)
REFERENCES Products(product_id)
```

## ▶️ How to Run

### 1. Open MySQL

Open MySQL Command Line Client or another MySQL-compatible SQL environment.

### 2. Create and select the database

```sql
CREATE DATABASE data_digger;
USE data_digger;
```

### 3. Run the SQL file

Execute the commands from:

```text
project 1.sql
```

### 4. Check the tables

```sql
SHOW TABLES;
```

### 5. View the data

```sql
SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM Products;
SELECT * FROM OrderDetails;
```

## 🎯 Project Objective

The objective of **Data Digger** is to build a small practical relational database and understand how multiple tables work together using SQL.

The project provides hands-on practice with **database design, CRUD operations, constraints, relationships, and basic data analysis**.

## 📁 Project Files

```text
Project-1-Data-Digger/
│
├── project 1.sql
└── README.md
```

## 👩‍💻 Author

**Vaibhavi Khokhani**
