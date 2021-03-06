﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [acxiom].[LeadsGetByOrderID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;
	    
	SELECT
		LEAD_ID
		, LEAD_ADDRESS
		, LEAD_CARRIERROUTE
		, LEAD_CHECKDIGIT
		, LEAD_CITY
		, LEAD_DELIVERYPOINT
		--, LEAD_ENDORSEMENT
		, LEAD_ORDERID
		--, LEAD_QUALIFICATION		
		, LEAD_STATE
		, LEAD_TITLE
		, LEAD_WALKSEQUENCE		
		, LEAD_ZIP4
		, LEAD_ZIPCODE	
	FROM
		[acxiom].[Leads]
	WHERE
		LEAD_ORDERID = @ID
	ORDER BY
		LEAD_ID;
END
GO