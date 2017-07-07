﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ClientServiceDiscountGetByClientIDServiceID] 
	@ClientID		int
	, @ServiceID	int
AS
BEGIN

	SET NOCOUNT ON;
    
	SELECT
		DISCOUNT_ID
		, DISCOUNT_CLIENTID
		, DISCOUNT_PRICEMINIMUM
		, DISCOUNT_PERCENT
		, DISCOUNT_SERVICEID		
		, DISCOUNT_UNITPRICE
		, DISCOUNT_ROWVERSION
	FROM 
		[dbo].[ClientServiceDiscounts]
	WHERE 
		(DISCOUNT_SERVICEID = @ServiceID)
		AND (DISCOUNT_CLIENTID = @ClientID);
END
GO