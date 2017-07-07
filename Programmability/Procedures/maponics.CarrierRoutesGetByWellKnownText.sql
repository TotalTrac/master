SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [maponics].[CarrierRoutesGetByWellKnownText]
	@Wkt	varchar(MAX)
AS
BEGIN
	
	SET NOCOUNT ON;
	    
	SELECT
		CRRT_ID
		, CRRT_BOXES
		, CRRT_BUSINESS
		, CRRT_CRRT		
		, CRRT_LATITUDE
		, CRRT_LONGITUDE
		, CRRT_MFDU		
		, CRRT_SFDU
		, CRRT_WKB.STAsBinary() AS CRRT_WKB
		, CRRT_WKT		
		, CRRT_ZIPCODEID
	FROM
		[maponics].[CarrierRoutes]
	WHERE
		CRRT_WKB.STIntersects(geometry::STGeomFromText(@Wkt, 4326)) = 1;
END
GO