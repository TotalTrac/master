SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [StVincent].[CountsGetByDepotIDByDateRange]
	@ID		int
	, @From	date = NULL
	, @To	date = NULL
AS
BEGIN
	SET NOCOUNT ON;

    SELECT 
       p.ZIPCODE_DATE AS [DATE]		 
		, COUNT(c.CRRT_ID) AS [CRRT_COUNT]
		, COALESCE(SUM(i.CRRT_REQUESTED), 0) AS [TOTAL_COUNT]
	FROM
		StVincent.[OrderZipDate] AS p
		INNER JOIN StVincent.[OrderZipCodes] AS z
			ON p.ZIPCODE_ITEMID = z.ZIPCODE_ID
		INNER JOIN StVincent.[OrderCarrierRoutes] AS c
			ON z.ZIPCODE_ID = c.CRRT_ZIPCODEID
		INNER JOIN StVincent.[OrderCarrierRouteItems] AS i
			ON c.CRRT_ID = i.CRRT_CARRIERROUTEID
	WHERE
		p.ZIPCODE_DEPOTID = @ID 
		AND (@From IS NULL OR @From <= p.ZIPCODE_DATE)
		AND (@To IS NULL OR @To >= p.ZIPCODE_DATE)
		AND i.CRRT_SELECTED = 1 
	GROUP BY
		p.ZIPCODE_DATE;		
END
GO