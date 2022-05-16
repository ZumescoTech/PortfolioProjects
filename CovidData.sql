select *
from PortfolioProject..CovidDeaths
order by 3,4

--select *
--from PortfolioProject..CovidVaccinations
--order by 3,4

--select the Data we are  going to be using

select location, date, total_cases,new_cases, total_deaths, population
from PortfolioProject..CovidDeaths
order by 1,2

--Total cases vs Total Deaths
--Shows likelihood of  dying if you contract covid in south africa

select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from PortfolioProject..CovidDeaths
Where location like '%south africa%'
order by 1,2

--looking at Total cases vs Population
--SHOWS what percentage of population got covid

select location, date, total_cases, population, (total_cases/population)*100 as CovidToPopulationPercentage
from PortfolioProject..CovidDeaths
Where location like '%south africa%'
order by 1,2

--Looking at countries with highest infaction rate compared to population

select location,max(total_cases)as HighestInfectionCount, max((total_cases/population))*100 as PercentagPopulationInfected
from PortfolioProject..CovidDeaths
--Where location like '%south africa%'
group by location, population
order by PercentagPopulationInfected desc

--Showing Countries with Highest Death Count per Population

select location,max(total_deaths) as TotalDeathCount
from PortfolioProject..CovidDeaths
where continent is not null
group by location
order by TotalDeathCount desc

--Showing death count per country in africa

select location, max(total_deaths) as TotalDeathCount
from PortfolioProject..CovidDeaths
where continent = 'africa'
group by location
order by TotalDeathCount DESC

--sHOWING FOR COUNTRY WITH HIGHEST DEATH PER INFACTION IN Africa

select location, max((total_deaths/total_cases) * 100) as DeathPerInfaction
from PortfolioProject..CovidDeaths
where continent = 'africa'
group by location
order by DeathPerInfaction desc

--Showing Vaccination Rate in Africa

select *
from PortfolioProject..CovidVaccinations
where continent = 'africa'

select location,max((total_vaccinations/population_density)*100) VaccinationPercentage
from PortfolioProject..CovidVaccinations
where continent = 'africa'
and total_vaccinations is not null
group by location

