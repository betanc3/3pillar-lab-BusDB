-- CRUD

USE Bus;

GO
---------
-- Bus --
----------

-- Create --
CREATE PROCEDURE BusCreate
	   @LicensePlate varchar(50),
	   @Capacity int,
	   @Size varchar(50),
	   @BusType int,
	   @Route int
	 
AS
BEGIN
INSERT INTO [dbo].[Bus]
           ([licence_plate]
           ,[capacity]
           ,[size]
           ,[ID_type_bus]
           ,[ID_route])
    VALUES (
	   @LicensePlate,
	   @Capacity,
	   @Size,
	   @BusType,
	   @Route )
 
SET @LicensePlate = SCOPE_IDENTITY()
 
SELECT 
	   Capacity = @Capacity,
	   Size = @Size,
	   ID_type_bus = @BusType,
	   ID_route =@Route
FROM Bus 
WHERE  licence_plate = @LicensePlate
END

GO

-- Read --
CREATE PROC BusRead
    @LicensePlate varchar(50)
AS 
BEGIN 
    SELECT [licence_plate]
      ,[capacity]
      ,[size]
      ,[ID_type_bus]
      ,[ID_route]
  FROM [dbo].[Bus]
    WHERE  (licence_plate = @LicensePlate) 
END

GO

-- Update --
CREATE PROC BusUpdate
	   @LicensePlate varchar(50),
	   @Capacity int,
	   @Size varchar(50),
	   @BusType int,
	   @Route int
  
AS 
BEGIN 
 
UPDATE Bus
SET  
	   Capacity = @Capacity,
	   Size = @Size,
	   ID_type_bus = @BusType,
	   ID_route =@Route
WHERE  licence_plate = @LicensePlate
END

GO

-- Delete --
CREATE PROC BusDelete
    @LicensePlate varchar(50)
AS 
BEGIN 
DELETE
FROM   Bus
WHERE  licence_plate = @LicensePlate
 
END

GO

--------------
--- Driver ---
--------------

-- Create --
CREATE PROCEDURE DriverCreate
	   @ID int,
	   @Name varchar(50),
	   @Address varchar(100),
	   @Telephone varchar(50),
	   @Journey int
	 
AS
BEGIN
INSERT INTO [dbo].[Driver]
           ([Name]
           ,[Address]
           ,[Telephone]
           ,[ID_journey])
    VALUES (
	   @Name ,
	   @Address ,
	   @Telephone ,
	   @Journey )
 
SET @ID = SCOPE_IDENTITY()
 
SELECT 
	   [Name] = @Name,
	   [Address] = @Address,
	   Telephone = @Telephone,
	   ID_journey =@Journey
FROM Driver 
WHERE  ID = @ID
END

GO

-- Read --
CREATE PROC DriverRead
    @ID int
AS 
BEGIN 
    SELECT 
		    [ID]
           ,[Name]
           ,[Address]
           ,[Telephone]
           ,[ID_journey]
  FROM [dbo].[Driver]
    WHERE  (ID = @ID) 
END

GO

-- Update --
CREATE PROC DriverUpdate
	   @ID int,
	   @Name varchar(50),
	   @Address varchar(100),
	   @Telephone varchar(50),
	   @Journey int
  
AS 
BEGIN 
 
UPDATE Driver
SET  
	   [Name] = @Name,
	   [Address] = @Address,
	   Telephone = @Telephone,
	   ID_journey =@Journey
WHERE  ID = @ID
END

GO

-- Delete --
CREATE PROC DriverDelete
    @ID int
AS 
BEGIN 
DELETE
FROM   Driver
WHERE  ID = @ID
 
END

GO
--------------
--- Garage ---
--------------

-- Create --
CREATE PROCEDURE GarageCreate
	   @ID int,
	   @Name varchar(50),
	   @Capacity int,
	   @Town int
	 
AS
BEGIN
INSERT INTO [dbo].[Garage]
           ([Name]
           ,[Capacity]
           ,[ID_town])
    VALUES (
	   @Name ,
	   @Capacity ,
	   @Town)
 
SET @ID = SCOPE_IDENTITY()
 
SELECT 
	   [Name] = @Name,
	   Capacity = @Capacity,
	   ID_Town = @Town
FROM Garage 
WHERE  ID = @ID
END

GO

-- Read --
CREATE PROC GarageRead
    @ID int
AS 
BEGIN 
    SELECT 
		    [ID]
           ,[Name]
           ,[Capacity]
           ,[ID_Town]
  FROM [dbo].[Garage]
    WHERE  (ID = @ID) 
END

GO

