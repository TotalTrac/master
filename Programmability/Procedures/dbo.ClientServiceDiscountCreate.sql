SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ClientServiceDiscountCreate]
	@ClientID		int	
	, @Percent		decimal(7, 5)
	, @PriceMinimum	decimal(18, 5)
	, @ServiceID	int	
	, @UnitPrice	decimal(18, 5)
AS
BEGIN	
	SET NOCOUNT ON;
		
	INSERT [dbo].[ClientServiceDiscounts]
	(
		DISCOUNT_CLIENTID
		, DISCOUNT_PERCENT
		, DISCOUNT_PRICEMINIMUM		
		, DISCOUNT_SERVICEID		
		, DISCOUNT_UNITPRICE
	)
	OUTPUT
		inserted.DISCOUNT_ID AS ID, inserted.DISCOUNT_ROWVERSION AS [VERSION]
	VALUES
	(
		@ClientID		
		, @Percent
		, @PriceMinimum
		, @ServiceID		
		, @UnitPrice
	);
END
GO