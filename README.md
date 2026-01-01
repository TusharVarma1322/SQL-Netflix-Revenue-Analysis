# 🎬 Netflix Revenue & Viewing Analysis with SQL

<p align="center">
  <img src="image/Netflix Schema.png" alt="Netflix Database Schema" width="700">
</p>

## 📋 Table of Contents
- [Project Overview](#-project-overview)
- [Business Questions](#-business-questions)
- [Dataset Description](#-dataset-description)
- [Database Schema](#-database-schema)
- [SQL Solutions & Analysis](#-sql-solutions--analysis)
- [Key Insights](#-key-insights)
- [Technical Skills Demonstrated](#-technical-skills-demonstrated)
- [Project Structure](#-project-structure)
- [How to Run](#-how-to-run)
- [Future Improvements](#-future-improvements)

---

## 🎯 Project Overview

This project is an **end-to-end SQL analysis** of a Netflix-style streaming platform database. The goal is to design a comprehensive database schema and analyze user viewing trends, revenue patterns, and subscription models to answer critical business questions.

**Key Objective:** Understand viewer behavior, content performance, revenue distribution, and subscription patterns to drive data-informed business decisions.

---

## ❓ Business Questions

This analysis answers **15 critical business questions**:

| # | Category | Question |
|---|----------|----------|
| 1 | Content | What are the **top 3 most-watched movies** based on viewing hours? |
| 2 | Content | What is the **top genre per category** (Movies vs TV Shows) based on viewing hours? |
| 3 | Subscriptions | How many **subscriptions exist per plan** type? |
| 4 | Devices | What is the **most commonly used device type**? |
| 5 | Viewing | What is the **average viewing time** for Movies vs TV Shows? |
| 6 | Demographics | What is the **most preferred language** by customers? |
| 7 | Accounts | What is the **count of Adult vs Child accounts**? |
| 8 | Profiles | What is the **average number of profiles** per customer account? |
| 9 | Content | Which content has the **lowest average viewing time** per user? |
| 10 | Content | What is the **total count for each content type**?  |
| 11 | Regional | What are the **viewing hours by region** (country-wise)? |
| 12 | Demographics | What are the **viewing hours by gender**? |
| 13 | Regional | What is the **device usage count by country**? |
| 14 | Revenue | What is the **total revenue by country**? |
| 15 | Demographics | What is the **average age of viewers** by content type? |

---

## 🗄️ Dataset Description

### Database:  `netflix`

The database consists of **12 interconnected tables** representing a complete streaming platform ecosystem:

### Core Tables

| Table | Description | Key Fields |
|-------|-------------|------------|
| `Customers` | Customer demographic information | `CustID`, `FName`, `LName`, `BDate`, `Gender`, `Country`, `Email` |
| `Plans` | Subscription plan details | `PlanID`, `PlanName`, `MonthlyPrice`, `VideoQuality`, `NumOfProfiles` |
| `Content` | Movies and TV Shows catalog | `ContentID`, `TitleName`, `Genre`, `Category`, `UnlimitedAccess` |
| `Profiles` | User profiles under accounts | `ProfileID`, `ProfileName`, `CustID` |
| `Devices` | Supported device types | `DeviceID`, `DeviceType` |

### Relationship Tables

| Table | Description | Relationships |
|-------|-------------|---------------|
| `Subscribes` | Customer subscription records | Customers ↔ Plans |
| `ViewingHistory` | Content watching records | Profiles ↔ Content |
| `Uses` | Device usage by profiles | Profiles ↔ Devices |
| `PaymentMethod` | Customer payment cards | Customers → PaymentMethod |
| `PaymentHistory` | Payment transaction records | PaymentMethod → PaymentHistory |
| `CustomersLanguagePreferred` | Language preferences | Customers → Languages |

### Specialized Tables

| Table | Description |
|-------|-------------|
| `ChildAcc` | Child profile restrictions (parental ratings) |
| `AdultAcc` | Adult profile information (number of children) |

---

## 🔗 Database Schema

### Entity Relationships

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│  Customers  │────►│  Profiles   │────►│ViewingHistory│
└─────────────┘     └─────────────┘     └─────────────┘
      │                   │                    │
      │                   │                    ▼
      ▼                   ▼              ┌─────────────┐
┌─────────────┐     ┌─────────────┐     │   Content   │
│ Subscribes  │     │    Uses     │     └─────────────┘
└─────────────┘     └─────────────┘
      │                   │
      ▼                   ▼
┌─────────────┐     ┌─────────────┐
│    Plans    │     │   Devices   │
└─────────────┘     └─────────────┘
```

### Subscription Plans

| Plan | Price | Quality | Profiles | Ad Support |
|------|-------|---------|----------|------------|
| Standard w/ Ads | $6.99 | Full HD | 1 | Yes |
| Standard | $15.49 | Full HD | 2 | No |
| Premium | $22.99 | Ultra HD | 4 | No |

---

## 💻 SQL Solutions & Analysis

### 1. Top 3 Most-Watched Movies

**Objective:** Identify the most popular movies based on total viewing hours.

```sql
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
```

**Key Techniques:**
- `JOIN` to connect viewing history with content details
- `SUM()` aggregation for total runtime
- `WHERE` filter for movies only
- `ORDER BY DESC` with `LIMIT` for top results

---

### 2. Top Genre per Category (Movies vs TV Shows)

**Objective:** Find the most-watched genre within each content category.

```sql
WITH GenreHours AS (
  SELECT
    c.Category,
    c. Genre,
    SUM(v.Runtime) AS TotalMinutes
  FROM ViewingHistory AS v
  JOIN Content AS c ON v.ContentID = c.ContentID
  GROUP BY c. Category, c.Genre
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
SELECT Category, Genre, TotalHoursWatched
FROM RankedGenres
WHERE GenreRank = 1;
```

**Key Techniques:**
- **Common Table Expressions (CTEs)** for query organization
- **Window Functions** (`RANK() OVER PARTITION BY`) for ranking within groups
- Multi-step aggregation logic

---

### 3. Subscriptions per Plan

**Objective:** Count how many customers subscribe to each plan. 

```sql
SELECT
  p.PlanID        AS PlanID,
  p.PlanName      AS PlanName,
  COUNT(s.CustID) AS SubscriberCount
FROM Subscribes AS s
JOIN Plans AS p ON s.PlanID = p. PlanID
GROUP BY p.PlanID, p.PlanName;
```

---

### 4. Most Commonly Used Device Type

```sql
SELECT
  d.DeviceType,
  COUNT(u.DeviceID) AS UsageCount
FROM Uses AS u
JOIN Devices AS d ON u.DeviceID = d.DeviceID
GROUP BY d. DeviceType
ORDER BY UsageCount DESC
LIMIT 1;
```

---

### 5. Average Viewing Time:  Movies vs TV Shows

```sql
SELECT
  c.Category AS ContentType,
  ROUND(AVG(v.Runtime), 2) AS AvgViewingTime_Minutes
FROM ViewingHistory AS v
JOIN Content AS c ON v.ContentID = c.ContentID
GROUP BY c.Category;
```

---

### 6. Most Preferred Language

```sql
SELECT
  Language,
  COUNT(CustID) AS CustomerCount
FROM CustomersLanguagePreferred
GROUP BY Language
ORDER BY CustomerCount DESC
LIMIT 1;
```

---

### 7. Adult vs Child Account Count

```sql
SELECT 'Adult' AS AccountType, COUNT(*) AS Count FROM AdultAcc
UNION
SELECT 'Child' AS AccountType, COUNT(*) AS Count FROM ChildAcc;
```

**Key Technique:** `UNION` to combine results from two tables

---

### 8. Average Profiles per Customer

```sql
SELECT
  ROUND(COUNT(*) / COUNT(DISTINCT CustID), 2) AS AvgProfilesPerCustomer
FROM Profiles;
```

---

### 9. Content with Lowest Average Viewing Time

```sql
SELECT
  c.TitleName,
  ROUND(AVG(v.Runtime), 2) AS AvgWatchTime_Minutes
FROM ViewingHistory AS v
JOIN Content AS c ON v.ContentID = c.ContentID
GROUP BY c.TitleName
ORDER BY AvgWatchTime_Minutes ASC
LIMIT 1;
```

---

### 10. Content Count by Type

```sql
SELECT
  Category AS ContentType,
  COUNT(*) AS TotalCount
FROM Content
GROUP BY Category;
```

---

### 11. Viewing Hours by Country

```sql
SELECT
  cu.Country,
  ROUND(SUM(v.Runtime) / 60.0, 2) AS TotalHoursWatched
FROM ViewingHistory AS v
JOIN Profiles AS p ON v.ProfileID = p.ProfileID
JOIN Customers AS cu ON p.CustID = cu. CustID
GROUP BY cu.Country
ORDER BY TotalHoursWatched DESC;
```

**Key Technique:** Multi-table `JOIN` chain (ViewingHistory → Profiles → Customers)

---

### 12.  Viewing Hours by Gender

```sql
SELECT
  cu.Gender,
  ROUND(SUM(v. Runtime) / 60.0, 2) AS TotalHoursWatched
FROM ViewingHistory AS v
JOIN Profiles AS p ON v.ProfileID = p.ProfileID
JOIN Customers AS cu ON p.CustID = cu.CustID
GROUP BY cu.Gender;
```

---

### 13. Device Usage by Country

```sql
SELECT 
  cu.Country,
  d.DeviceType,
  COUNT(*) AS UsageCount
FROM Uses AS u
JOIN Devices AS d ON u.DeviceID = d.DeviceID
JOIN Profiles AS p ON u.ProfileID = p.ProfileID
JOIN Customers AS cu ON p.CustID = cu.CustID
GROUP BY cu.Country, d. DeviceType
ORDER BY cu.Country, UsageCount DESC;
```

**Key Technique:** 4-table `JOIN` with multiple grouping columns

---

### 14. Total Revenue by Country

```sql
SELECT
  cu. COUNTRY,
  SUM(
    CAST(
      REPLACE(REPLACE(ph.PaymentAmount, '$', ''), ',', '') 
      AS DECIMAL(12,2)
    )
  ) AS total_revenue
FROM PaymentHistory ph
JOIN PaymentMethod pm ON ph.CardID = pm.CardID
JOIN Customers cu ON pm. CUSTID = cu. CUSTID
GROUP BY cu.COUNTRY
ORDER BY total_revenue DESC;
```

**Key Techniques:**
- `REPLACE()` for string cleaning (removing $ and commas)
- `CAST()` for type conversion
- Multi-table revenue aggregation

---

### 15. Average Viewer Age by Content Type

```sql
SELECT
  c.Category AS ContentType,
  ROUND(AVG(YEAR(CURDATE()) - YEAR(cu.BDate)), 1) AS AvgViewerAge
FROM ViewingHistory AS v
JOIN Content AS c ON v.ContentID = c.ContentID
JOIN Profiles AS p ON v. ProfileID = p. ProfileID
JOIN Customers AS cu ON p.CustID = cu.CustID
GROUP BY c. Category;
```

**Key Technique:** Age calculation using `YEAR()` and `CURDATE()` functions

---

## 💡 Key Insights

### Content Performance
- **Action genre** dominates viewing hours across both Movies and TV Shows
- Movies have significantly higher individual viewing sessions than TV Shows
- Content with unlimited access shows higher engagement rates

### Subscription Patterns
- **Premium plan** has strong adoption despite higher price point
- Standard plan offers the best value proposition for families

### Device & Regional Trends
- **Tablets** are the most commonly used devices for streaming
- **US market** generates the highest viewing hours and revenue
- Device preferences vary by region

### Demographics
- Customer base spans multiple countries (US, UK, Canada, Australia)
- Language preferences show English as primary with strong multilingual support

---

## 🛠️ Technical Skills Demonstrated

| Category | Skills |
|----------|--------|
| **SQL Joins** | INNER JOIN, LEFT JOIN, Multi-table joins (4+ tables) |
| **Aggregations** | COUNT(), SUM(), AVG(), MIN(), MAX() |
| **Window Functions** | RANK(), PARTITION BY, ORDER BY |
| **CTEs** | Common Table Expressions for query organization |
| **Set Operations** | UNION for combining result sets |
| **String Functions** | REPLACE(), CAST() for data cleaning |
| **Date Functions** | YEAR(), CURDATE(), DATEDIFF() |
| **Filtering** | WHERE, HAVING, GROUP BY |
| **Database Design** | Schema design, Primary/Foreign keys, Normalization |

---

## 📁 Project Structure

```
SQL-Netflix-Revenue-Analysis/
│
├── README.md                              # Project documentation (this file)
│
├── data/
│   └── Netflix Database.sql               # Complete database schema & data
│
├── sql/
│   └── SQL-Netflix-Revenue-Analysis. sql   # All 15 business query solutions
│
├── docs/
│   └── netflix_data_problem_statement.pdf # Original problem statement
│
└── image/
    └── Netflix Schema.png                 # Database ER diagram
```

---

## 🚀 How to Run

### Prerequisites
- MySQL Server 8.0+
- MySQL Workbench (recommended) or any SQL client

### Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/TusharVarma1322/SQL-Netflix-Revenue-Analysis.git
   cd SQL-Netflix-Revenue-Analysis
   ```

2. **Import the database**
   ```sql
   SOURCE data/Netflix Database.sql;
   ```

3. **Verify the setup**
   ```sql
   USE netflix;
   SHOW TABLES;
   -- Expected: 12 tables
   ```

4. **Run the analysis queries**
   ```sql
   SOURCE sql/SQL-Netflix-Revenue-Analysis. sql;
   ```

---

## 🔜 Future Improvements

- [ ] **Churn Analysis:** Analyze subscription cancellation patterns
- [ ] **Cohort Analysis:** Track user behavior by registration date
- [ ] **Content Recommendation:** Build SQL-based recommendation logic
- [ ] **Time Series:** Analyze viewing trends over time
- [ ] **A/B Testing Setup:** Design tables for experiment tracking
- [ ] **Python Integration:** Add visualizations using matplotlib/seaborn

---

## 📚 What I Learned

1. **Complex Database Design** - Creating normalized schemas with proper relationships
2. **Advanced SQL Joins** - Connecting 4+ tables for comprehensive analysis
3. **Window Functions** - Using RANK() and PARTITION BY for rankings
4. **CTEs** - Organizing complex queries with Common Table Expressions
5. **Data Cleaning in SQL** - Using REPLACE() and CAST() for messy data
6. **Business Analysis** - Translating business questions into SQL queries

---

## 👤 Author

**Tushar Varma**
- GitHub: [@TusharVarma1322](https://github.com/TusharVarma1322)

---

*Project completed:  December 2025*
