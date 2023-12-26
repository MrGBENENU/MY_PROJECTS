--TOP 10 COUNTRIES WITH HIGHEST NUMBER OF STARBUCKS STORES

-- Selecting the 'Country' column and counting the occurrences of each unique country in the 'Starbucks_locations' table
-- Using the COUNT(*) function and aliasing it as 'StoreCount'
-- Calculating the country percentage for each country relative to the total number of Starbucks locations
-- (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Starbucks_locations)) AS CountryPercentage
-- Rounding the CountryPercentage to two decimal places
SELECT
    Country,
    COUNT(*) AS StoreCount,
    ROUND((COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Starbucks_locations)), 2) AS CountryPercentage
-- Grouping the results by the 'Country' column
FROM Starbucks_locations
-- Displaying the count and percentage of each country
GROUP BY Country
-- Ordering the results by the country percentage in descending order
ORDER BY CountryPercentage DESC;




--COUNT and Percentage OF EACH STARBUCKS SHOPS BY OWNERSHIP TYPES

-- Selecting the 'Ownership Type' column and counting the occurrences of each unique ownership type in the 'Starbucks_locations' table
-- Using the COUNT(*) function and aliasing it as 'OwnershipCount'
-- Calculating the ownership percentage for each ownership type relative to the total number of Starbucks locations
-- (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Starbucks_locations)) AS OwnershipPercentage
SELECT
    [Ownership Type],
    COUNT(*) AS OwnershipCount,
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Starbucks_locations)) AS OwnershipPercentage
-- Grouping the results by the 'Ownership Type' column
FROM Starbucks_locations
-- Displaying the count and percentage of each ownership type
GROUP BY [Ownership Type];



--TOP 10 CITIES WITH THE MOST STARBUCKS STORES

-- Selecting the 'City' column and counting the occurrences of each unique city in the 'Starbuck_locations' table
-- Using the COUNT(*) function and aliasing it as 'StoreCount'
SELECT TOP 10 City, COUNT(*) AS StoreCount
-- Grouping the results by the 'City' column
FROM Starbucks_locations
-- Grouping by the 'City' column to match the aggregate function
GROUP BY City
-- Ordering the results by the count of stores in each city in descending order
ORDER BY StoreCount DESC;


-- Global Distribution of Starbucks Stores by Ownership Type

-- Selecting the 'Ownership Type' column and counting the distinct occurrences of 'Country' for each ownership type
SELECT
    [Ownership Type],
    COUNT(DISTINCT Country) AS CountryCount,
    -- Calculating the percentage of distinct countries for each ownership type
    -- Rounded to two decimal places
    ROUND(
        (COUNT(DISTINCT Country) * 100.0 / (SELECT COUNT(DISTINCT Country) FROM Starbucks_locations)),
        2
    ) AS CountryPercentage
-- Grouping the results by 'Ownership Type'
FROM Starbucks_locations
-- Grouping by 'Ownership Type' to match the aggregate functions
GROUP BY [Ownership Type]
-- Ordering the results by the count of distinct countries in descending order
ORDER BY CountryCount DESC;

