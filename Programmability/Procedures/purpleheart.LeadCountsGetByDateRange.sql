SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [purpleheart].[LeadCountsGetByDateRange]	
	@From		date = NULL
	, @To		date = NULL
AS
BEGIN

	SET NOCOUNT ON;
	
	;WITH CTE_Counts AS
	(
		SELECT
			c.COUNT_ID									AS [ID]
			, crrt.CRRT_CRRT							AS [CRRT]
			, COALESCE(COUNT(DISTINCT l.LEAD_ID), 0)	AS [COUNT]
		FROM
			[purpleheart].[OrderZipCodes] AS ph
			INNER JOIN [acxiom].[OrderZipCodes] AS z
				ON ph.ZIPCODE_ITEMID = z.ZIPCODE_ID
			INNER JOIN [acxiom].[OrderCarrierRoutes] AS crrt
				ON z.ZIPCODE_ID = crrt.CRRT_ZIPCODEID
			INNER JOIN [acxiom].[OrderCarrierRouteItems] AS i
				ON crrt.CRRT_ID = i.CRRT_CARRIERROUTEID								
			INNER JOIN [acxiom].[CountResults] AS c
				ON i.CRRT_COUNTRESULTID = c.COUNT_ID
			INNER JOIN [purpleheart].[Depots] AS d
				ON ph.ZIPCODE_DEPOTID = d.DEPOT_ID	
			INNER JOIN [acxiom].[Orders] AS o
				ON c.COUNT_ORDERID = o.ORDER_ID
			LEFT JOIN [acxiom].[Leads] AS l
				ON o.ORDER_ID = l.LEAD_ORDERID								
		WHERE			
			ph.ZIPCODE_DATE BETWEEN @From AND @To			
			AND i.CRRT_SELECTED = 1	
			AND l.LEAD_CARRIERROUTE = crrt.CRRT_CRRT
		GROUP BY
			c.COUNT_ID
			, crrt.CRRT_CRRT
	)
	SELECT
		d.DEPOT_NAME				AS [DEPOT]
		, ph.ZIPCODE_DATE			AS [DATE]
		, z.ZIPCODE_NAME			AS [NAME]
		, z.ZIPCODE_ZIPCODE			AS [ZIPCODE]
		, crrt.CRRT_CRRT			AS [CRRT]
		, i.CRRT_AVAILABLE			AS [AVAILABLE]
		, i.CRRT_REQUESTED			AS [REQUESTED]
		, COALESCE(o.[COUNT], 0)	AS [COUNT]
	FROM
		[purpleheart].[OrderZipCodes] AS ph
		INNER JOIN [purpleheart].[Depots] AS d
			ON ph.ZIPCODE_DEPOTID = d.DEPOT_ID	
		INNER JOIN [acxiom].[OrderZipCodes] AS z
			ON ph.ZIPCODE_ITEMID = z.ZIPCODE_ID
		INNER JOIN [acxiom].[OrderCarrierRoutes] AS crrt
			ON z.ZIPCODE_ID = crrt.CRRT_ZIPCODEID
		INNER JOIN [acxiom].[OrderCarrierRouteItems] AS i
			ON crrt.CRRT_ID = i.CRRT_CARRIERROUTEID		
				AND i.CRRT_SELECTED = 1		
		LEFT JOIN CTE_Counts AS o
			ON i.CRRT_COUNTRESULTID = o.ID
				AND crrt.CRRT_CRRT = o.CRRT
	WHERE		
		ph.ZIPCODE_DATE BETWEEN @From AND @To	
	ORDER BY
		d.DEPOT_NAME
		, ph.ZIPCODE_DATE
		, z.ZIPCODE_NAME
		, z.ZIPCODE_ZIPCODE
		, crrt.CRRT_CRRT
END
GO