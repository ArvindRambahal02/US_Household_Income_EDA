# US Household Income Data Cleaning
SELECT *
FROM us_income_project.us_household_income;

SELECT *
FROM us_income_project.us_household_income_statistics;

# Rename id column in income statistics table
ALTER TABLE us_household_income_statistics RENAME COLUMN `ï»¿id` TO `id`;

# Count rows in both tables
SELECT COUNT(id)
FROM us_income_project.us_household_income;

SELECT COUNT(id)
FROM us_income_project.us_household_income_statistics;

# Determine if there are duplicate rows
SELECT id, COUNT(id)
FROM us_income_project.us_household_income
GROUP BY id
HAVING COUNT(id) > 1
;

# Identify duplicate rows
SELECT *
FROM (
	SELECT row_id, id,
	ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) row_num
	FROM us_income_project.us_household_income
) AS duplicates
WHERE row_num > 1;

# Delete duplicates rows
DELETE FROM us_household_income
WHERE row_id IN (
	SELECT row_id
	FROM (
		SELECT row_id, id,
		ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) row_num
		FROM us_income_project.us_household_income
	) AS duplicates
WHERE row_num > 1
);

# Check for duplicates in the income statistics data
# (no duplicates)
SELECT id, COUNT(id)
FROM us_income_project.us_household_income_statistics
GROUP BY id
HAVING COUNT(id) > 1
;

# Some state names are spelled incorrectly
# Different letter case, spelling, etc.
# (It seems MySQL is fixing some mistakes in the State Name on its own)
SELECT State_Name, COUNT(State_Name)
FROM us_income_project.us_household_income
GROUP BY State_Name
;

# Look at DISTINCT State Names
SELECT DISTINCT State_Name, COUNT(State_Name)
FROM us_income_project.us_household_income
GROUP BY State_Name
;

# Fix Georgia state name
UPDATE us_income_project.us_household_income
SET State_Name = 'Georgia'
WHERE State_Name = 'georia';

# Fix Alabama state name
UPDATE us_income_project.us_household_income
SET State_Name = 'Alabama'
WHERE State_Name = 'alabama';

# State abbreviations
SELECT DISTINCT State_ab
FROM us_income_project.us_household_income
ORDER BY State_ab
;

# Identify empty space in Place column
SELECT *
FROM us_income_project.us_household_income
WHERE Place = ''
ORDER BY 1;

# Populate empty space
UPDATE us_household_income
SET Place = 'Autaugaville'
WHERE County = 'Autauga County'
AND City = 'Vinemont'
;

SELECT Type, COUNT(Type)
FROM us_income_project.us_household_income
GROUP BY Type
;

# Update Type Boroughs to Borough
UPDATE us_household_income
SET Type = 'Borough'
WHERE Type = 'Boroughs';

# Investigate ALand and AWater values
# There are some land with no water (rivers, etc.)
# There are some waters with no land
SELECT ALand, AWater
FROM us_income_project.us_household_income
WHERE AWater = 0 OR AWater = '' OR AWater IS NULL
;

SELECT ALand, AWater
FROM us_income_project.us_household_income
WHERE ALand = 0 OR ALand = '' OR ALand IS NULL
;