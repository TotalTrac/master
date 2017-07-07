SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [purpleheart].[LeadsGetByDepotIdByDateRange]
	@ID			int
	, @From		date = NULL
	, @To		date = NULL
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
				AND ph.ZIPCODE_DEPOTID = @ID
	)
	SELECT 
		CTE.DEPOT_ID				AS [LEAD_DEPOTID]
		, CTE.DEPOT_NAME			AS [LEAD_DEPOTNAME]
		, CTE.ZIPCODE_DATE		AS [LEAD_DATE]
		, CTE.ZIPCODE_NAME		AS [LEAD_ZIPCODENAME]
		--, l.LEAD_ENDORSEMENT
		, l.LEAD_CARRIERROUTE
		--, l.LEAD_QUALIFICATION
		, l.LEAD_WALKSEQUENCE
		, l.LEAD_TITLE
		, l.LEAD_ADDRESS
		, l.LEAD_CITY
		, l.LEAD_STATE
		, l.LEAD_ZIPCODE
		, l.LEAD_ZIP4
		, l.LEAD_DELIVERYPOINT
		, l.LEAD_CHECKDIGIT		
	FROM
		[acxiom].[Leads] AS l
		INNER JOIN [acxiom].[CountResults] AS c
			ON l.LEAD_ORDERID = c.COUNT_ORDERID
		INNER JOIN CTE
			ON CTE.CRRT_COUNTRESULTID = c.COUNT_ID;
END
GO