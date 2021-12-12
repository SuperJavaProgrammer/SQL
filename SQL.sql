https://www.w3schools.com/sql/default.asp

    1. SELECT
SELECT column1, column2, ...
FROM table_name;
SELECT *
FROM table_name;

SELECT CustomerName, City FROM Customers;
SELECT * FROM Customers;

    2. SELECT DISTINCT
SELECT DISTINCT column1, column2, ...
FROM table_name;

SELECT DISTINCT Country FROM Customers;
SELECT COUNT(DISTINCT Country) FROM Customers;

	3. WHERE
SELECT column1, column2, ...
FROM table_name
WHERE condition;

SELECT * FROM Customers
WHERE Country='Mexico';
SELECT * FROM Customers
WHERE CustomerID=1;

=	Equal
>	Greater than
<	Less than
>=	Greater than or equal
<=	Less than or equal
<>	Not equal. Note: In some versions of SQL this operator may be written as !=
BETWEEN	Between a certain range
LIKE	Search for a pattern
IN	To specify multiple possible values for a column

	4. AND, OR and NOT
SELECT column1, column2, ...
FROM table_name
WHERE condition1 AND condition2 AND condition3 ...;
SELECT column1, column2, ...
FROM table_name
WHERE condition1 OR condition2 OR condition3 ...;
SELECT column1, column2, ...
FROM table_name
WHERE NOT condition;

SELECT * FROM Customers
WHERE Country='Germany' AND City='Berlin';
SELECT * FROM Customers
WHERE City='Berlin' OR City='Munchen';
SELECT * FROM Customers
WHERE NOT Country='Germany';
SELECT * FROM Customers
WHERE Country='Germany' AND (City='Berlin' OR City='Munchen');
SELECT * FROM Customers
WHERE NOT Country='Germany' AND NOT Country='USA';

	5. ORDER BY
SELECT column1, column2, ...
FROM table_name
ORDER BY column1 ASC|DESC, column2 ASC|DESC, ...;

SELECT * FROM Customers
ORDER BY Country;
SELECT * FROM Customers
ORDER BY Country DESC;
SELECT * FROM Customers
ORDER BY Country, CustomerName;
SELECT * FROM Customers
ORDER BY Country ASC, CustomerName DESC;

	6. INSERT INTO Statement
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);

INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

	7. NULL Values
SELECT column_names
FROM table_name
WHERE column_name IS NULL;
SELECT column_names
FROM table_name
WHERE column_name IS NOT NULL;

SELECT CustomerName, ContactName, Address
FROM Customers
WHERE Address IS NULL;
SELECT CustomerName, ContactName, Address
FROM Customers
WHERE Address IS NOT NULL;

	8. UPDATE
UPDATE table_name
SET column1 = value1, column2 = value2, ...
--WHERE condition;

UPDATE Customers
SET ContactName = 'Alfred Schmidt', City = 'Frankfurt'
WHERE CustomerID = 1;
UPDATE Customers
SET ContactName='Juan'
WHERE Country='Mexico';
UPDATE Customers
SET ContactName='Juan';

	9. DELETE
DELETE FROM table_name
--WHERE condition;

DELETE FROM Customers
WHERE CustomerName='Alfreds Futterkiste';
DELETE FROM Customers;

	10. TOP, LIMIT, FETCH FIRST or ROWNUM
Note: Not all database systems support the SELECT TOP clause.
MySQL supports the LIMIT clause to select a limited number of records, while Oracle uses FETCH FIRST n ROWS ONLY and ROWNUM.

SELECT column_name(s)
FROM table_name
WHERE condition
LIMIT number; --for MySQL --FETCH FIRST 3 ROWS ONLY for Oracle

SELECT TOP 3 * FROM Customers;
SELECT * FROM Customers
FETCH FIRST 3 ROWS ONLY;
SELECT TOP 50 PERCENT * FROM Customers;
SELECT * FROM Customers
FETCH FIRST 50 PERCENT ROWS ONLY;
SELECT * FROM Customers
WHERE Country='Germany'
FETCH FIRST 3 ROWS ONLY;

    11. MIN() and MAX()
SELECT MIN(column_name) (AS Name)
FROM table_name
--WHERE condition;
SELECT MAX(column_name)
FROM table_name
--WHERE condition;

SELECT MIN(Price) AS SmallestPrice
FROM Products;
SELECT MAX(Price) AS LargestPrice
FROM Products;

	12. COUNT(), AVG() and SUM() Functions
Note: NULL values are not counted.

SELECT COUNT(column_name) (AS Name)
FROM table_name
--WHERE condition;
SELECT AVG(column_name) (AS Name)
FROM table_name
--WHERE condition;
SELECT SUM(column_name) (AS Name)
FROM table_name
--WHERE condition;

