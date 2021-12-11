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
