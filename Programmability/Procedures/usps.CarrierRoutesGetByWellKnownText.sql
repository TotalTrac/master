SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[CarrierRoutesGetByWellKnownText]
	@Wkt				varchar(MAX)
	, @WithBoundaries	bit	= 0
AS
BEGIN
	
	SET NOCOUNT ON;
	    
	SELECT
		[CRRT_ID]
		, [CRRT_BOXES]
		, [CRRT_BUSINESS]
		, [CRRT_CRRT]
		, [CRRT_LATITUDE]
		, [CRRT_LONGITUDE]
		, [CRRT_MFDU]
		, [CRRT_SFDU]		
		, CASE @WithBoundaries
			WHEN 1 THEN
				[CRRT_WKB].STAsBinary()
			END AS CRRT_WKB
		, CASE @WithBoundaries
			WHEN 1 THEN
				CRRT_WKT				
			END  AS CRRT_WKT
		, [CRRT_ZIPCODEID]
	FROM
		[maponics].[CarrierRoutes]
	WHERE
		[CRRT_WKB].STIntersects(geometry::STGeomFromText(@Wkt, 4326)) = 1;
END
GO