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

/* Total Cases VS Population
   - Show what percentage of population got Covid-19 in United States
*/
SELECT location, date, population, total_cases, (total_cases/population) * 100 AS infected_population_percentage
FROM covid_death
WHERE location LIKE '%states%'
ORDER BY 1, 2;

/* Countries Infection Rate compared to Population*/
SELECT location, population, MAX(total_cases) AS highest_infection_count,
       MAX(total_cases/population) * 100 AS infected_population_percentage
FROM covid_death
GROUP BY location, population
ORDER BY infected_population_percentage DESC;

/* Countries with Highest Death Count Compared to Population*/
SELECT location, MAX(total_deaths) AS total_death_count
FROM covid_death
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY total_death_count DESC;

/* Continent with Highest Death Count Compared to Population*/
SELECT location, MAX(total_deaths) AS total_death_count
FROM covid_death
WHERE continent IS NULL
GROUP BY location
ORDER BY total_death_count DESC;