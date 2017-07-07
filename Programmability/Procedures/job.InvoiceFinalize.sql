SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[InvoiceFinalize]
	@ID				int
AS
BEGIN
	SET NOCOUNT ON;
	
	UPDATE [job].[Invoices]
	SET		
	 [State]   = 3
	
	
	OUTPUT inserted.ID AS [ID], inserted.[ROWVERSION] AS [VERSION]
	WHERE
		ID = @ID
		
END
GO