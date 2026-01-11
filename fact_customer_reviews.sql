--
select top 10 *
FROM dbo.customer_reviews;

-----------------------------------------------------
--deduplicating rows and making sure that the 
SELECT ReviewID,
	   CustomerID,
	   ProductID,
	   ReviewDate,
	   Rating,
	   ReviewText,
	   COUNT(*)
FROM dbo.customer_reviews
GROUP BY ReviewID,
	   CustomerID,
	   ProductID,
	   ReviewDate,
	   Rating,
	   ReviewText
having COUNT(*) > 1;

-- no duplicates

select ReviewID,
	   CustomerID,
	   ProductID,
	   ReviewDate,
	   Rating,
	   replace(ReviewText, '  ',' ') as ReviewText
into dbo.fact_customer_reviews
FROM dbo.customer_reviews

-----
SELECT TOP 5 *
FROM dbo.fact_customer_reviews

