----

SELECT TOP 5 *
FROM dbo.customers

--
SELECT top 5 *
from dbo.products

---

SELECT TOP 5 *
FROM dbo.geography

--- dim_customers:

SELECT cust.CustomerID,
	   cust.CustomerName,
	   cust.Email,
	   cust.Gender,
	   cust.Age,
	   cust.GeographyID,
	   geo.Country,
	   geo.City

INTO dim_customers

from dbo.customers as cust
LEFT JOIN dbo.geography as geo ON cust.GeographyID = geo.GeographyID


--- dim_products:


SELECT ProductID,
	   ProductName,
	   Category,
	   Price
INTO dim_products
from dbo.products
