select *
FROM dbo.customer_journey;

-----------------------------------------------------
--deduplicating rows and making sure that column data types are right
with no_duplicates_cte as (SELECT JourneyID,
						   CustomerID,
						   ProductID,
						   VisitDate,
						   Stage,
						   Action,
						   Duration,
						   COUNT(*) as dupes

					FROM dbo.customer_journey

					group by JourneyID,
						   CustomerID,
						   ProductID,
						   VisitDate,
						   Stage,
						   Action,
						   Duration
					having COUNT(*) = 1),

measurments_cte as (SELECT JourneyID,
						   CustomerID,
						   ProductID,
						   VisitDate,
						   Stage,
						   Action,
						   Duration,
						   AVG(duration) OVER (partition by VisitDate) as avg_duration
					FROM no_duplicates_cte)


SELECT JourneyID,
	   CustomerID,
	   ProductID,
	   VisitDate,
	   Stage,
	   Action,
	   Duration,
	   avg_duration

INTO dbo.fact_customer_journey --Creating a fact_table

FROM measurments_cte;

--------------------------
SELECT JourneyID,
	   CustomerID,
	   ProductID,
	   VisitDate,
	   Stage,
	   Action,
	   Duration,
	   avg_duration
from  dbo.fact_customer_journey