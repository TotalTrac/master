SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[InvoiceLineItemUpdate]
	@ID					int
	, @AdjustedPrice	decimal(15,5)
	, @InvoiceID		INT
  , @Note         VARCHAR(MAX)
  , @Quantity			int
	, @ServiceID		INT
  , @Unit         INT
  , @UnitPrice		decimal(15,5)
	, @Version			timestamp	

AS
BEGIN
	SET NOCOUNT ON;
	
	UPDATE [job].[InvoiceLineItems]
	SET
		AdjustedPrice	= @AdjustedPrice
		, InvoiceId	= @InvoiceID
    , Note = @Note
    , Quantity	= @Quantity
		, ServiceId	= @ServiceID
    , [State] = 1
    , Unit    = @Unit
		, UnitPrice	= @UnitPrice		
	OUTPUT inserted.Id AS [ID], inserted.RowVersion AS [VERSION]
	WHERE
		Id = @ID
		AND [RowVersion] = @Version;
END
GO