create database data_digger;

Query OK, 1 row affected (0.779 sec)

use data_digger;
database Changed

create table customers(
    Customer_id int primary key,
    Name varchar(50),
    Email varchar(30),
    Address varchar(50)
);

Query OK, 0 rows affected (3.962 sec)


insert into customers(Customer_id,Name,Email,Address)
values(101,"vaibhavi","vk@gmail.com","amreli"),
(102,"Alice","ak@gmail.com","surat"),
(103,"Bob","ba@gmail.com","lathi"),
(104,"Charle","ch@gmail.com","vapi"),
(105,"David","da@gmail.com","varudi");

Query OK, 5 rows affected (0.170 sec)
Records: 5  Duplicates: 0  Warnings: 0

select * from customers;

+-------------+----------+--------------+---------+
| Customer_id | Name     | Email        | Address |
+-------------+----------+--------------+---------+
|         101 | vaibhavi | vk@gmail.com | amreli  |
|         102 | Alice    | ak@gmail.com | surat   |
|         103 | Bob      | ba@gmail.com | lathi   |
|         104 | Charle   | ch@gmail.com | vapi    |
|         105 | David    | da@gmail.com | varudi  |
+-------------+----------+--------------+---------+
5 rows in set (0.010 sec)

update customers set Address="varasada" where Customer_id=103;

Query OK, 1 row affected (0.196 sec)
Rows matched: 1  Changed: 1  Warnings: 0

select * from customers;
+-------------+----------+--------------+----------+
| Customer_id | Name     | Email        | Address  |
+-------------+----------+--------------+----------+
|         101 | vaibhavi | vk@gmail.com | amreli   |
|         102 | Alice    | ak@gmail.com | surat    |
|         103 | Bob      | ba@gmail.com | varasada |
|         104 | Charle   | ch@gmail.com | vapi     |
|         105 | David    | da@gmail.com | varudi   |
+-------------+----------+--------------+----------+
5 rows in set (0.009 sec)

delete from customers where Customer_id=104;
Query OK, 1 row affected (1.107 sec)

select * from customers;

+-------------+----------+--------------+----------+
| Customer_id | Name     | Email        | Address  |
+-------------+----------+--------------+----------+
|         101 | vaibhavi | vk@gmail.com | amreli   |
|         102 | Alice    | ak@gmail.com | surat    |
|         103 | Bob      | ba@gmail.com | varasada |
|         105 | David    | da@gmail.com | varudi   |
+-------------+----------+--------------+----------+
4 rows in set (0.012 sec)

select * from customers where Name="Alice";

+-------------+-------+--------------+---------+
| Customer_id | Name  | Email        | Address |
+-------------+-------+--------------+---------+
|         102 | Alice | ak@gmail.com | surat   |
+-------------+-------+--------------+---------+
1 row in set (0.034 sec)

create table orders(
    Order_id int primary key,
    Customer_id int,
    OrderDate DATE,
    TotalAmount decimal(10,2),
    FOREIGN KEY(Customer_id)
    REFERENCES customers(Customer_id)
    ON DELETE CASCADE
);

Query OK, 0 rows affected (2.611 sec)


insert into Orders
(Order_id, Customer_id, OrderDate, TotalAmount)
values
(1, 101, '2026-09-28', 5000.00),
(2, 102, '2026-09-20', 4500.00),
(3, 103, '2026-09-15', 1000.00),
(4, 104, '2026-09-10', 4600.00),
(5, 105, '2026-08-20', 300.00);

Query OK, 5 rows affected (0.442 sec)
Records: 5  Duplicates: 0  Warnings: 0

select * from orders;

+----------+-------------+------------+-------------+
| Order_id | Customer_id | OrderDate  | TotalAmount |
+----------+-------------+------------+-------------+
|        1 |         101 | 2026-09-28 |     5000.00 |
|        2 |         102 | 2026-09-20 |     4500.00 |
|        3 |         103 | 2026-09-15 |     1000.00 |
|        4 |         104 | 2026-09-10 |     4600.00 |
|        5 |         105 | 2026-08-20 |      300.00 |
+----------+-------------+------------+-------------+
5 rows in set (0.010 sec)

select * from orders where Customer_id=101;

