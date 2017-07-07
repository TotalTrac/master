SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[InvoiceLineItemsGetByInvoiceID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		Id
		, AdjustedPrice
		, InvoiceId
    , Note
   	, Quantity
		, ServiceId
    , [State]
    , Unit
		, UnitPrice
		, [RowVersion]
	FROM
		[job].[invoiceLineItems]
	WHERE
		InvoiceId = @ID  AND [State] != 2
END
GO