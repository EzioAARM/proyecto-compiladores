TRUNCATE TABLE HumanResources.JobCandidate;

DROP FUNCTION Sales.fn_SalesByStore;  

CREATE FUNCTION dbo.ISOweek (@actualDate VARCHAR(50))  
RETURNS INT 
AS  
BEGIN
    SELECT * FROM miTabla ;
END ;

CREATE TABLE Persona (
	Identificacion INT, 
	Nombres VARCHAR(50), 
	Apellidos VARCHAR(50), 
	Nacionalidad VARCHAR(50), 
	Fecha_Nacimiento VARCHAR(50),
	fecha_modificacion VARCHAR(50) DEFAULT 'GETDATE()',
    CONSTRAINT PK_TEST PRIMARY KEY (Identificacion, Nombres)
) ON PRIMARY;

CREATE PROCEDURE Production.uspGetList @Product VARCHAR(40)   
    , @MaxPrice VARCHAR   
    , @ComparePrice VARCHAR OUTPUT  
    , @ListPrice VARCHAR OUTPUT  
AS  
BEGIN
    SELECT * FROM miTabla
GO
GO
CREATE DATABASE prueba ON  PRIMARY 
( NAMES = 'prueba', FILE = 'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\prueba.mdf' , SIZE = 60608),
( NAMES = 'prueba2', FILE = 'H:\Data\prueba2.ndf' , SIZE = 1048576);

SELECT * FROM miTabla
GO

SELECT OrderDateKey, SUM(SalesAmount) AS TotalSales  
FROM FactInternetSales  
WHERE OrderDateKey > 20020801  
ORDER BY OrderDateKey; 

SELECT SUM(SalesAmount) AS TotalSales  
FROM FactInternetSales  
GROUP BY (OrderDateKey);

INSERT INTO dbo.EmployeeSales  
    SELECT 'SELECT', sp.BusinessEntityID, c.LastName, sp.SalesYTD   
    FROM Sales.SalesPerson AS sp  
    INNER JOIN Person.Person AS c  
        ON sp.BusinessEntityID = c.BusinessEntityID  
    WHERE sp.BusinessEntityID LIKE '2%'  
    ORDER BY sp.BusinessEntityID, c.LastName; 


SELECT OrderDateKey, SUM(SalesAmount) AS TotalSales  
FROM FactInternetSales  
GROUP BY OrderDateKey  
ORDER BY OrderDateKey; 

SELECT OrderDateKey, SUM(SalesAmount) AS TotalSales  
FROM FactInternetSales  
GROUP BY OrderDateKey  
HAVING OrderDateKey > 20010000  
ORDER BY OrderDateKey;


SELECT @row_count = CONTEO FROM OPENQUERY(ORACLE_LINK, 'SELECT COUNT(employee_id) AS CONTEO FROM JOB_HISTORY');

DELETE Production.ProductCostHistory  
WHERE StandardCost BETWEEN 12.00 AND 14.00  
      AND EndDate IS NULL;

UPDATE dbo.Table2   
SET dbo.Table2.ColB = dbo.Table2.ColB + dbo.Table1.ColB  
FROM dbo.Table2   
    INNER JOIN dbo.Table1   
    ON (dbo.Table2.ColA = dbo.Table1.ColA);  

UPDATE x -- cte is referenced by the alias.  
SET Value = y.Value  
FROM cte AS x  -- cte is assigned an alias.  
INNER JOIN @y AS y ON y.ID = x.ID; 

ALTER TABLE Production.TransactionHistoryArchive
ADD CONSTRAINT PK_TransactionHistoryArchive_TransactionID PRIMARY KEY CLUSTERED (TransactionID);

ALTER TABLE Production.TransactionHistoryArchive
ADD CONSTRAINT PK_TransactionHistoryArchive_TransactionID PRIMARY KEY CLUSTERED (TransactionID);


CREATE PROCEDURE Production.uspGetList @Product VARCHAR(40)   
    , @MaxPrice VARCHAR   
    , @ComparePrice VARCHAR OUTPUT  
    , @ListPrice VARCHAR OUTPUT  
AS  
BEGIN
    SELECT * FROM miTabla
GO

SELECT OrderDateKey, SUM(SalesAmount) AS TotalSales  
FROM FactInternetSales  
WHERE OrderDateKey > 20020801  
ORDER BY OrderDateKey; 

SELECT SUM(SalesAmount) AS TotalSales  
FROM FactInternetSales  
GROUP BY (OrderDateKey);

INSERT INTO dbo.EmployeeSales  
    SELECT 'SELECT', sp.BusinessEntityID, c.LastName, sp.SalesYTD   
    FROM Sales.SalesPerson AS sp  
    INNER JOIN Person.Person AS c  
        ON sp.BusinessEntityID = c.BusinessEntityID  
    WHERE sp.BusinessEntityID LIKE '2%'  
    ORDER BY sp.BusinessEntityID, c.LastName; 


SELECT OrderDateKey, SUM(SalesAmount) AS TotalSales  
FROM FactInternetSales  
GROUP BY OrderDateKey  
ORDER BY OrderDateKey; 

SELECT OrderDateKey, SUM(SalesAmount) AS TotalSales  
FROM FactInternetSales  
GROUP BY OrderDateKey  
HAVING OrderDateKey > 20010000  
ORDER BY OrderDateKey;


SELECT @row_count = CONTEO FROM OPENQUERY(ORACLE_LINK, 'SELECT COUNT(employee_id) AS CONTEO FROM JOB_HISTORY');

DELETE Production.ProductCostHistory  
WHERE StandardCost BETWEEN 12.00 AND 14.00  
      AND EndDate IS NULL;

UPDATE dbo.Table2   
SET dbo.Table2.ColB = dbo.Table2.ColB + dbo.Table1.ColB  
FROM dbo.Table2   
    INNER JOIN dbo.Table1   
    ON (dbo.Table2.ColA = dbo.Table1.ColA);  

UPDATE x -- cte is referenced by the alias.  
SET Value = y.Value  
FROM cte AS x  -- cte is assigned an alias.  
INNER JOIN @y AS y ON y.ID = x.ID; 
END ;
CREATE PROCEDURE HumanResources.uspGetEmployeesTest2   
    @LastName VARCHAR(50),   
    @FirstName VARCHAR(50)   
AS   

    SELECT FirstName, LastName, Department  
    FROM HumanResources.vEmployeeDepartmentHistory  
    WHERE FirstName = @FirstName AND LastName = @LastName  
    AND EndDate IS NULL;  
GO

CREATE VIEW hiredate_view  
AS   
SELECT p.FirstName, p.LastName, e.BusinessEntityID, e.HireDate  
FROM HumanResources.Employee e   
JOIN Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID ;  