SELECT COUNT(ProductID)
FROM Products;
SELECT AVG(Price)
FROM Products;
SELECT SUM(Quantity)
FROM OrderDetails;

	13. LIKE Operator
The percent sign (%) represents zero, one, or multiple characters
The underscore sign (_) represents one, single character
The percent sign and the underscore can also be used in combinations!

SELECT column1, column2, ...
FROM table_name
WHERE columnN LIKE pattern;

SELECT * FROM Customers
WHERE CustomerName LIKE 'a%';
SELECT * FROM Customers
WHERE CustomerName LIKE '%or%';
SELECT * FROM Customers
WHERE CustomerName LIKE '_r%';
SELECT * FROM Customers
WHERE CustomerName LIKE 'a__%';
SELECT * FROM Customers
WHERE ContactName LIKE 'a%o';
SELECT * FROM Customers
WHERE CustomerName NOT LIKE 'a%';

	14. Wildcards
Wildcard Characters in MS Access/SQL Server
*/%	Represents zero or more characters	bl* finds bl, black, blue, and blob
?/_	Represents a single character	h?t finds hot, hat, and hit
[]	Represents any single character within the brackets	h[oa]t finds hot and hat, but not hit
!/^	Represents any character not in the brackets	h[!oa]t finds hit, but not hot and hat
-	Represents a range of characters	c[a-b]t finds cat and cbt
#	Represents any single numeric character	2#5 finds 205, 215, 225, 235, 245, 255, 265, 275, 285, and 295

SELECT * FROM Customers
WHERE City LIKE '[!bsp]%';

	15. IN
The IN operator is a shorthand for multiple OR conditions

SELECT column_name(s)
FROM table_name
WHERE column_name IN (value1, value2, ...);
SELECT column_name(s)
FROM table_name
WHERE column_name IN (SELECT STATEMENT);

SELECT * FROM Customers
WHERE Country IN ('Germany', 'France', 'UK');
SELECT * FROM Customers
WHERE Country NOT IN ('Germany', 'France', 'UK');
SELECT * FROM Customers
WHERE Country IN (SELECT Country FROM Suppliers);

	16. BETWEEN
The BETWEEN operator selects values within a given range. The values can be numbers, text, or dates. Begin and end values are included.

SELECT column_name(s)
FROM table_name
WHERE column_name BETWEEN value1 AND value2;

SELECT * FROM Products
WHERE Price BETWEEN 10 AND 20;
SELECT * FROM Products
WHERE Price NOT BETWEEN 10 AND 20
AND CategoryID NOT IN (1, 2, 3);
SELECT * FROM Products
WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;
SELECT * FROM Orders
WHERE OrderDate BETWEEN #07/01/1996# AND #07/31/1996#;
SELECT * FROM Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';

	17. Aliases
It requires double quotation marks or square brackets if the alias name contains spaces:

SELECT column_name AS alias_name
FROM table_name AS alias_name;
SELECT CustomerName AS Customer, ContactName AS [Contact Person]
FROM Customers;
SELECT CustomerName, CONCAT(Address,', ',PostalCode,', ',City,', ',Country) AS Address
FROM Customers;

SELECT CustomerID AS ID, CustomerName AS Customer
FROM Customers;
SELECT CustomerName AS Customer, ContactName AS [Contact Person]
FROM Customers;
SELECT CustomerName, Address + ', ' + PostalCode + ' ' + City + ', ' + Country AS Address
FROM Customers;
SELECT CustomerName, CONCAT(Address,', ',PostalCode,', ',City,', ',Country) AS Address --MySQL
FROM Customers;
SELECT o.OrderID, o.OrderDate, c.CustomerName
FROM Customers AS c, Orders AS o
WHERE c.CustomerName='Around the Horn' AND c.CustomerID=o.CustomerID;

	18. Joins
(INNER) JOIN: Returns records that have matching values in both tables
LEFT (OUTER) JOIN: Returns all records from the left table, and the matched records from the right table
RIGHT (OUTER) JOIN: Returns all records from the right table, and the matched records from the left table
FULL (OUTER) JOIN: Returns all records when there is a match in either left or right table

    19. INNER JOIN
The INNER JOIN keyword selects all rows from both tables as long as there is a match between the columns.
If there are records in the "Orders" table that do not have matches in "Customers", these orders will not be shown!

SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;

