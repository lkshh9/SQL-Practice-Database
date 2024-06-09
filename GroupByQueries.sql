CREATE TABLE inventory (
    warehouse VARCHAR(255),
    product VARCHAR(255) NOT NULL,
    model VARCHAR(50) NOT NULL,
    quantity INT,
    PRIMARY KEY (warehouse,product,model)
);

INSERT INTO inventory(warehouse, product, model, quantity)
VALUES('San Jose', 'iPhone','6s',100);
INSERT INTO inventory(warehouse, product, model, quantity)
VALUES('San Fransisco', 'iPhone','6s',50);
INSERT INTO inventory(warehouse, product, model, quantity)
VALUES('San Jose','iPhone','7',50);
INSERT INTO inventory(warehouse, product, model, quantity)
VALUES('San Fransisco', 'iPhone','7',10);
INSERT INTO inventory(warehouse, product, model, quantity)
VALUES('San Jose','iPhone','X',150);
INSERT INTO inventory(warehouse, product, model, quantity)
VALUES('San Fransisco', 'iPhone','X',200);
INSERT INTO inventory(warehouse, product, model, quantity)
VALUES('San Jose','Samsung','Galaxy S',200);
INSERT INTO inventory(warehouse, product, model, quantity)
VALUES('San Fransisco','Samsung','Galaxy S',200);
INSERT INTO inventory(warehouse, product, model, quantity)
VALUES('San Fransisco','Samsung','Note 8',100);
INSERT INTO inventory(warehouse, product, model, quantity)
VALUES('San Jose','Samsung','Note 8',150);

Select * from inventory;

SELECT
    warehouse,
    product, 
    SUM (quantity) qty
FROM
    inventory
GROUP BY
    warehouse,
    product;

SELECT
    warehouse, 
    SUM (quantity) qty
FROM
    inventory
GROUP BY
    warehouse;


SELECT
    product, 
    SUM (quantity) qty
FROM
    inventory
GROUP BY
    product;

SELECT TABLE_SCHEMA
FROM information_schema.tables
WHERE TABLE_NAME = 'inventory';

SELECT 
    warehouse, SUM(quantity)
FROM
    inventory
GROUP BY ROLLUP (warehouse);

SELECT 
    COALESCE(warehouse, 'All warehouses') AS warehouse,
    SUM(quantity)
FROM
    inventory
GROUP BY ROLLUP (warehouse);

SELECT 
    warehouse, product, SUM(quantity) sum_qty
FROM
    inventory
GROUP BY warehouse, product;

SELECT 
    warehouse, product, SUM(quantity) sum_qty
FROM
    inventory
GROUP BY ROLLUP(warehouse, product);

SELECT 
    warehouse, product, SUM(quantity) sum_qty
FROM
    inventory
GROUP BY product, ROLLUP (warehouse);


CREATE TABLE EmpSalary(
	id INT PRIMARY KEY IDENTITY(1,1),
	EmpName varchar(200),
	Department varchar(100),
	Category char(1),
	Salary money
);

INSERT INTO EmpSalary(EmpName, Department, Category, Salary) VALUES('Bhavesh Patel', 'IT','A', $8000);
INSERT INTO EmpSalary(EmpName, Department, Category, Salary) VALUES('Alpesh Patel', 'Sales','A', $7000);
INSERT INTO EmpSalary(EmpName, Department, Category, Salary) VALUES('Kalpesh Thakor', 'IT','B', $5000);
INSERT INTO EmpSalary(EmpName, Department, Category, Salary) VALUES('Jay Shah', 'Sales','B', $4000);
INSERT INTO EmpSalary(EmpName, Department, Category, Salary) VALUES('Ram Nayak', 'IT','C', $3000);
INSERT INTO EmpSalary(EmpName, Department, Category, Salary) VALUES('Jay Shaw', 'Sales','C', $2000);

Select * from EmpSalary;

SELECT 
   Department, 
   SUM(Salary) as Salary 
FROM EmpSalary 
GROUP BY Department
  
SELECT 
   Department, 
   Category, 
   SUM(Salary) as Salary 
FROM EmpSalary 
GROUP BY Department, Category

SELECT 
   Department, 
   SUM(Salary) as Salary 
FROM EmpSalary 
GROUP BY CUBE(Department) 

SELECT 
   Department, 
   Category, 
   SUM(Salary) as Salary 
FROM EmpSalary 
GROUP BY CUBE(Department, Category) 

SELECT 
   Department, 
   Category, 
   SUM(Salary) as Salary 
FROM EmpSalary 
GROUP BY ROLLUP(Department, Category) 

SELECT 
   Department, 
   SUM(Salary) as salary 
FROM EmpSalary 
GROUP BY ROLLUP(Department) 
  
SELECT 
   Department, 
   Category, 
   SUM(Salary) as salary 
FROM EmpSalary 
GROUP BY ROLLUP (Category, Department)

SELECT 
   Department, 
   Category, 
   SUM(Salary) as Salary,
   GROUPING_ID(Category, Department) as GroupingID 
FROM EmpSalary 
GROUP BY ROLLUP(Category, Department)