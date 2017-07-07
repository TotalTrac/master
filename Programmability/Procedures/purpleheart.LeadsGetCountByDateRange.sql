SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [purpleheart].[LeadsGetCountByDateRange]	
	@From	date = NULL
	, @to	date = NULL
AS
BEGIN
	SET NOCOUNT ON;
	    
	;WITH CTE AS
	(
		SELECT
			DISTINCT i.CRRT_COUNTRESULTID
			, d.DEPOT_ID
			, d.DEPOT_NAME
			, ph.ZIPCODE_DATE
			, z.ZIPCODE_NAME			
		FROM
			[purpleheart].[Depots] AS d
			INNER JOIN [purpleheart].[OrderZipCodes] AS ph
				ON d.DEPOT_ID = ph.ZIPCODE_DEPOTID
			INNER JOIN [acxiom].[OrderZipCodes] AS z
				ON ph.ZIPCODE_ITEMID = z.ZIPCODE_ID
			INNER JOIN [acxiom].[OrderCarrierRoutes] AS c
				ON z.ZIPCODE_ID = c.CRRT_ZIPCODEID
			INNER JOIN [acxiom].[OrderCarrierRouteItems] As i
				ON c.CRRT_ID = i.CRRT_CARRIERROUTEID
			WHERE
				ph.ZIPCODE_DATE BETWEEN @From AND @To
	)
	SELECT 
		COUNT(CTE.DEPOT_ID)		
	FROM
		[acxiom].[Leads] AS l
		INNER JOIN [acxiom].[CountResults] AS c
			ON l.LEAD_ORDERID = c.COUNT_ORDERID
		INNER JOIN CTE
			ON CTE.CRRT_COUNTRESULTID = c.COUNT_ID;
END
GO