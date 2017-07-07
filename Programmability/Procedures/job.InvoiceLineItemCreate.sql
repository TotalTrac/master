SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[InvoiceLineItemCreate]
	 @AdjustedPrice	decimal(15,5)
	, @InvoiceID		INT
  , @Note         VARCHAR(MAX)
  , @Quantity			int
	, @ServiceID		INT
  , @Unit         INT
  , @UnitPrice		decimal(15,5)
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT [job].[InvoiceLineItems]
	(
		 AdjustedPrice
		, InvoiceId
    , Note
    , Quantity
		, ServiceId
    , [State]
    , Unit
		, UnitPrice		
	)
	OUTPUT inserted.Id AS [ID], inserted.[RowVersion] AS [VERSION]
	VALUES
	(		
		@AdjustedPrice
		, @InvoiceID
    , @Note
    , @Quantity
		, @ServiceID
    , 0
    , @Unit
    , @UnitPrice
	);
END
GO