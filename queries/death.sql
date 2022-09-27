# Use the `covid` database
USE covid;

/* Show `covid_death` table
   Sort the data with `location` and `date` columns
 */
SELECT *
FROM covid_death
ORDER BY 3, 4;

/* Select `location`, `date`, `total_cases`, `new_cases`, `total_deaths` and `population`
   from the table `covid_death`
 */
SELECT location, date, total_cases, new_cases, total_deaths, population
FROM covid_death
ORDER BY 1, 2;