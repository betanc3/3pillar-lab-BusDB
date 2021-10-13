-- TEST --

USE Bus;

GO
---------
-- Bus --
----------

-- Create --
EXECUTE BusCreate
	   @LicensePlate = 'LKG-352',
	   @Capacity = 42,
	   @Size = 'Medium',
	   @BusType=6,
	   @Route=6

GO
-- Read --
EXECUTE BusRead
	   @LicensePlate = 'LKG-352'

GO
-- Update --
EXECUTE BusUpdate
	   @LicensePlate = 'LKG-352',
	   @Capacity = 40,
	   @Size = 'Medium',
	   @BusType=6,
	   @Route=6

GO
-- Delete --
EXECUTE BusDelete
	   @LicensePlate = 'LKG-352'

GO

--------------
--- Driver ---
--------------

-- Create --
EXECUTE DriverCreate
	   @Name = 'Joseph G.',
	   @Address = 'Bonavida 2456',
	   @Telephone ='0423526599',
	   @Journey =6,
	   @ID = 1
GO
-- Read --

EXECUTE DriverRead
	   @ID = 1006

GO

-- Update --
EXECUTE DriverUpdate
	   @Name = 'Luis Y.',
	   @Address = 'Bonavida 636',
	   @Telephone ='0424567659',
	   @Journey =4,
	   @ID = 3

GO
-- Delete --
EXECUTE DriverDelete
	   @ID = 1006

GO

--------------
--- Garage ---
--------------

-- Create --
EXECUTE GarageCreate
	   @Name = 'Visitator´s Lot',
	   @Capacity = 10,
	   @Town = 3,
	   @ID = 1
GO
-- Read --

EXECUTE GarageRead
	   @ID = 10

GO

-- Update --
EXECUTE GarageUpdate
	   @Name = 'Dreams Lot',
	   @Capacity = 15,
	   @Town = 4,
	   @ID = 10

GO
-- Delete --
EXECUTE GarageDelete
	   @ID = 3

GO
--------------
--- Journey --
--------------

-- Create --
EXECUTE JourneyCreate
	   @Name = 'DreamLand',
	   @ID = 1
GO
-- Read --

EXECUTE JourneyRead
	   @ID = 10

GO

-- Update --
EXECUTE JourneyUpdate
	   @Name = 'Basso-Oakland',
	   @ID = 10

GO
-- Delete --
EXECUTE JourneyDelete
	   @ID = 1

GO

--------------
--JourneyTown-
--------------

-- Create --
EXECUTE JTCreate
	   @IDTown = 4,
	   @IDJourney = 4
GO
-- Read --

EXECUTE JTRead
	   @IDJourney = 4

GO

-- Update --
EXECUTE JTUpdate
	   @IDTown = 4,
	   @IDJourney = 4

GO
-- Delete --
EXECUTE JTDelete
	   @IDTown = 4,
	   @IDJourney = 4

GO

--------------
--- Route ----
--------------

-- Create --
EXECUTE RouteCreate
	   @ID = 1,
	   @Name = 'Wonderland',
	   @Description = 'Way to wonderland'
GO
-- Read --

EXECUTE RouteRead
	   @ID = 7

GO

-- Update --
EXECUTE RouteUpdate
	   @ID = 7,
	   @Name = 'Mars',
	   @Description = 'Way to Mars'

GO
-- Delete --
EXECUTE RouteDelete
	   @ID = 3

GO
--------------
--RouteJourney
--------------

-- Create --
EXECUTE RJCreate
	   @IDRoute = 3,
	   @IDJourney = 4
GO
-- Read --

EXECUTE RJRead
	   @IDJourney = 4

GO

-- Update --
EXECUTE RJUpdate
	   @IDRoute = 7,
	   @IDJourney = 4

GO
-- Delete --
EXECUTE RJDelete
	   @IDRoute = 3,
	   @IDJourney = 4

GO
--------------
--- RouteLog -
--------------
select * from Route_log
-- Create --
EXECUTE RLogCreate
	   @ID = 1,
	   @PassAvg = 20,
	   @Date = '2021-10-13',
	   @Route = 5
GO
-- Read --

EXECUTE RLogRead
	   @ID = 3

GO

-- Update --
EXECUTE RLogUpdate
	   @ID = 7,
	   @PassAvg = 24,
	   @Date = '2021-10-14',
	   @Route = 8

GO
-- Delete --
EXECUTE RLogDelete
	   @ID = 5

GO
--------------
--- Town -----
--------------

-- Create --
EXECUTE TownCreate
	   @Name = '3Pillar',
	   @ID = 1
GO
-- Read --

EXECUTE TownRead
	   @ID = 10

GO

-- Update --
EXECUTE TownUpdate
	   @Name = 'Apprentice´s Town',
	   @ID = 8

GO
-- Delete --
EXECUTE TownDelete
	   @ID = 1

GO

--------------
----TypeBus---
--------------

-- Create --
EXECUTE TypeBusCreate
	   @Description = 'Global',
	   @ID = 1
GO
-- Read --

EXECUTE TypeBusRead
	   @ID = 3

GO

-- Update --
EXECUTE TypeBusUpdate
	   @Description = 'Pending',
	   @ID = 1

GO
-- Delete --
EXECUTE TypeBusDelete
	   @ID = 2

GO
