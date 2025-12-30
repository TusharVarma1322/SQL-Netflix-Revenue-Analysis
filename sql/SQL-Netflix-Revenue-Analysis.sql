
-- the top 3 most-watched movies based on viewing hours
SELECT
  c.TitleName           AS MovieTitle,
  ROUND(SUM(v.Runtime) / 60.0, 2) AS TotalHoursWatched
FROM ViewingHistory AS v
JOIN Content        AS c
  ON v.ContentID = c.ContentID
WHERE c.Category = 'Movie'
GROUP BY c.TitleName
ORDER BY TotalHoursWatched DESC
LIMIT 3;



-- Top Genre per Category Based on Viewing Hours 

WITH GenreHours AS (
  SELECT
    c.Category,
    c.Genre,
    SUM(v.Runtime)           AS TotalMinutes
  FROM ViewingHistory AS v
  JOIN Content        AS c
    ON v.ContentID = c.ContentID
  GROUP BY
    c.Category,
    c.Genre
),
RankedGenres AS (
  SELECT
    Category,
    Genre,
    ROUND(TotalMinutes / 60.0, 2) AS TotalHoursWatched,
    RANK() OVER (
      PARTITION BY Category
      ORDER BY TotalMinutes DESC
    ) AS GenreRank
  FROM GenreHours
)
SELECT
  Category,
  Genre,
  TotalHoursWatched
FROM RankedGenres
WHERE GenreRank = 1;


-- Number of Subscriptions per Plan

SELECT
  p.PlanID        AS PlanID,
  p.PlanName      AS PlanName,
  COUNT(s.CustID) AS SubscriberCount
FROM Subscribes AS s
JOIN Plans     AS p
  ON s.PlanID = p.PlanID
GROUP BY
  p.PlanID,
  p.PlanName;
  
  
  
  -- Most Commonly Used Device Type

SELECT
  d.DeviceType,
  COUNT(u.DeviceID) AS UsageCount
FROM Uses AS u
JOIN Devices AS d
  ON u.DeviceID = d.DeviceID
GROUP BY d.DeviceType
ORDER BY UsageCount DESC
LIMIT 1;


-- Average Viewing Time for Movies vs TV Shows

SELECT
  c.Category AS ContentType,
  ROUND(AVG(v.Runtime), 2) AS AvgViewingTime_Minutes
FROM ViewingHistory AS v
JOIN Content AS c
  ON v.ContentID = c.ContentID
GROUP BY c.Category;

-- : Most Preferred Language by Customers


SELECT
  Language,
  COUNT(CustID) AS CustomerCount
FROM CustomersLanguagePreferred
GROUP BY Language
ORDER BY CustomerCount DESC
LIMIT 1;

--  Count of Adult Accounts vs Child Accounts


SELECT 'Adult' AS AccountType, COUNT(*) AS Count FROM AdultAcc
UNION
SELECT 'Child' AS AccountType, COUNT(*) AS Count FROM ChildAcc;


--  Average Number of Profiles per Customer Account


SELECT
  ROUND(COUNT(*) / COUNT(DISTINCT CustID), 2) AS AvgProfilesPerCustomer
FROM Profiles;


-- Content with the Lowest Average Viewing Time per User


SELECT
  c.TitleName,
  ROUND(AVG(v.Runtime), 2) AS AvgWatchTime_Minutes
FROM ViewingHistory AS v
JOIN Content AS c
  ON v.ContentID = c.ContentID
GROUP BY c.TitleName
ORDER BY AvgWatchTime_Minutes ASC
LIMIT 1;



--  Count for Each Content Type

SELECT
  Category AS ContentType,
  COUNT(*) AS TotalCount
FROM Content
GROUP BY Category;


-- Viewing Hours by Region (Country-wise)

SELECT
  cu.Country,
  ROUND(SUM(v.Runtime) / 60.0, 2) AS TotalHoursWatched
FROM ViewingHistory AS v
JOIN Profiles       AS p  ON v.ProfileID = p.ProfileID
JOIN Customers      AS cu ON p.CustID = cu.CustID
GROUP BY cu.Country
ORDER BY TotalHoursWatched DESC;


-- Viewing Hours by Gender

SELECT
  cu.Gender,
  ROUND(SUM(v.Runtime) / 60.0, 2) AS TotalHoursWatched
FROM ViewingHistory AS v
JOIN Profiles  AS p  ON v.ProfileID = p.ProfileID
JOIN Customers AS cu ON p.CustID = cu.CustID
GROUP BY cu.Gender;

-- Device Usage Count by Country

 select cu.Country,
  d.DeviceType,
  COUNT(*) AS UsageCount
FROM Uses AS u
JOIN Devices   AS d  ON u.DeviceID = d.DeviceID
JOIN Profiles  AS p  ON u.ProfileID = p.ProfileID
JOIN Customers AS cu ON p.CustID = cu.CustID
GROUP BY cu.Country, d.DeviceType
ORDER BY cu.Country, UsageCount DESC;


-- Total Revenue by Country
SELECT
  cu.COUNTRY,
  SUM(
    CAST(
      REPLACE(REPLACE(ph.PaymentAmount, '$', ''), ',', '') 
      AS DECIMAL(12,2)
    )
  ) AS total_revenue
FROM PaymentHistory ph
JOIN PaymentMethod pm ON ph.CardID = pm.CardID
JOIN Customers cu       ON pm.CUSTID = cu.CUSTID
GROUP BY cu.COUNTRY
ORDER BY total_revenue DESC;



-- Average Age of Viewers by Content Type

SELECT
  c.Category AS ContentType,
  ROUND(AVG(YEAR(CURDATE()) - YEAR(cu.BDate)), 1) AS AvgViewerAge
FROM ViewingHistory AS v
JOIN Content   AS c  ON v.ContentID = c.ContentID
JOIN Profiles  AS p  ON v.ProfileID = p.ProfileID
JOIN Customers AS cu ON p.CustID = cu.CustID
GROUP BY c.Category;