The following SQL statement selects all orders with customer information:
SELECT Orders.OrderID, Customers.CustomerName
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;
The following SQL statement selects all orders with customer and shipper information:
FROM ((Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID);

	20. LEFT JOIN
The LEFT JOIN keyword returns all records from the left table (Customers), even if there are no matches in the right table (Orders).

SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;

	21. RIGHT JOIN
The RIGHT JOIN keyword returns all records from the right table (Employees), even if there are no matches in the left table (Orders).

SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;

SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;

	22. FULL OUTER JOIN
The FULL OUTER JOIN keyword returns all matching records from both tables whether the other table matches or not.
So, if there are rows in "Customers" that do not have matches in "Orders", or if there are rows in "Orders" that do not
have matches in "Customers", those rows will be listed as well.

SELECT column_name(s)
FROM table1
FULL OUTER JOIN table2
ON table1.column_name = table2.column_name
WHERE condition;

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;

	23. Self Join
A self join is a regular join, but the table is joined with itself.

SELECT column_name(s)
FROM table1 T1, table1 T2
WHERE condition;

SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;

	24. UNION
The UNION operator is used to combine the result-set of two or more SELECT statements
Every SELECT statement within UNION must have the same number of columns
The columns must also have similar data types
The columns in every SELECT statement must also be in the same order

SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;
SELECT column_name(s) FROM table1
UNION ALL --The UNION operator selects only distinct values by default. To allow duplicate values
SELECT column_name(s) FROM table2;

SELECT City FROM Customers
UNION
SELECT City FROM Suppliers
ORDER BY City;
SELECT City FROM Customers
UNION ALL
SELECT City FROM Suppliers
ORDER BY City;
SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City;
Notice the "AS Type" - it is an alias. SQL Aliases are used to give a table or a column a temporary name.
An alias only exists for the duration of the query. So, here we have created a temporary column named "Type",
that list whether the contact person is a "Customer" or a "Supplier".
SELECT 'Customer' AS Type, ContactName, City, Country
FROM Customers
UNION
SELECT 'Supplier', ContactName, City, Country
FROM Suppliers;

	25. GROUP BY
The GROUP BY statement groups rows that have the same values into summary rows, like "find the number of customers in each country".

SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
ORDER BY column_name(s);

The following SQL statement lists the number of customers in each country, sorted high to low:
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC;
The following SQL statement lists the number of orders sent by each shipper:
SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders
LEFT JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
GROUP BY ShipperName;

	26. HAVING
The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.

SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
HAVING condition
ORDER BY column_name(s);

The following SQL statement lists the number of customers in each country, sorted high to low (Only include countries with more than 5 customers):
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5
ORDER BY COUNT(CustomerID) DESC;
The following SQL statement lists the employees that have registered more than 10 orders:
SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM (Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID)
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 10;
The following SQL statement lists if the employees "Davolio" or "Fuller" have registered more than 25 orders:
SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE LastName = 'Davolio' OR LastName = 'Fuller'
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 25;

	27. EXISTS
The EXISTS operator is used to test for the existence of any record in a subquery.
The EXISTS operator returns TRUE if the subquery returns one or more records.

SELECT column_name(s)
FROM table_name
WHERE EXISTS
(SELECT column_name FROM table_name WHERE condition);

The following SQL statement returns TRUE and lists the suppliers with a product price less than 20:
SELECT SupplierName
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.supplierID AND Price < 20);

	28. ANY and ALL
The ANY and ALL operators allow you to perform a comparison between a single column value and a range of other values.
The operator must be a standard comparison operator (=, <>, !=, >, >=, <, or <=).
The ANY operator:
returns a boolean value as a result
returns TRUE if ANY of the subquery values meet the condition
ANY means that the condition will be true if the operation is true for any of the values in the range.
The ALL operator:
returns a boolean value as a result
returns TRUE if ALL of the subquery values meet the condition
is used with SELECT, WHERE and HAVING statements
ALL means that the condition will be true only if the operation is true for all values in the range.

SELECT column_name(s)
FROM table_name
WHERE column_name operator ANY
  (SELECT column_name
  FROM table_name
  WHERE condition);
SELECT column_name(s)
FROM table_name
WHERE column_name operator ALL
  (SELECT column_name
  FROM table_name
  WHERE condition);

The following SQL statement lists the ProductName if it finds ANY records in the OrderDetails table has Quantity equal to 10 (this will return TRUE because the Quantity column has some values of 10):
SELECT ProductName
FROM Products
WHERE ProductID = ANY
  (SELECT ProductID
  FROM OrderDetails
  WHERE Quantity = 10);
The following SQL statement lists ALL the product names:
SELECT ALL ProductName
FROM Products
WHERE TRUE;
SELECT ProductName
FROM Products;
The following SQL statement lists the ProductName if ALL the records in the OrderDetails table has Quantity equal to 10. This will of course return FALSE because the Quantity column has many different values (not only the value of 10):
SELECT ProductName
FROM Products
WHERE ProductID = ALL
  (SELECT ProductID
  FROM OrderDetails
  WHERE Quantity = 10);
