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
