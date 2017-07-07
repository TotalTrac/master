﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [acxiom].[ZipCodeGetCounts]
	@ID int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
	   SUM(case when CRRT_CRRT LIKE 'B%' then (CRRT_SFDU + CRRT_BUSINESS) when CRRT_CRRT NOT LIKE 'B%' THEN 0 end) as 'ZIPCODE_BOXES'
      ,SUM(case when CRRT_CRRT NOT LIKE 'B%' then CRRT_BUSINESS when CRRT_CRRT LIKE 'B%' THEN 0 end) as 'ZIPCODE_BUSINESS'
      ,SUM([CRRT_MFDU]) as 'ZIPCODE_MFDU'
      ,SUM(case when CRRT_CRRT NOT LIKE 'B%' then CRRT_SFDU when CRRT_CRRT LIKE 'B%' THEN 0 end) as 'ZIPCODE_SFDU'
      ,SUM([CRRT_TRLR]) as 'ZIPCODE_TRLR'
	
	FROM [acxiom].[CarrierRoutes]
	
	WHERE CRRT_ZIPCODEID = @ID
		
END
GO