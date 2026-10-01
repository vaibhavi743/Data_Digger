# Data_Digger

📊 Project 1 – Data Digger

A beginner-friendly MySQL relational database project created to practice database creation, table relationships, CRUD operations, foreign keys, constraints, filtering, sorting, and aggregate functions.

📌 Project Overview

Data Digger contains four related tables:

Customers – customer information
Orders – customer order informatio
Products – product and stock information
OrderDetails – products included in each order
The project demonstrates how relational tables are connected using Primary Keys and Foreign Keys.

🗂️ Database Structure

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
    ├── pr
