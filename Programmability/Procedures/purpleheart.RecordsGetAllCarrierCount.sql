SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [purpleheart].[RecordsGetAllCarrierCount]
	 @StartYear	smallint
	, @StartWeek	smallint
	, @EndYear		smallint
	, @EndWeek		smallint
	, @GroupByWeek	bit = NULL
AS
BEGIN
	SET NOCOUNT ON;
	    
	SELECT 
		CASE WHEN @GroupByWeek = 1 THEN
			RECORD_YEAR				
		END AS RECORD_YEAR
		, CASE WHEN @GroupByWeek = 1 THEN
			RECORD_WEEK				
		END AS RECORD_WEEK		
		, RECORD_STATE 				
		, LEFT(RECORD_ZIPCODE, 5) AS RECORD_ZIPCODE
		, RECORD_CARRIERROUTE
		, SUM(RECORD_RATE) AS RECORD_RATE
    , RECORD_DEPOTID AS RECORD_DEPOT
    , d.DEPOT_NAME AS RECORD_CHARITY
		, SUM(RECORD_SCFDISCOUNT) AS RECORD_SCFDISCOUNT
		, SUM(RECORD_DISCOUNT) AS RECORD_DISCOUNT
		, COUNT(*) AS RECORD_COUNT
	FROM
		[purpleheart].[Records]
  INNER JOIN purpleheart.Depots d ON d.DEPOT_ID = RECORD_DEPOTID
	WHERE
    (	
			(@StartYear < RECORD_YEAR)
			OR (@StartYear = RECORD_YEAR AND @StartWeek <= RECORD_WEEK)			
		)
		AND 
		(	
			(@EndYear > RECORD_YEAR)
			OR (@EndYear = RECORD_YEAR AND @EndWeek >= RECORD_WEEK)			
		)
	GROUP BY
		CASE WHEN @GroupByWeek = 1 THEN
			RECORD_YEAR				
		END
		, CASE WHEN @GroupByWeek = 1 THEN
			RECORD_WEEK				
		END
		, RECORD_STATE
    , RECORD_DEPOTID
    , d.DEPOT_NAME
		, LEFT(RECORD_ZIPCODE, 5)
		, RECORD_CARRIERROUTE;
END
GO