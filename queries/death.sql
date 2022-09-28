# Use the `covid` database
USE covid;

/* Show `covid_death` table
   Sort the data with `location` and `date` columns
 */
SELECT *
FROM covid_death
ORDER BY 3, 4;

/* Select `location`, `date`, `total_cases`, `new_cases`, `total_deaths` and `population`
   from the table `covid_death`.
   Sorted by `location` and `date`.
 */
SELECT location, date, total_cases, new_cases, total_deaths, population
FROM covid_death
ORDER BY 1, 2;

/* Total Cases VS Total Deaths
   - Show likelihood of dying if you contract Covid-19 in United States.
 */
SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases) * 100 AS death_percentage
FROM covid_death
WHERE location LIKE '%states%'
ORDER BY 1, 2;