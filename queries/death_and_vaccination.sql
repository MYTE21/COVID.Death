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

# Use CTE: Common Table Expression
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
SELECT *, (rolling_people_vaccination / population) * 100 AS percent_population_vaccinated
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
    rolling_people_vaccination DOUBLE
);

# Insert into the created table
INSERT INTO percent_population_vaccinated
SELECT cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations,
       SUM(CAST(cv.new_vaccinations AS DOUBLE)) OVER (PARTITION BY cd.location ORDER BY cd.location, cd.date)
           AS rolling_people_vaccination
FROM covid_death cd
JOIN covid_vaccination cv
    ON cd.location = cv.location AND cd.date = cv.date;

# Show the table
SELECT *, (rolling_people_vaccination / population) * 100 AS percent_population_vaccinated
FROM percent_population_vaccinated;

# Creating view to store data for later visualization
CREATE VIEW percent_population_vaccinated_view AS
    SELECT cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations,
        SUM(CAST(cv.new_vaccinations AS DOUBLE )) OVER (PARTITION BY cd.location ORDER BY cd.location, cd.date)
           AS rolling_people_vaccination
    FROM covid_death cd
    JOIN covid_vaccination cv
        ON cd.location = cv.location AND cd.date = cv.date
    WHERE cd.continent IS NOT NULL;