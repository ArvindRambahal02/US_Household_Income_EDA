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
