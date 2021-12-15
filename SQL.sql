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

	29. SELECT INTO
The SELECT INTO statement copies data from one table into a new table.

SELECT column1, column2, column3, ...
INTO newtable [IN externaldb]
FROM oldtable
WHERE condition;

The following SQL statement creates a backup copy of Customers:
SELECT * INTO CustomersBackup2017
FROM Customers;
The following SQL statement uses the IN clause to copy the table into a new table in another database:
SELECT * INTO CustomersBackup2017 IN 'Backup.mdb'
FROM Customers;
The following SQL statement copies only the German customers into a new table:
SELECT * INTO CustomersGermany
FROM Customers
WHERE Country = 'Germany';
The following SQL statement copies data from more than one table into a new table:
SELECT Customers.CustomerName, Orders.OrderID
INTO CustomersOrderBackup2017
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
Tip: SELECT INTO can also be used to create a new, empty table using the schema of another. Just add a WHERE clause that causes the query to return no data:
SELECT * INTO newtable
FROM oldtable
WHERE 1 = 0;

	30. INSERT INTO SELECT
The INSERT INTO SELECT statement copies data from one table and inserts it into another table.
The INSERT INTO SELECT statement requires that the data types in source and target tables match.

INSERT INTO table2
SELECT * FROM table1
WHERE condition;
INSERT INTO table2 (column1, column2, column3, ...)
SELECT column1, column2, column3, ...
FROM table1
WHERE condition;

The following SQL statement copies "Suppliers" into "Customers" (the columns that are not filled with data, will contain NULL):
INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country FROM Suppliers;
The following SQL statement copies only the German suppliers into "Customers":
INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country FROM Suppliers
WHERE Country='Germany';

	31. CASE
The CASE statement goes through conditions and returns a value when the first condition is met (like an if-then-else statement).
So, once a condition is true, it will stop reading and return the result. If no conditions are true, it returns the value in the ELSE clause.
If there is no ELSE part and no conditions are true, it returns NULL.

CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;

The following SQL goes through conditions and returns a value when the first condition is met:
SELECT OrderID, Quantity,
CASE
    WHEN Quantity > 30 THEN 'The quantity is greater than 30'
    WHEN Quantity = 30 THEN 'The quantity is 30'
    ELSE 'The quantity is under 30'
END AS QuantityText
FROM OrderDetails;
The following SQL will order the customers by City. However, if City is NULL, then order by Country:
SELECT CustomerName, City, Country
FROM Customers
ORDER BY
(CASE
    WHEN City IS NULL THEN Country
    ELSE City
END);

	32. NULL Functions
Function lets you return an alternative value if an expression is NULL:

IFNULL(UnitsOnOrder, 0) or COALESCE(UnitsOnOrder, 0) -- MySQL
NVL(UnitsOnOrder, 0) -- Oracle

SELECT ProductName, UnitPrice * (UnitsInStock + NVL(UnitsOnOrder, 0))
FROM Products;

	33. Stored Procedures
A stored procedure is a prepared SQL code that you can save, so the code can be reused over and over again.
So if you have an SQL query that you write over and over again, save it as a stored procedure, and then just call it to execute it.
You can also pass parameters to a stored procedure, so that the stored procedure can act based on the parameter value(s) that is passed.

CREATE PROCEDURE procedure_name [@City nvarchar(30), @PostalCode nvarchar(10)]
AS
sql_statement
GO;
Execute a Stored Procedure
EXEC procedure_name [@City = 'London', @PostalCode = 'WA1 1DP'];

The following SQL statement creates a stored procedure named "SelectAllCustomers" that selects all records from the "Customers" table:
CREATE PROCEDURE SelectAllCustomers
AS
SELECT * FROM Customers
GO;
Execute the stored procedure above as follows:
EXEC SelectAllCustomers;
CREATE PROCEDURE SelectAllCustomers @City nvarchar(30)
AS
SELECT * FROM Customers WHERE City = @City
GO;
EXEC SelectAllCustomers @City = 'London';
CREATE PROCEDURE SelectAllCustomers @City nvarchar(30), @PostalCode nvarchar(10)
AS
SELECT * FROM Customers WHERE City = @City AND PostalCode = @PostalCode
GO;
EXEC SelectAllCustomers @City = 'London', @PostalCode = 'WA1 1DP';

	34. Comments
