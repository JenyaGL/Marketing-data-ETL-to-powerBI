--
SELECT top 5 *
from dbo.engagement_data

--------------------
-- check for duplicates
SELECT EngagementID
	   ContentID,
	   ContentType,
	   Likes,
	   EngagementDate,
	   CampaignID,
	   ProductID,
	   ViewsClicksCombined,
	   COUNT(*)
FROM dbo.engagement_data
GROUP BY EngagementID,
	   ContentID,
	   ContentType,
	   Likes,
	   EngagementDate,
	   CampaignID,
	   ProductID,
	   ViewsClicksCombined
HAVING COUNT(*) > 1

---

SELECT EngagementID
	   ContentID,
	   lower(replace(ContentType,'Socialmedia','Social Media')) as ContentType,
	   Likes,
	   EngagementDate,
	   CampaignID,
	   ProductID,
	   LEFT(ViewsClicksCombined, CHARINDEX('-', ViewsClicksCombined) - 1) AS Views,
       RIGHT(ViewsClicksCombined, LEN(ViewsClicksCombined) - CHARINDEX('-', ViewsClicksCombined)) AS Clicks
INTO fact_engagement_data
FROM dbo.engagement_data
