-- Exploratory DATA Analysis


-- 1. View all the raw data from the table
SELECT * 
FROM layoff_staging2;

-- 2. Find the most total layoffs and highest percentage laid off
SELECT MAX( total_laid_off), MAX(percentage_laid_off)
FROM layoff_staging2;


-- 3.Companies that laid off 100% of their employees (shutdowns).
SELECT * 
FROM layoff_staging2
WHERE percentage_laid_off=1 -- 1 stands for 100% of the company
ORDER BY funds_raised_millions DESC;

-- 4.Total layoffs by each company
SELECT company,SUM(total_laid_off) 
FROM layoff_staging2
GROUP BY company
ORDER BY 2 DESC;


-- 5.Understand the time range of the data.
SELECT MIN(`date`),MAX(`date`)
FROM layoff_staging2;

-- 6.Layoffs by industry.
SELECT industry,SUM(total_laid_off) 
FROM layoff_staging2
GROUP BY industry
ORDER BY 2 DESC;


-- 7.Layoffs by country.
SELECT country,SUM(total_laid_off)
FROM layoff_staging2
GROUP BY country
ORDER BY 2 DESC;

-- 8.Daily layoffs
SELECT `date`,SUM(total_laid_off)
FROM layoff_staging2
GROUP BY `date`
ORDER BY 1 DESC;

-- 9. Yearly layoffs
SELECT YEAR(`date`),SUM(total_laid_off)
FROM layoff_staging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;

-- 10: Layoffs by funding stage (e.g., Series A, Series B, IPO).
SELECT stage,SUM(total_laid_off)
FROM layoff_staging2
GROUP BY stage
ORDER BY 2 DESC;

-- 11.Average layoff percentage per company
SELECT company,AVG(percentage_laid_off)
FROM layoff_staging2
GROUP BY company
ORDER BY 2 DESC;

-- 12.Monthly layoffs
SELECT SUBSTRING(`date`,1,7) AS `MONTH`,SUM(total_laid_off)
FROM layoff_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 DESC;

-- 13.Number of Layoff Events
SELECT COUNT(*)
FROM layoff_staging2;

-- 14.Number of Companies Affected
SELECT COUNT(DISTINCT company)
FROM layoff_staging2;

-- 15. Top 10 Companies by Layoff Percentage
SELECT company,MAX(percentage_laid_off)
FROM layoff_staging2
GROUP BY company
ORDER BY 2 DESC
LIMIT 10;

-- 16.Recent 5 Layoff Events
SELECT *
FROM layoff_staging2
ORDER BY `date` DESC
LIMIT 5;

-- 17. Top 5 Industries with 100% Layoffs
SELECT industry,COUNT(*)
FROM layoff_staging2
WHERE percentage_laid_off=1
GROUP BY industry
ORDER BY 2 DESC
LIMIT 5;


-- 18. For each year, which companies had the highest total layoffs and ranking them accordingly.
WITH company_rank(company,years,total_laid_off) AS
(
SELECT company,YEAR(`date`),SUM(total_laid_off)
FROM layoff_staging2
GROUP BY company,YEAR(`date`)
)
SELECT *,DENSE_RANK() OVER( PARTITION BY years ORDER BY total_laid_off DESC)
FROM company_rank
WHERE years IS NOT NULL;

-- 19. finding top 10 for each year, which companies had the highest total layoffs and ranking them accordingly.
WITH company_rank(company,years,total_laid_off) AS
(
SELECT company,YEAR(`date`),SUM(total_laid_off)
FROM layoff_staging2
GROUP BY company,YEAR(`date`)
)
SELECT *,DENSE_RANK() OVER( PARTITION BY years ORDER BY total_laid_off DESC)
FROM company_rank
WHERE years IS NOT NULL
LIMIT 13;

CREATE TABLE layoff_staging_analysis;
