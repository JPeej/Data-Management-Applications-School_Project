CREATE DATABASE jaunty_coffee_co;
USE jaunty_coffee_co;

CREATE TABLE coffee_shop (
	shop_id INT PRIMARY KEY,
    shop_name VARCHAR(50),
    city VARCHAR(50),
    state CHAR(2)
);

CREATE TABLE employee (
	employee_id INT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    hire_date DATE,
    job_title VARCHAR(30),
    shop_id INT,
    FOREIGN KEY (shop_id) REFERENCES coffee_shop(shop_id)
);

CREATE TABLE supplier (
	supplier_id INT PRIMARY KEY,
    company_name VARCHAR(50),
    country VARCHAR(30),
    sales_contact_name VARCHAR(60),
    email VARCHAR(50) NOT NULL
);

CREATE TABLE coffee (
	coffee_id INT PRIMARY KEY,
    shop_id INT,
    supplier_id INT,
    coffee_name VARCHAR(30),
    price_per_pound NUMERIC(5,2),
    FOREIGN KEY (shop_id) REFERENCES coffee_shop(shop_id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id)
);

INSERT INTO coffee_shop (shop_id, shop_name, city, state)
VALUES (1, "Fort Collins' Jaunty", "Fort Collins", "CO"), 
	   (2, "Portland Jaunty", "Portland", "ME"),
	   (3, "El Paso Jaunty", "El Paso", "TX");
       
INSERT INTO supplier (supplier_id, company_name, country, sales_contact_name, email)
VALUES (1, "Banana's Beans", "Jamaica", "Steve Beav", "steve@banana.com"),
	   (2, "Front Range Coffee", "USA", "John Chase", "john@frontrange.com"),
       (3, "Lobster Beans", "USA", "Brendan Briar", "brendan@lobster.com");
       
INSERT INTO employee (employee_id, first_name, last_name, hire_date, job_title, shop_id)
VALUES (1, "Joshua", "Perry", "2020-03-06", "Database Administrator", 1),
	   (2, "Abby", "Chase", "2019-07-11", "Graphic Designer", 1),
       (3, "Terry", "Nelson", "2015-05-10", "Bean Tester", 3);
       
INSERT INTO coffee (coffee_id, shop_id, supplier_id, coffee_name, price_per_pound)
VALUES (1, 1, 2, "Rocky Mountain Roast", 101.21),
	   (2, 2, 3, "Acadia SunRise", 121.98),
       (3, 3, 1, "Green Chile Cafe", 100.00);
       
CREATE VIEW employees AS
SELECT employee.employee_id, CONCAT(first_name, " ", last_name) AS employee_full_name, hire_date, job_title, employee.shop_id
FROM employee;

CREATE INDEX name_of_coffee
ON coffee (coffee_name);

SELECT first_name
FROM employee
WHERE hire_date > "2016-07-09";
