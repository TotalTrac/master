﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[RegionsGet] 
	
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		REGION_ID
		, REGION_CODE
		, REGION_COUNTRYID
		, REGION_NAME
	FROM 
		[dbo].[Regions]
	ORDER BY 
		REGION_ID
END
GO