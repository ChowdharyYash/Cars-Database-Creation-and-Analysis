-- ALY6030 Assignment 1: Database Creation and Analysis
-- Yash Chowdhary
-- Choosen car data for Database creation and analysis of car performance metrics

-- Create a new database for storing car information
CREATE DATABASE IF NOT EXISTS cars_database;
USE cars_database;

-- Create the cars table with appropriate columns and data types
-- Each column is designed to store specific car attributes
CREATE TABLE IF NOT EXISTS cars (
    car_name VARCHAR(100),         -- Store car name as string with max length of 100 characters
    mpg DECIMAL(5,1),              -- Miles per gallon with 1 decimal place precision (e.g., 25.5)
    cylinders INT,                 -- Number of engine cylinders as integer value
    displacement DECIMAL(6,1),     -- Engine displacement in cubic inches with 1 decimal place
    horsepower INT,                -- Engine power in HP as integer value
    weight INT,                    -- Vehicle weight in pounds as integer
    acceleration DECIMAL(4,1),     -- 0-60 mph acceleration time in seconds with 1 decimal precision
    model_year INT,                -- Year the model was manufactured as integer
    origin VARCHAR(20)             -- Country/region where the car was manufactured
);

-- NOTE: import data from your CSV file
-- This can be done using:
-- 1. MySQL Workbench: Table Data Import Wizard (which I used)
-- 2. MySQL command line: LOAD DATA INFILE command


-- Verify data import was successful by showing the first 10 records
-- This helps confirm data structure and content before analysis
SELECT * FROM cars LIMIT 10;

-- ANALYSIS SECTION:

-- Question 1: Which cars have the best fuel efficiency (MPG)?
-- Retrieve top 10 cars with highest MPG (most fuel efficient)
-- Only selecting relevant columns for analysis
-- Excluding any records with NULL mpg values
-- Sorting in descending order to show highest MPG first
SELECT 
    car_name,                      -- Display the name of the car
    mpg,                           -- Show the miles per gallon value
    cylinders,                     -- Include cylinder count for context
    model_year,                    -- Show the year of manufacture
    origin                         -- Show country of origin
FROM 
    cars
WHERE 
    mpg IS NOT NULL                -- Exclude records with missing MPG data
ORDER BY 
    mpg DESC                       -- Sort by MPG from highest to lowest
LIMIT 10;                          -- Return only the top 10 results

-- Question 2: How has average fuel efficiency changed over time for each country of origin?
-- Calculate and group average MPG by year and origin to show efficiency trends
SELECT 
    model_year,                    -- Group results by manufacturing year
    origin,                        -- Further group by country of origin
    AVG(mpg) AS average_mpg        -- Calculate the average MPG for each group
FROM 
    cars
WHERE 
    mpg IS NOT NULL                -- Exclude records with missing MPG data
GROUP BY 
    model_year, origin             -- Group results by both year and origin
ORDER BY 
    model_year, origin;            -- Sort results by year first, then origin

-- Question 3: Which car origin produces the most fuel-efficient vehicles for different cylinder counts?
-- Analyze efficiency by origin and cylinder configuration
-- Only including groups with sufficient sample size (5+ cars)
SELECT 
    origin,                        -- Group results by country of origin
    cylinders,                     -- Further group by number of cylinders
    COUNT(*) AS car_count,         -- Count number of cars in each group
    MIN(mpg) AS min_mpg,           -- Find the minimum MPG in each group
    MAX(mpg) AS max_mpg,           -- Find the maximum MPG in each group
    AVG(mpg) AS avg_mpg            -- Calculate the average MPG for each group
FROM 
    cars
WHERE 
    mpg BETWEEN 10 AND 50          -- Filter out potential data errors or outliers
GROUP BY 
    origin, cylinders              -- Group by both origin and cylinder count
HAVING 
    COUNT(*) >= 5                  -- Only include groups with at least 5 cars for statistical relevance
ORDER BY 
    cylinders, avg_mpg DESC;       -- Sort by cylinder count, then by average MPG (highest first)