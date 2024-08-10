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
--Impact of Fuel Price on Sales: Determine whether there is a correlation between Fuel_Price and Weekly_Sales. Calculate the average Weekly_Sales for weeks where Fuel_Price is above the median and below the median. Display both averages.
SELECT 
    EXTRACT(YEAR FROM Date) AS Year,
    EXTRACT(MONTH FROM Date) AS Month,
    ROUND(AVG(Weekly_Sales),2) AS Total_Sales,
    ROUND(AVG(fuel_price),2)
FROM
    walmart45
GROUP BY EXTRACT(YEAR FROM Date) , EXTRACT(MONTH FROM Date)
ORDER BY Year , Month
--Temperature Impact on Sales: Write a query to find the average Weekly_Sales for weeks where the Temperature is above 70°F. Display both averages.
SELECT 
    EXTRACT(YEAR FROM Date) AS Year,
    EXTRACT(MONTH FROM Date) AS Month,
    ROUND(AVG(Weekly_Sales), 2) AS average_sales,
    ROUND(AVG(temperature),2) AS avg_temp
FROM
    walmart45
WHERE
    temperature > 70
GROUP BY EXTRACT(YEAR FROM Date) , EXTRACT(MONTH FROM Date)
ORDER BY Year , Month

--Store with Lowest Average Sales During Holiday Weeks: Identify the store with the lowest average Weekly_Sales during holiday weeks. Display the store ID and the average sales amount.
SELECT 
    store, ROUND(AVG(weekly_sales), 2) AS avg_sales
FROM
    walmart45
WHERE
    holiday_flag = 1
GROUP BY store
ORDER BY avg_sales ASC
LIMIT 1
--Sales Distribution by Unemployment Rate: Write a query to group the data by Unemployment rate intervals (e.g., 0-5%, 5-10%, etc.) and calculate the total Weekly_Sales for each interval. Display the unemployment interval and the total sales.
SELECT 
    CASE
        WHEN unemployment BETWEEN 0 AND 5 THEN '0-5%'
        WHEN unemployment > 5 AND unemployment <= 10 THEN '5-10%'
        WHEN unemployment > 10 AND unemployment <= 15 THEN '10-15%'
        ELSE '15% & above'
    END AS unemployment,
    SUM(weekly_sales) AS sales
FROM
    walmart45
GROUP BY CASE
    WHEN unemployment BETWEEN 0 AND 5 THEN '0-5%'
    WHEN unemployment > 5 AND unemployment <= 10 THEN '5-10%'
    WHEN unemployment > 10 AND unemployment <= 15 THEN '10-15%'
    ELSE '15% & above'
END
ORDER BY Unemployment ASC
--Consumer Price Index (CPI) Effect on Sales: Analyze the effect of CPI on Weekly_Sales. Calculate the total Weekly_Sales for weeks where CPI is above 220 and below 220. Display both totals.
SELECT
    CASE
        WHEN CPI > 220 THEN 'Above 220'
        ELSE 'Below 220'
    END AS CPI_Range,
    SUM(Weekly_Sales) AS Total_Weekly_Sales
FROM
    walmart45
GROUP BY
    CASE
        WHEN CPI > 220 THEN 'Above 220'
        ELSE 'Below 220'
    END;

