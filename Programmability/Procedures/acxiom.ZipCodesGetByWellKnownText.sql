SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [acxiom].[ZipCodesGetByWellKnownText]
	@Wkt	varchar(MAX)
AS
BEGIN
	
	SET NOCOUNT ON;
	    
	SELECT
		[ZIPCODE_ID]
      ,[ZIPCODE_AVERAGEAGE]
      ,[ZIPCODE_CITY]
      ,[ZIPCODE_INCOME]
      ,[ZIPCODE_LATITUDE]
      ,[ZIPCODE_LONGITUDE]
      ,[ZIPCODE_MKTMED]
      ,[ZIPCODE_PERCENTCHILD]
      ,[ZIPCODE_STATE]
      ,[ZIPCODE_WKB].STAsBinary() AS ZIPCODE_WKB
      ,[ZIPCODE_WKT]
	FROM
		[acxiom].[ZipCodes]
	WHERE
		ZIPCODE_WKB.STIntersects(geometry::STGeomFromText(@Wkt, 4326)) = 1;
END
GO