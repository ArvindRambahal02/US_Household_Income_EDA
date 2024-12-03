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

# Exploratory Data Analysis (EDA)
* Explored the relationship between US household income, state demographics, and land/water area.
* Exploring Area Land and Area water for each state
  - Sum of ALand
       - Top 5 states with the largest sum of Area Land. These states have large land.
       - Alaska, Texas, Oregon, California, Montana
   
  - Sum of AWwater
       - Top 5 states with the largest sum of Area Water. These states have lots of water (rivers, streams, etc.)
       - Alaska, Michigan, Texas, Florida, Hawaii
   
* Average houseehold income for each state
     - States with the highest average income
          - District of Columnbia: $90,668.4
          - Connecticut          : $89,732.8
          - New Jersey           : $89,565.4
          - Maryland             : $88,444.2
          - Massachusetts        : $85,645.7

     - States with the highest median income
          - New Jersey   : $126,972.7
          - Connecticut  : $121,240.4
          - Massachusetts: $119,074.4
          - Wyoming      : $118,339.1
          - Maryland     : $114,969.2
These states have households making lots of money
