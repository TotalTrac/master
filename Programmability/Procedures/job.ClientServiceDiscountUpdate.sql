SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[ClientServiceDiscountUpdate]
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
		job.[ClientServiceDiscounts]
	SET
		CLIENTID			= @ClientID
		, PRICEMINIMUM		= @PriceMinimum
		, [Percent]			= @Percent
		, SERVICEID		= @ServiceID		
		, UNITPRICE		= @UnitPrice
	OUTPUT
		inserted.ID AS ID, inserted.ROWVERSION AS [VERSION]
	WHERE
		(ID = @ID) 
		AND (ROWVERSION = @Version);		
END
GO