Comments are used to explain sections of SQL statements, or to prevent execution of SQL statements.

--Select all:
SELECT * FROM Customers;
SELECT * FROM Customers -- WHERE City='Berlin';
/*Select all the columns
of all the records
in the Customers table:*/
SELECT * FROM Customers;

	35. Operators
  Arithmetic
+	Add
-	Subtract
*	Multiply
/	Divide
%	Modulo
  Bitwise
&	Bitwise AND
|	Bitwise OR
^	Bitwise exclusive OR
  Comparison
=	Equal to
>	Greater than
<	Less than
>=	Greater than or equal to
<=	Less than or equal to
<>	Not equal to
  Compound
+=	Add equals
-=	Subtract equals
*=	Multiply equals
/=	Divide equals
%=	Modulo equals
&=	Bitwise AND equals
^-=	Bitwise exclusive equals
|*=	Bitwise OR equals
  Logical
ALL	    TRUE if all of the subquery values meet the condition
AND	    TRUE if all the conditions separated by AND is TRUE
ANY	    TRUE if any of the subquery values meet the condition
BETWEEN	TRUE if the operand is within the range of comparisons
EXISTS	TRUE if the subquery returns one or more records
IN	    TRUE if the operand is equal to one of a list of expressions
LIKE	TRUE if the operand matches a pattern
NOT	    Displays a record if the condition(s) is NOT TRUE
OR	    TRUE if any of the conditions separated by OR is TRUE
SOME	TRUE if any of the subquery values meet the condition

	36. CREATE DATABASE
CREATE DATABASE databasename;
SHOW DATABASES;

CREATE DATABASE testDB;

	37. DROP DATABASE
DROP DATABASE databasename;

DROP DATABASE testDB;
SHOW DATABASES;

	38. BACKUP DATABASE
Always back up the database to a different drive than the actual database. Then, if you get a disk crash,
you will not  lose your backup file along with the database.
A differential back up only backs up the parts of the database that have changed since the last full database backup.

BACKUP DATABASE databasename
TO DISK = 'filepath';
BACKUP DATABASE databasename
TO DISK = 'filepath'
WITH DIFFERENTIAL;

BACKUP DATABASE testDB
TO DISK = 'D:\backups\testDB.bak'
WITH DIFFERENTIAL;

	39. CREATE TABLE
The column parameters specify the names of the columns of the table.
The datatype parameter specifies the type of data the column can hold (e.g. varchar, integer, date, etc.).
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
);

A copy of an existing table can also be created using CREATE TABLE.
The new table gets the same column definitions. All columns or specific columns can be selected.
If you create a new table using an existing table, the new table will be filled with the existing values from the old table.
CREATE TABLE new_table_name AS
    SELECT column1, column2,...
    FROM existing_table_name
    WHERE ....;

CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);
The following SQL creates a new table called "TestTables" (which is a copy of the "Customers" table):
CREATE TABLE TestTable AS
SELECT customername, contactname
FROM customers;

	40. DROP TABLE
The TRUNCATE TABLE statement is used to delete the data inside a table, but not the table itself.

DROP TABLE table_name;
TRUNCATE TABLE table_name;

DROP TABLE Shippers;
TRUNCATE TABLE Shippers;

	41. ALTER TABLE
The ALTER TABLE statement is used to add, delete, or modify columns in an existing table.
The ALTER TABLE statement is also used to add and drop various constraints on an existing table.

ALTER TABLE table_name
ADD column_name datatype;
ALTER TABLE table_name
DROP COLUMN column_name;
ALTER TABLE table_name
MODIFY COLUMN column_name datatype; --MODIFY column_name datatype; --Oracle 10G and later:

ALTER TABLE Customers
ADD Email varchar(255);
ALTER TABLE Customers
DROP COLUMN Email;
ALTER TABLE Persons
MODIFY DateOfBirth year; --ALTER COLUMN column_name datatype; SQL Server/MS Access/My SQL/Oracle (prior version 10G)

	42. Constraints
SQL constraints are used to specify rules for data in a table.
Constraints can be specified when the table is created with the CREATE TABLE statement, or after the table is created with the ALTER TABLE statement.

CREATE TABLE table_name (
    column1 datatype constraint,
    column2 datatype constraint,
    column3 datatype constraint,
    ....
);

