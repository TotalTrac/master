SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [purpleheart].[RecordsGetAllStateCount]
	 @StartYear	smallint
	, @StartWeek	smallint
	, @EndYear		smallint
	, @EndWeek		smallint
AS
BEGIN
	SET NOCOUNT ON;
	    
	SELECT 		
		RECORD_YEAR 		
		, RECORD_WEEK 		
		, RECORD_STATE
		, SUM(RECORD_RATE) AS RECORD_RATE
		, SUM(RECORD_SCFDISCOUNT) AS RECORD_SCFDISCOUNT
      , RECORD_DEPOTID AS RECORD_DEPOT
    , d.DEPOT_NAME AS RECORD_CHARITY
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
		RECORD_YEAR 		
		, RECORD_WEEK 
    , RECORD_DEPOTID
    , d.DEPOT_NAME		
		, RECORD_STATE;		
END
GO