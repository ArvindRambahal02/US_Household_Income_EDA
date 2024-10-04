# US Household Income EDA

SELECT *
FROM us_income_project.us_household_income;

SELECT *
FROM us_income_project.us_household_income_statistics;

# Exploring Area Land and Area Water for each State
# Sum of ALand and AWater

# Top 10 States with the largest Area of Land
SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_income_project.us_household_income
GROUP BY State_Name
ORDER BY 2 DESC
LIMIT 10;

# Top 10 States with the largest Area of Water
SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_income_project.us_household_income
GROUP BY State_Name
ORDER BY 3 DESC
LIMIT 10;

# Join demograpics table with income stats table
SELECT *
FROM us_income_project.us_household_income u
INNER JOIN us_income_project.us_household_income_statistics us
USING(id)
WHERE Mean <> 0;

# Top 5 states with the lowest average income
SELECT u.State_Name, ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_income_project.us_household_income u
INNER JOIN us_income_project.us_household_income_statistics us
USING(id)
WHERE Mean <> 0
GROUP BY u.State_Name
ORDER BY 2 ASC
LIMIT 5;

# Top 5 states with the highest average income
SELECT u.State_Name, ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_income_project.us_household_income u
INNER JOIN us_income_project.us_household_income_statistics us
USING(id)
WHERE Mean <> 0
GROUP BY u.State_Name
ORDER BY 2 DESC
LIMIT 5;

# States with the highest median household income
SELECT u.State_Name, ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_income_project.us_household_income u
INNER JOIN us_income_project.us_household_income_statistics us
USING(id)
WHERE Mean <> 0
GROUP BY u.State_Name
ORDER BY 3 DESC
LIMIT 5;

# States with the lowest median household income
SELECT u.State_Name, ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_income_project.us_household_income u
INNER JOIN us_income_project.us_household_income_statistics us
USING(id)
WHERE Mean <> 0
GROUP BY u.State_Name
ORDER BY 3 ASC
LIMIT 5;

# Removed outliers: low count Type
SELECT Type, COUNT(Type), ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_income_project.us_household_income u
INNER JOIN us_income_project.us_household_income_statistics us
USING(id)
WHERE Mean <> 0
GROUP BY Type
HAVING COUNT(Type) > 100
ORDER BY 4 DESC
LIMIT 20;

# Puerto Rico generally has low average salaries per household
SELECT *
FROM us_household_income
WHERE Type = 'Community';

# Look at salaries at the city level (according to the city)
SELECT u.State_Name, City, ROUND(AVG(Mean), 1) AS average_income
FROM us_income_project.us_household_income u
INNER JOIN us_income_project.us_household_income_statistics us
USING(id)
WHERE Mean <> 0
GROUP BY u.State_Name, City
ORDER BY ROUND(AVG(Mean), 1) DESC;