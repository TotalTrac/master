SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ClientServiceDiscountUpdate]
	@ID				int
	, @ClientID		int	
	, @Percent		decimal(7, 5)
	, @PriceMinimum	decimal(18, 5)
	, @ServiceID	int
	, @UnitPrice	decimal(18, 5)	
	, @Version		timestamp
AS
BEGIN
	
	SET NOCOUNT ON;
	
	UPDATE 
		[dbo].[ClientServiceDiscounts]
	SET
		DISCOUNT_CLIENTID			= @ClientID
		, DISCOUNT_PRICEMINIMUM		= @PriceMinimum
		, DISCOUNT_PERCENT			= @Percent
		, DISCOUNT_SERVICEID		= @ServiceID		
		, DISCOUNT_UNITPRICE		= @UnitPrice
	OUTPUT
		inserted.DISCOUNT_ID AS ID, inserted.DISCOUNT_ROWVERSION AS [VERSION]
	WHERE
		(DISCOUNT_ID = @ID) 
		AND (DISCOUNT_ROWVERSION = @Version);		
END
GO