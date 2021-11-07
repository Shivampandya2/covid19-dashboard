Select * 
From portfolio_project_1..Covid_deaths$
Where continent is not null 
order by 3,4

--Select *
--From portfolio_project_1..Covid_vaccinations
--order by 3,4

--Select Data that I am going to use
Select location, date, total_cases, new_cases, total_deaths, population
From portfolio_project_1..Covid_deaths$
Where continent is not null 
Order by 1,2


--Looking at total cases vs total deaths 
--Shows the likelihood of dying if you get Covid
Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as Death_percentage
From portfolio_project_1..Covid_deaths$
Where continent is not null 
Where location like '%Canada%'
Order by 1,2


--Looking at total cases vs population 
--shows the % of pop get covid
Select location, date, total_cases, total_deaths, (total_cases/population)*100 as covid_infection_rate
From portfolio_project_1..Covid_deaths$
Where continent is not null 
--Where location like '%Canada%'
Order by 1,2

--looking at conuntries with max covid_infection_rate
Select location, population, MAX (total_cases) as HighestInfectionCount, Max((total_cases/population)*100) as covid_infection_rate
From portfolio_project_1..Covid_deaths$
--Where location like '%Canada%'
Where continent is not null 
Group by location, population 
Order by covid_infection_rate desc


--Showing continents with highest deathcounts 
Select location, MAX (cast (total_deaths as int)) as death_Count 
From portfolio_project_1..Covid_deaths$
--Where location like '%India%'
Where continent is null 
Group by location
Order by death_Count desc

--Showing countries with highest deathcounts 
Select location, MAX (cast (total_deaths as int)) as death_Count 
From portfolio_project_1..Covid_deaths$
--Where location like '%India%'
Where continent is not null 
Group by location
Order by death_Count desc

--Break down continents 

--Showing continents with highest counts 
Select continent, MAX (cast (total_deaths as int)) as death_Count 
From portfolio_project_1..Covid_deaths$
--Where location like '%India%'
Where continent is not null 
Group by continent
Order by death_Count desc

--Global Numbers
Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From portfolio_project_1..Covid_deaths$
--Where location like '%states%'
where continent is not null 
--Group By date
order by 1,2



