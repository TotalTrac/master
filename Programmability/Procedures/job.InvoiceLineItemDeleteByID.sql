SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[InvoiceLineItemDeleteByID] 
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	UPDATE
		[job].[InvoiceLineItems]
  SET
    [State] = 2
	WHERE 
		Id = @ID;

	IF @@ROWCOUNT > 0
		RETURN 0
	ELSE 
		RETURN 1;
END
GO