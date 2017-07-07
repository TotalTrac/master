SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[BulkServiceDiscountCreate]
	@High		int,
	@Low		int,
	@Percent	decimal (7,5),
	@ServiceID	int,	
	@UnitPrice	decimal (18,5)
AS
BEGIN

	SET NOCOUNT ON;
	
	-- don't allow overlapping values
	IF EXISTS(SELECT DISCOUNT_ID FROM BulkServiceDiscounts
				WHERE DISCOUNT_SERVICEID = @ServiceID 
				AND (((DISCOUNT_LOWTHRESHOLD <= @Low)
				AND (DISCOUNT_HIGHTHRESHOLD >= @Low))
				OR	((DISCOUNT_LOWTHRESHOLD <= @High)
				AND (DISCOUNT_HIGHTHRESHOLD >= @High))))
		RETURN -1;
				
	INSERT BulkServiceDiscounts
	(
		DISCOUNT_HIGHTHRESHOLD
		, DISCOUNT_LOWTHRESHOLD
		, DISCOUNT_PERCENT
		, DISCOUNT_SERVICEID
		, DISCOUNT_UNITPRICE
	)
	OUTPUT
		inserted.DISCOUNT_ID AS ID, inserted.DISCOUNT_ROWVERSION AS [VERSION]
	VALUES
	(
		@High
		, @Low
		, @Percent
		, @ServiceID		
		, @UnitPrice
	);
END
GO