+----------+-------------+------------+-------------+
| Order_id | Customer_id | OrderDate  | TotalAmount |
+----------+-------------+------------+-------------+
|        1 |         101 | 2024-09-28 |       5000.00 |
+----------+-------------+------------+-------------+
1 row in set (0.013 sec)

update orders set TotalAmount=65000 where Order_id=3;

Query OK, 1 row affected (0.164 sec)
Rows matched: 1  Changed: 1  Warnings: 0

delete from orders where Order_id=2;

Query OK, 1 row affected (0.097 sec)

select * from orders where OrderDate >= CURDATE() - interval 30 day;

+----------+-------------+------------+-------------+
| Order_id | Customer_id | OrderDate  | TotalAmount |
+----------+-------------+------------+-------------+
|        1 |         101 | 2026-09-28 |     5000.00 |
|        2 |         102 | 2026-09-20 |     4500.00 |
|        3 |         103 | 2026-09-15 |    65000.00 |
|        4 |         104 | 2026-09-10 |     4600.00 |
+----------+-------------+------------+-------------+
4 rows in set (0.163 sec)

select max(TotalAmount) as highest_amount,
min(TotalAmount) as lowest_amount,
avg(TotalAmount) as average_amount from orders;

+----------------+---------------+----------------+
| highest_amount | lowest_amount | average_amount |
+----------------+---------------+----------------+
|       65000.00 |      300.00   |   15880.000000 |
+----------------+---------------+----------------+
1 row in set (0.161 sec)

create table products(
    product_id int primary key,
    product_name varchar(30),
    price decimal(10,2),
    stock int
);

Query OK, 0 rows affected (0.792 sec)

insert into products(product_id,product_name,price,stock)
values(01,"laptop",2500.00,15),
(02,"mouse",1500.00,6),
(03,"table",1000.00,10),
(04,"cpu",5000.00,7),
(05,"light",300.00,0);

Query OK, 5 rows affected (0.220 sec)
Records: 5  Duplicates: 0  Warnings: 0

select * from products;

+------------+--------------+---------+-------+
| product_id | product_name | price   | stock |
+------------+--------------+---------+-------+
|          1 | laptop       | 2500.00 |    15 |
|          2 | mouse        | 1500.00 |     6 |
|          3 | table        | 1000.00 |    10 |
|          4 | cpu          | 5000.00 |     7 |
|          5 | light        |  300.00 |     0 |
+------------+--------------+---------+-------+
5 rows in set (0.010 sec)

select * from products order by price desc;

+------------+--------------+---------+-------+
| product_id | product_name | price   | stock |
+------------+--------------+---------+-------+
|          4 | cpu          | 5000.00 |     7 |
|          1 | laptop       | 2500.00 |    15 |
|          2 | mouse        | 1500.00 |     6 |
|          3 | table        | 1000.00 |    10 |
|          5 | light        |  300.00 |     0 |
+------------+--------------+---------+-------+
5 rows in set (0.099 sec)

update products set price=2300 where product_id=04;

Query OK, 1 row affected (0.110 sec)
Rows matched: 1  Changed: 1  Warnings: 0

delete from products where stock =0;

Query OK, 0 rows affected (0.013 sec)

select * from products where price between 500 and 2000;

+------------+--------------+---------+-------+
| product_id | product_name | price   | stock |
+------------+--------------+---------+-------+
|          2 | mouse        | 1500.00 |     6 |
|          3 | table        | 1000.00 |    10 |
+------------+--------------+---------+-------+
2 rows in set (0.085 sec)

select MAX(price) as most_expensive,
MIN(price) as cheapest
from products;

+----------------+----------+
| most_expensive | cheapest |
+----------------+----------+
|        2500.00 |  1000.00 |
+----------------+----------+
1 row in set (0.783 sec)

create table OrderDetails(
     OrderDetail_id int primary key,
     Order_id int,
     product_id int,
     quantity int,
     SubTotal decimal(10,2),
     FOREIGN KEY(Order_id)
     REFERENCES orders(Order_id)
     ON DELETE CASCADE,
     FOREIGN KEY(product_id)
     REFERENCES products(product_id)
);

Query OK, 0 rows affected (4.799 sec)

