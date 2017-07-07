SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[ClientServiceDiscountsGet] 
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
	ORDER BY 
		ID;
	
END
GO