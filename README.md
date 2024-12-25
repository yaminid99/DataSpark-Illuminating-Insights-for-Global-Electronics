Project title:
DataSpark: Illuminating Insights for Global Electronics

Author: Yamini Devi

Tools/software used : Python, SQL, Microsoft Power BI

Project Overview
This project involves a comprehensive process of cleaning, merging, and analyzing customer, sales, exchange rate, and store data. Below is a detailed step-by-step guide of the workflow followed:

Step 0: Collecting all the files
Create folder with all the csv files to run the python file in the same folder


------------Run 'Data Cleaning and Pushing to SQL.ipynb'-----------------

Step 1: Data Cleaning
Reading the Data:
Utilizing Python and Pandas to read the CSV files for customers, sales, exchange rates, and stores.
Handling Missing Values:
Identifying and filled null values using appropriate methods.
Data Type Conversion:
Converting columns to their respective data types (e.g., dates, integers, floats).


Step 2: Data Merging
Merging Datasets:
Merging all cleaned data into a single DataFrame using the Pandas merge function with the inner join method.


Step 3: Uploading Data to SQL
Connecting to SQL Database:
Establishing a connection to the SQL database using SQLAlchemy.
Pushing Data to SQL:
Pushing the cleaned and merged DataFrame to the SQL database named capstone.

---------------- Run 'SQL_analysis' in MySQL ------------------

Step 4: Data Analysis with SQL
Writing SQL Queries:
Creating SQL queries to analyze customer, sales, product, and store data.


--------------- Run 'Capstone_2' in Microsoft Power BI----------------------

Step 5: Data Visualization with Power BI
Uploading Queries:
Uploading the results of each SQL query into Power BI.
Creating Visualizations:
Creating visualizations to present insights from the data analysis.
