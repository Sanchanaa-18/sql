-- Active: 1720334981966@@127.0.0.1@3306@palmshore_restaurant
SHOW TABLES;

CREATE table menu(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Food_Name VARCHAR(30) NOT NULL,
    Price FLOAT NOT NULL,
    Availability VARCHAR(30),
    Food_type VARCHAR(10), 
    created_on DATETIME DEFAULT CURRENT_TIMESTAMP,
    created_by INT,
    updated_on DATETIME DEFAULT NULL,
    updated_by INT,
    is_deleted INT DEFAULT 0);

DESCRIBE menu;

CREATE Table employee(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Emp_Name VARCHAR(20),
    Age INT DEFAULT NULL,
    Contact VARCHAR(10),
    Address varchar(100),
    created_on DATETIME DEFAULT CURRENT_TIMESTAMP,
    created_by INT,
    updated_on DATETIME DEFAULT NULL,
    updated_by INT,
    is_deleted INT DEFAULT 0);

DESCRIBE employee;

CREATE Table Order_table(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Table_id INT DEFAULT NULL,
    Total_price FLOAT DEFAULT 0,
    created_on DATETIME DEFAULT CURRENT_TIMESTAMP,
    created_by INT,
    updated_on DATETIME DEFAULT NULL,
    updated_by INT,
    is_deleted INT DEFAULT 0);

CREATE Table Order_food_mapping(ID INT PRIMARY KEY AUTO_INCREMENT,Food_id INT NOT NULL,Order_id INT NOT NULL,Qty INT DEFAULT 1,Foreign Key (Food_id) REFERENCES menu(ID),Foreign Key (Order_id) REFERENCES Order_table(ID));

DROP Table menu;

DROP Table order_food_mapping;

DROP TABLE employee;

DROP TABLE Order_table;

INSERT INTO menu(Food_Name,Price,Availability,Food_type)
VALUES('Dosa',30.0,'Morning','Veg'),
('Idly',20.0,'Morning','Veg'),
('Pongal',25.0,'Morning','Veg'),
('Coffee',15.0,'Morning','Veg');

INSERT INTO order_table(Table_id)
VALUES(1),(4),(9),(18);

INSERT INTO order_food_mapping(food_id,order_id,qty) 
VALUES (1,4,2), 
(2,3,1), 
(3,2,4), 
(4,1,7);

DROP Table order_food_mapping;

SELECT * FROM menu;

SELECT * FROM Order_Table;

SELECT * FROM order_food_mapping;

show TABLES;

SELECT m.Food_name,sum(ofm.qty) from order_food_mapping ofm
join menu m on m.id=ofm.Food_id
GROUP BY m.Food_Name
ORDER BY sum(ofm.qty) DESC;

SELECT m.Food_name as food,m.price,
ofm.qty,ot.table_id,
m.price*ofm.qty as total_price
from order_table ot
JOIN order_food_mapping ofm on ot.id=ofm.Order_id
JOIN menu m on ofm.Food_id=m.ID;

select * from menu m 
WHERE m.Price=(SELECT max(m1.price)FROM menu m1);

SELECT * FROM menu
ORDER BY Price DESC;

SELECT m.Food_type,SUM(m.price) FROM menu m
GROUP BY Food_type;

SELECT * FROM menu
WHERE price BETWEEN 10 and 25;

SELECT * FROM menu
where food_name LIKE '___y';