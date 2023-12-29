--1.) AVERAGE PRICE BY BRANDS

-- Selecting the brand and calculating the average price for each brand
SELECT Brand, AVG(CAST(Price AS DECIMAL(18,2))) AS AvgPrice
-- Specifying the source table and schema
FROM PROJECTS.dbo.AUSTRALIA_CAR_PRICES
-- Grouping the results by brand to calculate the average price for each brand
GROUP BY Brand
-- Ordering the results by average price in descending order
ORDER BY AvgPrice DESC;




--2.) PRICE DISTRIBUTION BY BODY TYPE
-- Selecting body type, minimum, maximum, and average prices for each body type
SELECT 
    BodyType, 
    MIN(CAST(Price AS DECIMAL)) AS MinPrice, -- Calculating the minimum price after casting Price as DECIMAL
    MAX(CAST(Price AS DECIMAL)) AS MaxPrice, -- Calculating the maximum price after casting Price as DECIMAL
    AVG(CAST(Price AS DECIMAL)) AS AvgPrice  -- Calculating the average price after casting Price as DECIMAL
FROM 
    PROJECTS.dbo.AUSTRALIA_CAR_PRICES
WHERE 
    BodyType <> 'Other' -- Excluding rows where the body type is 'Other'
GROUP BY 
    BodyType -- Grouping the results by body type
ORDER BY 
    MaxPrice DESC, -- Then by maximum price in descending order
    MinPrice DESC, -- Ordering the results by minimum price in descending order
    AvgPrice DESC; -- Finally by average price in descending order



--3.) PRICE TRENDS OVER YEARS

-- Selecting the year, brand, and calculating the average price
-- for each combination of year and brand in the car prices dataset
SELECT 
    Year, 
    Brand, 
    AVG(CAST(Price AS FLOAT)) AS AvgPrice -- Calculating the average price, casting to FLOAT for numeric operation
FROM 
    PROJECTS.dbo.AUSTRALIA_CAR_PRICES
GROUP BY 
    Year, Brand
ORDER BY 
    Year, Brand; -- Ordering the results by year and brand for better readability





--4.) PRICE VARIATION BY TRANSMISSION TYPE
-- Selecting transmission type and average price for each transmission type
SELECT 
    Transmission, 
    AVG(CAST(Price AS DECIMAL)) AS AvgPrice -- Calculating the average price
FROM 
    PROJECTS.dbo.AUSTRALIA_CAR_PRICES
WHERE 
    Transmission = 'Automatic' OR Transmission = 'Manual' -- Selecting for cars with either automatic or manual transmission
GROUP BY 
    Transmission -- Grouping the results by transmission type
ORDER BY 
    Transmission;
