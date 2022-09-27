# Use the `covid` database
USE covid;

# Show `covid_vaccination` table
# Sort the data with `location` and `date` columns
SELECT *
FROM covid_vaccination
ORDER BY 3, 4;