SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[ClientServiceDiscountGetByClientIDServiceID] 
	@ClientID		int
	, @ServiceID	int
AS
BEGIN

	SET NOCOUNT ON;
    
	SELECT
		ID
		, CLIENTID
		, PRICEMINIMUM
		, [PERCENT]
		, SERVICEID		
		, UNITPRICE
		, ROWVERSION
	FROM 
		job.[ClientServiceDiscounts]
	WHERE 
		(SERVICEID = @ServiceID)
		AND (CLIENTID = @ClientID);
END
GO