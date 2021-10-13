use Bus;
go
-- Selects: Order by, Distinct, Where (is null, is not null, between, like) group by (avg, count, sum, max, min) Joins 

-- Drivers ordered by name
SELECT 
		ID, Name 
FROM 
		Driver
ORDER BY
	Name

-- Routes not duplicated
SELECT DISTINCT TOP(10)
		ID_ROUTE, ID_journey
FROM
		Route_journey

-- Towns without Garage
SELECT
		Town.Name as Towns_without_garage
FROM
		Town
FULL JOIN Garage ON (TOWN.ID = GARAGE.ID_town)
WHERE GARAGE.Name IS NULL

-- Towns with Garage
SELECT
		Town.Name as Towns_with_garage, count(Town.name) as Garages
FROM
		Town
FULL JOIN Garage ON (TOWN.ID = GARAGE.ID_town)
WHERE GARAGE.Name IS NOT NULL
Group by
		Town.Name

-- Total of passengers by Route
Select 
		Route.Name,
		sum(route_log.pass_average) as Total	
FROM
		Route_log
		LEFT JOIN ROUTE ON (ROUTE_LOG.ID_route = ROUTE.ID)
GROUP BY 
		Route.Name
Order By Total 

-- Total of passengers by Date
Select 
		route_log.Date,
		sum(route_log.pass_average)	as Total
		
FROM
		Route_log
		LEFT JOIN ROUTE ON (ROUTE_LOG.ID_route = ROUTE.ID)
GROUP BY 
		Route_log.date
Order by Total Desc

-- Attempt to concatenate many to one, this is deprecated so use the query above.
Select
		Journey.Name,
		Routes = STUFF ( 
					( SELECT ',' + Route.Name 
					From Route r1 
					Left join Route_journey rj2 on (r1.id = rj2.ID_route)
					where rj1.ID_route = rj2.ID_route
					FOR XML PATH('')
					), 1 , 1, '')
FROM Route_journey rj1
		Left join Journey ON (rj1.ID_journey = Journey.ID)
		Left join Route ON (rj1.ID_route = Route.ID)
WHERE rj1.ID_journey = 4

-- String_AGG to concatenate in a many to one relationship
Select
		Journey.Name,
		STRING_AGG(Route.Name, ', ') as Routes
FROM Route_journey rj1
		Left join Journey ON (rj1.ID_journey = Journey.ID)
		Left join Route ON (rj1.ID_route = Route.ID)
Group By Journey.Name

-- Show info of only one ID
Select * from Route_journey rj
left join Journey j on (rj.ID_journey = j.ID)
left join Route r on (rj.ID_route = r.ID)
where rj.ID_journey = 4


