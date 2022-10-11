# Queries for Tableau Visualization

# Use the `covid` database
USE covid;

# NO 1: Death Percentage of Covid-19
SELECT SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths,
       SUM(new_deaths)/SUM(new_cases) * 100 AS death_percentage
FROM covid_death
WHERE continent IS NOT NULL
ORDER BY 1, 2;

# NO 2: Total death count in the continents
SELECT location, SUM(new_deaths) AS total_death_count
FROM covid_death
WHERE continent IS NULL
  AND location NOT IN ('European Union', 'High income', 'International', 'Low income',
                       'Lower middle income', 'Upper middle income', 'World')
GROUP BY location
ORDER BY total_death_count DESC;

# NO 3: Height infection and infection percentage of Covid-19 considering location
SELECT location, population, MAX(total_cases) AS higest_infection_count,
       MAX(total_cases / population) * 100 AS percent_population_infected
FROM covid_death
GROUP BY location, population
ORDER BY percent_population_infected DESC;

# NO 4: Height infection and infection percentage of Covid-19 considering location with date
SELECT location, population, date, MAX(total_cases) AS highest_infection_count,
       MAX(total_cases / covid_death.population) * 100 AS percent_population_indected
FROM covid_death
GROUP BY location, population, date
ORDER BY percent_population_indected DESC;