﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[WarehouseLocationsGet]
	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT 
		LOCATION_ID
		, LOCATION_DESCRIPTION
		, LOCATION_HORIZONTALPOS
		, LOCATION_SHELFID
		, LOCATION_ROWVERSION
	FROM 
		WarehouseLocations;
END
GO