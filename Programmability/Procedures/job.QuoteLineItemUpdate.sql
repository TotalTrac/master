SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[QuoteLineItemUpdate]	
	@ID				int
	, @AdjustedPrice	decimal(15,5)
  , @Note       VARCHAR(MAX)
	, @Quantity		int
	, @QuoteID		int
	, @ServiceID	INT
  , @Unit       INT
  , @UnitPrice	decimal(15,5)
	, @Version		TIMESTAMP

AS
BEGIN
	SET NOCOUNT ON;
	
	UPDATE [job].[QuoteLineItems]
	SET	
    ADJUSTEDPRICE	= @AdjustedPrice
    , Note        = @Note
		, QUANTITY		= @Quantity
		, QUOTEID		= @QuoteID
		, SERVICEID	= @ServiceID
    , [State]   = 1
    , Unit      = @Unit
		, UNITPRICE	= @UnitPrice
	OUTPUT inserted.ID AS [ID], inserted.[ROWVERSION] AS [VERSION]
	WHERE
		ID = @ID
		AND [ROWVERSION] = @Version
	;
END
GO