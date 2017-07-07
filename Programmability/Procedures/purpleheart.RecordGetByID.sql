﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [purpleheart].[RecordGetByID]
	@ID int
AS
BEGIN
	SET NOCOUNT ON;
	    
	SELECT
		RECORD_ID 
		, RECORD_CARRIERROUTE			
		, RECORD_DAYOFWEEK
		, RECORD_DEPOTID
		, RECORD_DISCOUNT		
		, RECORD_RATE
		, RECORD_SCFDISCOUNT			
		, RECORD_SEED
		, RECORD_SCFID
		, RECORD_STATE
		, RECORD_WEEK
		, RECORD_YEAR
		, RECORD_ZIPCODE
		, RECORD_ZIPCODENAME
	FROM
		[purpleheart].[Records]
	WHERE
		RECORD_ID = @ID;
END
GO