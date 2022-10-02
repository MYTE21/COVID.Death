# Use the `covid` database
USE covid;

# Total Population VS Vaccinations
SELECT cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations,
       SUM(cv.new_vaccinations) OVER (PARTITION BY cd.location ORDER BY cd.location, cd.date)
           AS rolling_people_vaccination
FROM covid_death cd
JOIN covid_vaccination cv
    ON cd.location = cv.location AND cd.date = cv.date
WHERE cd.continent IS NOT NULL
ORDER BY 2, 3;

# Use CTE
WITH pop_vs_vac
AS (
    SELECT cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations,
       SUM(cv.new_vaccinations) OVER (PARTITION BY cd.location ORDER BY cd.location, cd.date)
           AS rolling_people_vaccination
    FROM covid_death cd
    JOIN covid_vaccination cv
        ON cd.location = cv.location AND cd.date = cv.date
    WHERE cd.continent IS NOT NULL
)
SELECT *, (rolling_people_vaccination / population) * 100
FROM pop_vs_vac;

# Temp Table
DROP TABLE IF EXISTS percent_population_vaccinated;
CREATE TABLE percent_population_vaccinated
(
    continent NVARCHAR(255),
    location NVARCHAR(255),
    date DATETIME,
    population NUMERIC,
    new_vaccinations NUMERIC,
    rolling_people_vaccination NUMERIC
);

# ! ERROR: Getting Error message - "Data truncation: Out of range value for column 'rolling_people_vaccination' at row 215965"
INSERT INTO percent_population_vaccinated
SELECT cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations,
       SUM(cv.new_vaccinations) OVER (PARTITION BY cd.location ORDER BY cd.location, cd.date)
           AS rolling_people_vaccination
FROM covid_death cd
JOIN covid_vaccination cv
    ON cd.location = cv.location AND cd.date = cv.date;

SELECT *, (rolling_people_vaccination / population) * 100
FROM percent_population_vaccinated;

