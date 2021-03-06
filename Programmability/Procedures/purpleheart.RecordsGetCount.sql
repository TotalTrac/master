﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [purpleheart].[RecordsGetCount]
	@DepotID	int = NULL
	, @Week		smallint = NULL	
	, @State	char(2) = NULL
	, @Year		smallint = NULL
AS
BEGIN
	SET NOCOUNT ON;
	    
	SELECT 
		CASE WHEN @Year IS NOT NULL THEN
			RECORD_YEAR 
		END AS RECORD_YEAR
		, CASE WHEN @Week IS NOT NULL THEN
			RECORD_WEEK 
		END AS RECORD_WEEK		
		, RECORD_STATE
		, COUNT(RECORD_STATE)
	FROM
		[purpleheart].[Records]
	WHERE
		(@DepotID IS NULL OR @DepotID = RECORD_DEPOTID)
		AND (@Year IS NULL OR @Year = RECORD_YEAR)
		AND (@Week IS NULL OR @Week = RECORD_WEEK)		
		AND (@State IS NULL OR @State = RECORD_STATE)
	GROUP BY
		CASE WHEN @Year IS NOT NULL THEN
			RECORD_YEAR 
		END
		, CASE WHEN @Week IS NOT NULL THEN
			RECORD_WEEK 			
		END
		, RECORD_STATE;
END
GO