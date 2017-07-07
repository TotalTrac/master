SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[ClientServiceDiscountCreate]
	@ClientID		int	
	, @Percent		decimal(7, 5)
	, @PriceMinimum	decimal(18, 5)
	, @ServiceID	int	
	, @UnitPrice	decimal(18, 5)
AS
BEGIN	
	SET NOCOUNT ON;
		
	INSERT job.[ClientServiceDiscounts]
	(
		CLIENTID
		, [PERCENT]
		, PRICEMINIMUM		
		, SERVICEID		
		, UNITPRICE
	)
	OUTPUT
		inserted.ID AS ID, inserted.ROWVERSION AS [VERSION]
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