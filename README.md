# US_Household_Income_EDA
Exploratory Data Analysis on 2022 Household Income data

# About Project
* 2022 Demographic and statistical information on Household Income
* Demographic data includes things like: State_name, County, City, Area of Land, Area of Water, etc.
* Statistical data includes things like: mean income, median income, standard deviation income, etc.

# Importing Issues and fix
* It is possible you may experience importing issues if you use MySQL or a similar RDBMS.
* There was an issue when inporting the demograhics data.
* For example, when importing the Area of Land values and Area of Water values, MySQL by default imports it as an int in the Data Import Wizard.
* However, the values are extremely large integers, so in the Data Import Wizard, you must set these fields to the bigint data type.
* Afterwards all 32,532 rows should be imported.

# Data Cleaning process
1. Table Structure and Data Inspection
   - renamed the ï»¿id column in the us_household_income_statistics table to id for consistency.

2. Duplicate Row Identification and Removal:
   - identified duplicate rows based on the id column in the us_household_income table.
   - used a subquery and ROW_NUMBER() over partitions to identify the specific rows that are duplicates.
   - removed the duplicate rows based on row_id values obtained from the subquery.

3. Data Consistency and Correctness
   - Checked for duplicates in the us_household_income_statistics table (no duplicates found).
   - identified and corrected misspelled state names like "georia" and "alabama".
   - Used DISTINCT and ORDER BY to identify and standardize state abbreviations.
   - Identified and updates empty place values using information from County and City.
   - identified and corrected inconsistent type values like "Boroughs" to "Borough".

4. Data Completeness and Validity
   - identifed and analyzed potential inconsistencies in the ALand and AWater columns, such as rows with no water or land.
