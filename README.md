# COVID.Death

A contagious illness called `Coronavirus Disease (COVID-19)` is brought on by the `SARS-CoV-2 Virus`.
Most COVID-19 patients experience mild to moderate symptoms and recover without special treatment.
However, some will become seriously ill and require medical attention. [🔗](https://en.wikipedia.org/wiki/COVID-19)

The global dataset of the `Coronavirus Disease (COVID-19)` is examined in this study with the major focuses being on
`mortality` and `vaccination`. By the project's conclusion, it will be possible to display a variety of elements relating
to humans and the Coronavirus, including effects, comparisons, time-series, and many more.
<a href="https://public.tableau.com/app/profile/myte/viz/Covid-19InfectedPopulation/Dashboard1">
![dashboard.png](assets/dashboard.png)
</a>

**Dataset:** [Coronavirus (COVID-19) Deaths 🔗](https://ourworldindata.org/covid-deaths)

## Goals
The main objectives of this project include:
1. `Exploring` and `Analyzing` the global dataset Coronavirus.
2. Constructing an `Interactive Dashboard` to display the Coronavirus's global impact.

## Used Technologies
* `MySql`: Exploring, analysing and generating dataset for visualization.
* `Tableau`: Creating dashboard.

## Description
Querying and visualization make up the two sections of this project. It is handled separately for each part. 
The SQL files `introduction.sql`, `death.sql`, `vaccination.sql`, and `death_and_vaccination.sql` provide the queries 
for data exploration. To generate the resources required for data visualization, there is one more file named 
`tableau.sql`. The original Tableau visualization file is available at this URL - [Tableau: Covid - 19 Infected 
Population](https://public.tableau.com/app/profile/myte/viz/Covid-19InfectedPopulation/Dashboard1). 
A discussion of additional details follows. So, let's get started.




















## Introduction [introduction.sql]

* Create Database called `covid`.
* Select `covid` database.
* Create table `owid_covid_data` from the  `owid_covid_data` csv dataset.
* Create description of the table and store it as a csv file named - `description_of_owid_covid_data.csv`.
* Create 2 tables form `owid_covid_data`
  * `covid_death` - Covid-19 Death
  * `covid_vaccination` - Covid-19 Vaccination

## Covid-19 Death [death.sql]

* Select `covid` database.
* Show `covid_death` table
* Select `location`, `date`, `total_cases`, `new_cases`, `total_deaths` and `population` for initial analysis.
* Total Cases VS Total Deaths
* Total Cases VS Population
* Countries Infection Rate compared to Population
* Countries with Highest Death Count Compared to Population
* Continents with Highest Death Count Compared to Population
* Global Cases and Deaths considering each date
* Global Total Death Percentage

## Covid-19 Vaccination [vaccination.sql]

* Select `covid` database.
