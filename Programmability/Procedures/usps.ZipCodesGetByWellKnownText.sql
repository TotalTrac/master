SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[ZipCodesGetByWellKnownText]
	@Wkt				varchar(MAX)
	, @WithBoundaries	bit	= 0
AS
BEGIN
	
	SET NOCOUNT ON;
	    
	SELECT
		[ZIPCODE_ID]
		, [ZIPCODE_CITY]
		, [ZIPCODE_COUNTY]
		, [ZIPCODE_COUNTYFIPS]
		, [ZIPCODE_LATITUDE]
		, [ZIPCODE_LONGITUDE]
		, [ZIPCODE_STATE]
		, [ZIPCODE_STATEFIPS]
		, CASE @WithBoundaries
			WHEN 1 THEN
				[ZIPCODE_WKB].STAsBinary()
			END AS ZIPCODE_WKB
		, CASE @WithBoundaries
			WHEN 1 THEN
				ZIPCODE_WKT				
			END  AS ZIPCODE_WKT
		, RIGHT('00000' + ISNULL([ZIPCODE_ID],''),5) AS ZIPCODE_ZIPCODE      
	FROM
		[maponics].[ZipCodes]
	WHERE
		[ZIPCODE_WKB].STIntersects(geometry::STGeomFromText(@Wkt, 4326)) = 1;
END
GO