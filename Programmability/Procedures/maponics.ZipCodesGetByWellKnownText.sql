﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [maponics].[ZipCodesGetByWellKnownText]
	@Wkt	varchar(MAX)
AS
BEGIN
	
	SET NOCOUNT ON;
	    
	SELECT
		ZIPCODE_ID
		, ZIPCODE_BOXES
		, ZIPCODE_BUSINESS		
		, ZIPCODE_CITY
		, ZIPCODE_COUNTY
		, ZIPCODE_COUNTYFIPS		
		, ZIPCODE_LATITUDE
		, ZIPCODE_LONGITUDE
		, ZIPCODE_MFDU		
		, ZIPCODE_SFDU
		, ZIPCODE_STATE
		, ZIPCODE_STATEFIPS
		, ZIPCODE_WKB.STAsBinary() AS ZIPCODE_WKB
		, ZIPCODE_WKT	
	FROM
		[maponics].[ZipCodes]
	WHERE
		ZIPCODE_WKB.STIntersects(geometry::STGeomFromText(@Wkt, 4326)) = 1;
END
GO