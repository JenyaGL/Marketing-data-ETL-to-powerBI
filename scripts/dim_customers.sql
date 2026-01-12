----

SELECT TOP 5 *
FROM dbo.customers

--

SELECT TOP 5 *
FROM dbo.geography

---

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


