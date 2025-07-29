# 📊 SQL EDA on Layoffs Dataset

## 📌 Project Overview
This project involves performing exploratory data analysis (EDA) on a cleaned dataset of global layoffs. The goal is to uncover trends in company layoffs across industries, years, countries, and funding stages.

## 🛠️ Tools Used
- MySQL
- Excel/CSV
- GitHub

## 📂 Files Included
- `layoffs_eda_analysis.sql` – All SQL queries for data exploration
- `layoffs_cleaned.csv` – Cleaned dataset from the previous project
- `README.md` – Documentation of the project and key insights

## 🔍 SQL Concepts Used
- Aggregation (`SUM()`, `AVG()`)
- Filtering & Sorting (`WHERE`, `ORDER BY`)
- Grouping (`GROUP BY`, `HAVING`)
- Date functions: `YEAR()`, `SUBSTRING()`
- CTEs (Common Table Expressions)
- Window Functions: `DENSE_RANK()`

## 💡 Questions Explored
- Total layoffs per company, country, industry
- Top 10 companies with highest layoff percentages
- Monthly and yearly layoff trends
- Companies with 100% shutdowns
- Which companies laid off the most in each year?
- Industries most affected by 100% layoffs

 ## 📈 Key Insights
- 🔺 2023 had the highest layoffs across the dataset.
- 🏢 Tech companies (e.g., Meta, Google) topped the layoffs list.
- 🌍 The United States reported the most job cuts.
- ⚠️ Over 20 companies completely shut down operations.
- 📉 Layoffs saw a spike post-pandemic, indicating economic instability.

## 📂 How to Use
- Clone the repository
- Import the dataset into MySQL Workbench
- Run the SQL queries provided in the sql_queries.sql file
(Optional) Export insights to Excel or Power BI for dashboards

## ✅ Outcome
This project identifies major layoff trends in the tech world from 2020–2023 and uncovers key insights that can be visualized further in BI tools like Power BI or Tableau.
