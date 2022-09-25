# Create Database covid
CREATE DATABASE covid;

# Use the 'covid' database
USE covid;

# Show first 10 rows of owid_covid_data
SELECT *
FROM owid_covid_data
LIMIT 11;