-- Update --
CREATE PROC GarageUpdate
	   @ID int,
	   @Name varchar(50),
	   @Capacity int,
	   @Town int
  
AS 
BEGIN 
 
UPDATE Garage
SET  
	   [Name] = @Name,
	   Capacity = @Capacity,
	   ID_town = @Town
WHERE  ID = @ID
END

GO

-- Delete --
CREATE PROC GarageDelete
    @ID int
AS 
BEGIN 
DELETE
FROM   Garage
WHERE  ID = @ID
 
END

GO

--------------
--- Journey --
--------------

-- Create --
CREATE PROCEDURE JourneyCreate
	   @ID int,
	   @Name varchar(50)
	 
AS
BEGIN
INSERT INTO [dbo].[Journey]
           ([Name])
    VALUES (
	   @Name )
 
SET @ID = SCOPE_IDENTITY()
 
SELECT 
	   [Name] = @Name
FROM Journey 
WHERE  ID = @ID
END

GO

-- Read --
CREATE PROC JourneyRead
    @ID int
AS 
BEGIN 
    SELECT 
		    [ID]
           ,[Name]
  FROM [dbo].[Journey]
    WHERE  (ID = @ID) 
END

GO

-- Update --
CREATE PROC JourneyUpdate
	   @ID int,
	   @Name varchar(50)
  
AS 
BEGIN 
 
UPDATE Journey
SET  
	   [Name] = @Name
WHERE  ID = @ID
END

GO

-- Delete --
CREATE PROC JourneyDelete
    @ID int
AS 
BEGIN 
DELETE
FROM   Journey
WHERE  ID = @ID
 
END

GO

--------------
--JourneyTown-
--------------

-- Create --
CREATE PROCEDURE JTCreate
	   @IDTown int,
	   @IDJourney int
	 
AS
BEGIN
INSERT INTO [dbo].[Journey_town]
           ([ID_town]
		   ,[ID_journey])
    VALUES (
	   @IDTown
	   ,@IDJourney)
 
SET @IDJourney = SCOPE_IDENTITY()
 
SELECT 
	   ID_journey,
	   ID_town = @IDTown
FROM Journey_town
WHERE  ID_journey = @IDJourney
END

GO

-- Read --
CREATE PROC JTRead
    @IDJourney int
AS 
BEGIN 
    SELECT 
		    [ID_journey],
            [ID_town]
  FROM [dbo].[Journey_town]
    WHERE  (ID_journey = @IDJourney) 
END

GO

-- Update --
CREATE PROC JTUpdate
	   @IDTown int,
	   @IDJourney int
  
AS 
BEGIN 
 
UPDATE Journey_town
SET  
	   [ID_town] = @IDTown
WHERE  ID_journey = @IDJourney
END

GO

-- Delete --
CREATE PROC JTDelete
    @IDTown int,
	@IDJourney int
AS 
BEGIN 
DELETE
FROM   Journey_town
WHERE  ID_journey = @IDJourney and ID_town = @IDTown
 
END

GO
--------------
--- Route ----
--------------

-- Create --
CREATE PROCEDURE RouteCreate
	   @ID int,
	   @Name varchar(50),
	   @Description varchar(100)
	 
AS
BEGIN
INSERT INTO [dbo].[Route]
           ([Name]
           ,[Description])
    VALUES (
	   @Name ,
	   @Description)
 
SET @ID = SCOPE_IDENTITY()
 
SELECT 
	   [Name] = @Name,
	   [Descripton] = @Description
FROM Route
WHERE  ID = @ID
END

GO

-- Read --
CREATE PROC RouteRead
    @ID int
AS 
BEGIN 
    SELECT 
		    [ID]
           ,[Name]
           ,[Description]
  FROM [dbo].[Route]
    WHERE  (ID = @ID) 
END

GO

-- Update --
CREATE PROC RouteUpdate
	   @ID int,
	   @Name varchar(50),
	   @Description varchar(100)
  
AS 
BEGIN 
 
UPDATE Route
SET  
	   [Name] = @Name,
	   [Description] = @Description
WHERE  ID = @ID
END

GO

-- Delete --
CREATE PROC RouteDelete
    @ID int
AS 
BEGIN 
DELETE
FROM   Route
WHERE  ID = @ID
 
END

GO

--------------
--RouteJourney
--------------

-- Create --
CREATE PROCEDURE RJCreate
	   @IDRoute int,
	   @IDJourney int
	 
AS
BEGIN
INSERT INTO [dbo].[Route_journey]
           ([ID_route]
		   ,[ID_journey])
    VALUES (
	   @IDRoute
	   ,@IDJourney)
 
SET @IDJourney = SCOPE_IDENTITY()
 