NOT NULL    - Ensures that a column cannot have a NULL value
UNIQUE      - Ensures that all values in a column are different
PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
FOREIGN KEY - Prevents actions that would destroy links between tables
CHECK       - Ensures that the values in a column satisfies a specific condition
DEFAULT     - Sets a default value for a column if no value is specified
CREATE INDEX - Used to create and retrieve data from the database very quickly

	43. NOT NULL
The NOT NULL constraint enforces a column to NOT accept NULL values.

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
);
ALTER TABLE Persons
MODIFY Age int NOT NULL;

	44. UNIQUE
The UNIQUE constraint ensures that all values in a column are different.

CREATE TABLE Persons (
    ID int NOT NULL UNIQUE,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);
To name a UNIQUE constraint, and to define a UNIQUE constraint on multiple columns, use the following SQL syntax:
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT UC_Person UNIQUE (ID,LastName)
);
ALTER TABLE Persons
ADD UNIQUE (ID);
ALTER TABLE Persons
ADD CONSTRAINT UC_Person UNIQUE (ID,LastName);
To drop a UNIQUE constraint, use the following SQL:
ALTER TABLE Persons
DROP CONSTRAINT UC_Person; --DROP INDEX UC_Person; --MySQL

	45. PRIMARY KEY
The PRIMARY KEY constraint uniquely identifies each record in a table.
Primary keys must contain UNIQUE values, and cannot contain NULL values.
A table can have only ONE primary key; and in the table, this primary key can consist of single or multiple columns (fields).

CREATE TABLE Persons (
    ID int NOT NULL PRIMARY KEY, --MySQL: PRIMARY KEY (ID)
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);
To allow naming of a PRIMARY KEY constraint, and for defining a PRIMARY KEY constraint on multiple columns, use the following SQL syntax.
There is only ONE PRIMARY KEY (PK_Person). However, the VALUE of the primary key is made up of TWO COLUMNS (ID + LastName).
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)
);
ALTER TABLE Persons
ADD PRIMARY KEY (ID);
ALTER TABLE Persons
ADD CONSTRAINT PK_Person PRIMARY KEY (ID,LastName);
ALTER TABLE Persons
DROP CONSTRAINT PK_Person;

	46. FOREIGN KEY
The FOREIGN KEY constraint is used to prevent actions that would destroy links between tables.
A FOREIGN KEY is a field (or collection of fields) in one table, that refers to the PRIMARY KEY in another table.
The table with the foreign key is called the child table, and the table with the primary key is called the referenced or parent table.

CREATE TABLE Orders (
    OrderID int NOT NULL PRIMARY KEY,
    OrderNumber int NOT NULL,
    PersonID int FOREIGN KEY REFERENCES Persons(PersonID)
);
CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID)
    REFERENCES Persons(PersonID)
);
ALTER TABLE Orders
ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);
ALTER TABLE Orders
ADD CONSTRAINT FK_PersonOrder
FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);
ALTER TABLE Orders
DROP CONSTRAINT FK_PersonOrder; --DROP FOREIGN KEY FK_PersonOrder; --MySQL

	47. CHECK
The CHECK constraint is used to limit the value range that can be placed in a column.

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int CHECK (Age>=18)
);
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255),
    CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Sandnes')
);
ALTER TABLE Persons
ADD CHECK (Age>=18);
ALTER TABLE Persons
DROP CONSTRAINT CHK_PersonAge; --DROP CHECK CHK_PersonAge; MySQL

	48. DEFAULT
The DEFAULT constraint is used to set a default value for a column.
The default value will be added to all new records, if no other value is specified.

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Sandnes'
);
CREATE TABLE Orders (
    ID int NOT NULL,
    OrderNumber int NOT NULL,
    OrderDate date DEFAULT GETDATE()
);
ALTER TABLE Persons
MODIFY City DEFAULT 'Sandnes';
ALTER TABLE Persons
ALTER COLUMN City DROP DEFAULT;

	49. CREATE INDEX
Indexes are used to retrieve data from the database more quickly than otherwise. The users cannot see the indexes, they are just used to speed up searches/queries.
Updating a table with indexes takes more time than updating a table without (because the indexes also need an update). So, only create indexes on columns that will be frequently searched against.
CREATE INDEX index_name
ON table_name (column1, column2, ...);
CREATE UNIQUE INDEX index_name
ON table_name (column1, column2, ...);

