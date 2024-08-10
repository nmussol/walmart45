--Total Sales per Store: Write a query to find the total Weekly_Sales for each store. Display the store ID and the total sales amount.
SELECT 
    store, ROUND(SUM(Weekly_Sales), 2) AS weekly_sales
FROM
    walmart45.walmart45
GROUP BY store
--Top Performing Store: Identify the store with the highest total sales across the entire dataset. Display the store ID and the total sales amount.
SELECT 
    store, ROUND(SUM(Weekly_Sales), 2) AS weekly_sales
FROM
    walmart45.walmart45
GROUP BY store
ORDER BY Weekly_Sales DESC
LIMIT 1
--Average Sales on Holidays vs. Non-Holidays: Calculate the average Weekly_Sales for weeks that are holidays (Holiday_Flag = 1) and non-holidays (Holiday_Flag = 0). Display both averages.
SELECT 
    store,
    ROUND(AVG(Weekly_Sales), 2) AS Average_sales,
    CASE
        WHEN holiday_flag = 1 THEN 'High'
        ELSE 'Low'
    END
FROM
    walmart45.walmart45
WHERE
    holiday_flag = 1
GROUP BY store 
UNION SELECT 
    store,
    ROUND(AVG(Weekly_Sales), 2) AS Average_sales,
    CASE
        WHEN holiday_flag = 1 THEN 'High'
        ELSE 'Low'
    END
FROM
    walmart45.walmart45
WHERE
    holiday_flag = 0
GROUP BY store
ORDER BY store
Sales Trend Over Time:
--Write a query to find the total Weekly_Sales for all stores combined, grouped by year and month. Display the year, month, and total sales.
SELECT 
    EXTRACT(YEAR FROM Date) AS Year,
    EXTRACT(MONTH FROM Date) AS Month,
    SUM(Weekly_Sales) AS Total_Sales
FROM
    walmart45
GROUP BY EXTRACT(YEAR FROM Date) , EXTRACT(MONTH FROM Date)
ORDER BY Year , Month