SELECT 
	   ID_journey,
	   ID_route = @IDRoute
FROM Route_journey
WHERE  ID_journey = @IDJourney
END

GO

-- Read --
CREATE PROC RJRead
    @IDJourney int
AS 
BEGIN 
    SELECT 
		    [ID_journey],
            [ID_route]
  FROM [dbo].[Route_journey]
    WHERE  (ID_journey = @IDJourney) 
END

GO

-- Update --
CREATE PROC RJUpdate
	   @IDRoute int,
	   @IDJourney int
  
AS 
BEGIN 
 
UPDATE Route_journey
SET  
	   [ID_route] = @IDRoute
WHERE  ID_journey = @IDJourney
END

GO

-- Delete --
CREATE PROC RJDelete
    @IDRoute int,
	@IDJourney int
AS 
BEGIN 
DELETE
FROM   Route_journey
WHERE  ID_journey = @IDJourney and ID_route = @IDRoute
 
END

GO
--------------
--- RouteLog -
--------------

-- Create --
CREATE PROCEDURE RLogCreate
	   @ID int,
	   @PassAvg int,
	   @Date date,
	   @Route int
	 
AS
BEGIN
INSERT INTO [dbo].[Route_log]
           ([pass_average]
           ,[Date]
           ,[ID_route])
    VALUES (
	   @PassAvg ,
	   @Date ,
	   @Route)
 
SET @ID = SCOPE_IDENTITY()
 
SELECT 
	   pass_average = @PassAvg,
	   [Date] = @Date,
	   ID_route = @Route
FROM Route_log
WHERE  ID = @ID
END

GO

-- Read --
CREATE PROC RLogRead
    @ID int
AS 
BEGIN 
    SELECT 
		    [ID]
           ,[pass_average]
           ,[Date]
           ,[ID_route]
  FROM [dbo].[Route_log]
    WHERE  (ID = @ID) 
END

GO

-- Update --
CREATE PROC RLogUpdate
	   @ID int,
	   @PassAvg int,
	   @Date date,
	   @Route int
  
AS 
BEGIN 
 
UPDATE Route_log
SET  
	   pass_average = @PassAvg,
	   [Date] = @Date,
	   ID_route = @Route
WHERE  ID = @ID
END

GO

-- Delete --
CREATE PROC RLogDelete
    @ID int
AS 
BEGIN 
DELETE
FROM   Route_log
WHERE  ID = @ID
 
END

GO

--------------
--- Town -----
--------------

-- Create --
CREATE PROCEDURE TownCreate
	   @ID int,
	   @Name varchar(50)
	 
AS
BEGIN
INSERT INTO [dbo].[Town]
           ([Name])
    VALUES (
	   @Name )
 
SET @ID = SCOPE_IDENTITY()
 
SELECT 
	   [Name] = @Name
FROM Town
WHERE  ID = @ID
END

GO

-- Read --
CREATE PROC TownRead
    @ID int
AS 
BEGIN 
    SELECT 
		    [ID]
           ,[Name]
  FROM [dbo].[Town]
    WHERE  (ID = @ID) 
END

GO

-- Update --
CREATE PROC TownUpdate
	   @ID int,
	   @Name varchar(50)
  
AS 
BEGIN 
 
UPDATE Town
SET  
	   [Name] = @Name
WHERE  ID = @ID
END

GO

-- Delete --
CREATE PROC TownDelete
    @ID int
AS 
BEGIN 
DELETE
FROM   Town
WHERE  ID = @ID
 
END

GO
--------------
----TypeBus---
--------------

-- Create --
CREATE PROCEDURE TypeBusCreate
	   @ID int,
	   @Description varchar(100)
	 
AS
BEGIN
INSERT INTO [dbo].[Type_bus]
           ([Description])
    VALUES (
	   @Description )
 
SET @ID = SCOPE_IDENTITY()
 
SELECT 
	   [Description] = @Description
FROM Type_bus
WHERE  ID = @ID
END

GO

-- Read --
CREATE PROC TypeBusRead
    @ID int
AS 
BEGIN 
    SELECT 
		    [ID]
           ,[Description]
  FROM [dbo].[Type_bus]
    WHERE  (ID = @ID) 
END

GO

-- Update --
CREATE PROC TypeBusUpdate
	   @ID int,
	   @Description varchar(100)
  
AS 
BEGIN 
 
UPDATE Type_bus
SET  
	   [Description] = @Description
WHERE  ID = @ID
END

GO

-- Delete --
CREATE PROC TypeBusDelete
    @ID int
AS 
BEGIN 
DELETE
FROM   Type_bus
WHERE  ID = @ID
 
END
