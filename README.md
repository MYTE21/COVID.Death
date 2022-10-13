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

## Goals

This project's primary goals include:

* Exploring and analyzing the global dataset of deaths caused by the Coronavirus (COVID-19).
* Constructing an interactive dashboard to show the global impact of the Coronavirus (COVID-19).
* We'll be dealing with a Covid-19 dataset. MySql for database exploration, analysis, and producing datasets for display. Tableau for dashboard.

Main focus points of this project is -

* Exploring and analysing the global dataset - [Coronavirus (COVID-19) Deaths](https://ourworldindata.org/covid-deaths).
* Creating interactive dashboard to visualize the effects of Coronavirus (COVID - 19) throughout the world.

## Initial Setup

* We will be working on a Covid-19 dataset.
  [Coronavirus (COVID-19) Deaths](https://ourworldindata.org/covid-deaths)
* MySql for exploring, analysing and generating dataset for visualization.
* Tableau for dashboard.

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
