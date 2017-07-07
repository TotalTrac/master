SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[InvoiceGetByID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		ID
		, CREATED
		, CREATEDBYID
		, JOBID
    , Note
    , [State]
		, UPDATED
		, [ROWVERSION]
	FROM
		[job].[Invoices]
	WHERE
		ID = @ID;
END
GO