CREATE INDEX idx_lastname
ON Persons (LastName);
CREATE INDEX idx_pname
ON Persons (LastName, FirstName);
DROP INDEX index_name;

	50. AUTO INCREMENT Field
Auto-increment allows a unique number to be generated automatically when a new record is inserted into a table.
Often this is the primary key field that we would like to be created automatically every time a new record is inserted.

CREATE TABLE Persons (
    Personid int NOT NULL AUTO_INCREMENT, --MySQL
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (Personid)
);
CREATE SEQUENCE seq_person --Oracle
MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 10;
INSERT INTO Persons (Personid,FirstName,LastName) VALUES (seq_person.nextval,'Lars','Monsen');

	51. Working With Dates
The most difficult part when working with dates is to be sure that the format of the date you are trying to insert, matches the format of the date column in the database.
As long as your data contains only the date portion, your queries will work as expected. However, if a time portion is involved, it gets more complicated.

DATE - format YYYY-MM-DD --MySQL
DATETIME/TIMESTAMP  - format: YYYY-MM-DD HH:MI:SS
YEAR - format YYYY or YY
SELECT * FROM Orders WHERE OrderDate='2008-11-11' --no results if 2008-11-11 13:23:44

	52. Views
In SQL, a view is a virtual table based on the result-set of an SQL statement.
A view contains rows and columns, just like a real table. The fields in a view are fields from one or more real tables in the database.
You can add SQL statements and functions to a view and present the data as if the data were coming from one single table.
A view is created with the CREATE VIEW statement.
A view always shows up-to-date data! The database engine recreates the view, every time a user queries it.

CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;

CREATE VIEW [Brazil Customers] AS
SELECT CustomerName, ContactName
FROM Customers
WHERE Country = 'Brazil';
SELECT * FROM [Brazil Customers];
A view can be updated with the CREATE OR REPLACE VIEW statement.
CREATE OR REPLACE VIEW [Brazil Customers] AS
SELECT CustomerName, ContactName, City
FROM Customers
WHERE Country = 'Brazil';
DROP VIEW [Brazil Customers];

	53. Injection
SQL injection is a code injection technique that might destroy your database.
SQL injection is one of the most common web hacking techniques.
SQL injection is the placement of malicious code in SQL statements, via web page input.

txtNam = getRequestString("CustomerName");
txtAdd = getRequestString("Address");
txtCit = getRequestString("City");
txtSQL = "INSERT INTO Customers (CustomerName,Address,City) Values(@0,@1,@2)";
db.Execute(txtSQL,txtNam,txtAdd,txtCit);

	54. Hosting
If you want your web site to be able to store and retrieve data from a database, your web server should have access to a database-system that uses the SQL language.
If your web server is hosted by an Internet Service Provider (ISP), you will have to look for SQL hosting plans.
The most common SQL hosting databases are MS SQL Server, Oracle, MySQL, and MS Access.

	55. Data Types
char(размер)	2000 байт. Где размер - количество символов фиксированной длины. Если сохраняемое значение короче, то дополняется пробелами; если длиннее, то выдается ошибка.
varchar2(размер) 4000 байт. Где размер - количество сохраняемых символов переменной длины.
long        2GB. Символьные данные переменной длины.
raw         2000 байт.Содержит двоичные данные переменной длины
long raw    2GB. Содержит двоичные данные переменной длины
number(точность,масштаб) Точность может быть в диапазоне от 1 до 38. Масштаб может быть в диапазоне от -84 до 127. Например,number (14,5) представляет собой число, которое имеет 9 знаков до запятой и 5 знаков после запятой.
PLS_INTEGER Целые числа в диапазоне от -2,147,483,648 до 2,147,483,647 Значение PLS_INTEGER требуют меньше памяти и быстрее значений NUMBER
date        Может принимать значения от 1 января 4712 года до н.э. до 31 декабря 9999 года нашей эры.
BOOLEAN	TRUE или FALSE. Может принимать значение NULL
bfile	Максимальный размер файла 4 ГБ.
blob	Хранит до 4 ГБ двоичных данных.
clob	Хранит до 4 ГБ символьных данных.
nclob	Хранит до 4 ГБ символьных текстовых данных.
