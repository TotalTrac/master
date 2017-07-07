SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CalculateCoordinateProximityKilometers]
	@Latitude1	decimal(18,8),
	@Longitude1 decimal(18,8),
	@Latitude2	decimal(18,8),
	@Longitude2 decimal(18,8)	
AS
BEGIN
	
    
	SELECT CONVERT(decimal(35,20), 6371 * ACOS(SIN(RADIANS( @Latitude1 )) * SIN(RADIANS( @Latitude2 )) + COS(RADIANS( @Latitude1 )) * COS(RADIANS( @Latitude2 )) * COS(RADIANS( @Longitude2 ) - RADIANS( @Longitude1 ))));
		
END
GO