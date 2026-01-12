------------------------------------
-- this is an EDA of the data:

-- customer_journey

SELECT top 5 *
FROM dbo.customer_journey
--
SELECT COUNT(JourneyID),COUNT(CustomerID),COUNT(ProductID),COUNT(VisitDate),COUNT(Stage),COUNT(Action),COUNT(Duration)
FROM dbo.customer_journey
--


------------------------------------
-- customer_reviews

SELECT top 5 *
FROM dbo.customer_reviews

SELECT COUNT(ReviewID),COUNT(CustomerID),COUNT(ProductID),COUNT(ReviewDate),COUNT(Rating),COUNT(ReviewText)
FROM dbo.customer_reviews

------------------------------------
-- engagement_data

SELECT top 5 *
FROM dbo.engagement_data

SELECT COUNT(EngagementID),COUNT(ContentID),COUNT(ContentType),COUNT(Likes),COUNT(EngagementDate),COUNT(CampaignID),COUNT(ProductID),COUNT(ViewsClicksCombined)
FROM dbo.engagement_data

------------------------------------
-- customers

select top 5 *
from dbo.customers

------------------------------------
-- geography

select top 5 *
from dbo.geography


------------------------------------
-- products


select top 5 *
from dbo.products


-- there are several changes to be made in the data:
-- 1) make sure that there are no duplicated rows in all of the tables.
-- 2) make sure that all the datetime data types are the same in all the table
-- 3) seperate ViewsClicksCombined coulmn in to 2 coulmn(views and clicks
-- 4) add addittional measurents and necessary columns for analysis
