-- Reporting --
use Bus;
go
-- Selects: Order by, Distinct, Where (is null, is not null, between, like) group by (avg, count, sum, max, min) Joins 

-- 1 Drivers ordered by name
SELECT ID, Name
FROM     Driver
ORDER BY Name
go
-- 2 Routes not duplicated
SELECT DISTINCT TOP (10) ID_route, ID_journey
FROM     Route_journey
go
-- 3 Towns without Garage
SELECT Town.Name AS Towns_without_garage
FROM     Town FULL OUTER JOIN
                  Garage ON Town.ID = Garage.ID_town
WHERE  (Garage.Name IS NULL)
go
-- 4 Towns with Garage
SELECT Town.Name AS Towns_with_garage, COUNT(Town.Name) AS Garages
FROM     Town FULL OUTER JOIN
                  Garage ON Town.ID = Garage.ID_town
WHERE  (Garage.Name IS NOT NULL)
GROUP BY Town.Name
go
-- 5 Total of passengers by Route
SELECT Route.Name, SUM(Route_log.pass_average) AS Total
FROM     Route_log LEFT OUTER JOIN
                  Route ON Route_log.ID_route = Route.ID
GROUP BY Route.Name
ORDER BY Total
go

-- 6 Total of passengers by Date
SELECT Route_log.Date, SUM(Route_log.pass_average) AS Total
FROM     Route_log LEFT OUTER JOIN
                  Route ON Route_log.ID_route = Route.ID
GROUP BY Route_log.Date
ORDER BY Total DESC
go

-- 7 Attempt to concatenate many to one, this is deprecated so use the query above.
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
go

-- 8 String_AGG to concatenate in a many to one relationship
SELECT Journey.Name, STRING_AGG(Route.Name, ', ') AS Routes
FROM     Route_journey AS rj1 LEFT OUTER JOIN
                  Journey ON rj1.ID_journey = Journey.ID LEFT OUTER JOIN
                  Route ON rj1.ID_route = Route.ID
GROUP BY Journey.Name
go

-- 9 Show info of only one ID
SELECT rj.ID_route, rj.ID_journey, j.ID, j.Name, r.ID AS Expr1, r.Name AS Expr2, r.Description
FROM     Route_journey AS rj LEFT OUTER JOIN
                  Journey AS j ON rj.ID_journey = j.ID LEFT OUTER JOIN
                  Route AS r ON rj.ID_route = r.ID
WHERE  (rj.ID_journey = 4)
go

-- 10 Count drivers
SELECT COUNT(ID) AS Expr1
FROM     Driver
go

-- 11 Driver name starts with J
SELECT d.ID, d.Name AS Driver, j.Name AS Journey
FROM     Driver AS d LEFT OUTER JOIN
                  Journey AS j ON d.ID_journey = j.ID
WHERE  (d.Name LIKE 'J%')
go

-- 12 Find busses with 2 matching characteristics
SELECT b.licence_plate, b.size, tb.Description
FROM     Bus AS b LEFT OUTER JOIN
                  Type_bus AS tb ON b.ID_type_bus = tb.ID
WHERE  (b.size = 'Small') AND (tb.Description = 'VIP')
go

-- 13 Max amount of passengers in x date
SELECT SUM(pass_average) AS Total, Date
FROM     Route_log
WHERE  (Date = '2021-07-01')
GROUP BY Date
go
-- 14 Day with more passengers
SELECT TOP (1) SUM(pass_average) AS Total, Date
FROM     Route_log
GROUP BY Date
ORDER BY Total DESC
go

-- 15 Average passengers in a month
SELECT AVG(pass_average) AS August
FROM     Route_log AS rl
WHERE  (Date LIKE '%-08-%')
go
-- 16 Number of Garage per town
SELECT t.Name AS Town, COUNT(g.ID) AS Total
FROM     Garage AS g LEFT OUTER JOIN
                  Town AS t ON g.ID_town = t.ID
GROUP BY t.Name
