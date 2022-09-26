# Create Database covid
CREATE DATABASE covid;

# Use the 'covid' database
USE covid;

# Show first 10 rows of owid_covid_data
SELECT *
FROM owid_covid_data
LIMIT 11;

# Description of the 'owid_covid_data' table
DESCRIBE owid_covid_data;