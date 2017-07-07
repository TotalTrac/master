SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[InvoiceDeleteByID] 
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	UPDATE
		[job].[Invoices] 
  SET
    [State]	= 2
	WHERE 
		[ID] = @ID;

	IF @@ROWCOUNT > 0
		RETURN 0
	ELSE 
		RETURN 1;
END
GO