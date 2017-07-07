SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[ClientServiceDiscountGetByID]
	@ID int
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
		ID = @ID;
END
GO