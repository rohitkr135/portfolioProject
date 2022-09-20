select *
from portfolio..[coviddeaths\]
order by 3,4

select location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as percent_death
from portfolio..[coviddeaths\]
where location like '%india%'
order by 1,2

select location,date,total_cases,population,(total_cases/population)*100 as percent_infected
from portfolio..[coviddeaths\]
where location like '%india%'
order by 1,2

select location,max(total_cases) as highest_infection,population,(max(total_cases)/population)*100 as max_percent_infected
from portfolio..[coviddeaths\]
group by location,population
--having location like '%india%'
order by 4 desc


select location,population,max(total_deaths) as highest_death_count,(max(total_deaths)/population)*100 as max_percent_death
from portfolio..[coviddeaths\]
group by location,population
--having location like '%india%'
order by 3 desc



select location,population,max(cast(total_deaths as int)) as highest_death_count,(max(total_deaths)/population)*100 as max_percent_death
from portfolio..[coviddeaths\]
where continent is not null
group by location,population
--having location like '%india%'
order by 3 desc

select continent,max(total_deaths) as highest_death_count
from portfolio..[coviddeaths\]
where continent is not null
group by continent
order by 2 desc


select date,sum(total_cases) as totalCases,sum(cast(total_deaths as int)) as TotalDeaths,sum(cast(total_deaths as int))/sum(total_cases)*100 as percent_death_across_world
from portfolio..[coviddeaths\]
where continent is not null --if you dont write this then it will show error bcz continent contain null value for some value of its location so it is not able to recoznize
-- whre to combine all these numbers , there is no null value in loaction column
group by date
order by 1,2

select *
from portfolio..[covid vaccine]
order by 3,4

select continent,location,date,population,new_vaccinations
from portfolio..[covid vaccine]
where continent is not null
order by location,date


--lets join two table
select dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations
from portfolio..[coviddeaths\] dea
join portfolio..[covid vaccine] vac
on dea.location=vac.location
and dea.date=vac.date
order by 2,3