insert into OrderDetails(OrderDetail_id,Order_id,product_id,quantity,SubTotal)
values(1001,1,1,2,70000),
(1002,2,2,3,1350),
(1003,3,3,1,55000),
(1004,4,4,2,13000),
(1005,5,5,1,2500);

Query OK, 5 rows affected (0.264 sec)
Records: 5  Duplicates: 0  Warnings: 0

select * from OrderDetails;

+----------------+----------+------------+----------+----------+
| OrderDetail_id | Order_id | product_id | quantity | SubTotal |
+----------------+----------+------------+----------+----------+
|           1001 |        1 |          1 |        2 | 70000.00 |
|           1002 |        2 |          2 |        3 |  1350.00 |
|           1003 |        3 |          3 |        1 | 55000.00 |
|           1004 |        4 |          4 |        2 | 13000.00 |
|           1005 |        5 |          5 |        1 |  2500.00 |
+----------------+----------+------------+----------+----------+
5 rows in set (0.010 sec)

select * from OrderDetails where Order_id=103;

+----------------+----------+------------+----------+----------+
| OrderDetail_id | Order_id | product_id | quantity | SubTotal |
+----------------+----------+------------+----------+----------+
|           1003 |        3 |          3 |        1 | 55000.00 |
+----------------+----------+------------+----------+----------+
1 row in set (0.015 sec)


select SUM(SubTotal) as Total_Revenue from OrderDetails;

+---------------+
| Total_Revenue |
+---------------+
|     141850.00 |
+---------------+
1 row in set (0.010 sec)

SELECT
    product_id,
    SUM(quantity) AS total_ordered
FROM OrderDetails
GROUP BY product_id
ORDER BY total_ordered DESC
LIMIT 3;

+------------+---------------+
| product_id | total_ordered |
+------------+---------------+
|          2 |             3 |
|          1 |             2 |
|          4 |             2 |
+------------+---------------+
3 rows in set (0.054 sec)

select count(*) as times_sold from OrderDetails where product_id=1;

+------------+
| times_sold |
+------------+
|          1 |
+------------+
1 row in set (0.071 sec)

select * from customers;

+-------------+----------+--------------+----------+
| Customer_id | Name     | Email        | Address  |
+-------------+----------+--------------+----------+
|         101 | vaibhavi | vk@gmail.com | amreli   |
|         102 | Alice    | ak@gmail.com | surat    |
|         103 | Bob      | ba@gmail.com | varasada |
|         104 | Charle   | ch@gmail.com | vapi     |
|         105 | David    | da@gmail.com | varudi   |
+-------------+----------+--------------+----------+
5 rows in set (0.011 sec)

select * from orders;
+----------+-------------+------------+-------------+
| Order_id | Customer_id | OrderDate  | TotalAmount |
+----------+-------------+------------+-------------+
|        1 |         101 | 2026-09-28 |     5000.00 |
|        2 |         102 | 2026-09-20 |     4500.00 |
|        3 |         103 | 2026-09-15 |    65000.00 |
|        4 |         104 | 2026-09-10 |     4600.00 |
|        5 |         105 | 2026-08-20 |      300.00 |
+----------+-------------+------------+-------------+
5 rows in set (0.013 sec)


select * from products;

+------------+--------------+---------+-------+
| product_id | product_name | price   | stock |
+------------+--------------+---------+-------+
|          1 | laptop       | 2500.00 |    15 |
|          2 | mouse        | 1500.00 |     6 |
|          3 | table        | 1000.00 |    10 |
|          4 | cpu          | 2300.00 |     7 |
|          5 | light        |  300.00 |     0 |
+------------+--------------+---------+-------+
5 rows in set (0.012 sec)

select * from OrderDetails;
+----------------+----------+------------+----------+----------+
| OrderDetail_id | Order_id | product_id | quantity | SubTotal |
+----------------+----------+------------+----------+----------+
|           1001 |        1 |          1 |        2 | 70000.00 |
|           1002 |        2 |          2 |        3 |  1350.00 |
|           1003 |        3 |          3 |        1 | 55000.00 |
|           1004 |        4 |          4 |        2 | 13000.00 |
|           1005 |        5 |          5 |        1 |  2500.00 |
+----------------+----------+------------+----------+----------+
5 rows in set (0.012 sec)
