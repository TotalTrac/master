﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [purpleheart].[CountsGetByDateRange]
	@From	date = NULL
	, @To	date = NULL
AS
BEGIN
	SET NOCOUNT ON;

    SELECT 
       p.ZIPCODE_DATE AS [DATE]		 
		, COUNT(c.CRRT_ID) AS [CRRT_COUNT]
		, COALESCE(SUM(i.CRRT_REQUESTED), 0) AS [TOTAL_COUNT]
	FROM
		[purpleheart].[OrderZipCodes] AS p
		INNER JOIN [acxiom].[OrderZipCodes] AS z
			ON p.ZIPCODE_ITEMID = z.ZIPCODE_ID
		INNER JOIN [acxiom].[OrderCarrierRoutes] AS c
			ON z.ZIPCODE_ID = c.CRRT_ZIPCODEID
		INNER JOIN [acxiom].[OrderCarrierRouteItems] AS i
			ON c.CRRT_ID = i.CRRT_CARRIERROUTEID
	WHERE		
		(@From IS NULL OR @From <= p.ZIPCODE_DATE)
		AND (@To IS NULL OR @To >= p.ZIPCODE_DATE)
		AND i.CRRT_SELECTED = 1 
	GROUP BY
		p.ZIPCODE_DATE;		
END
GO