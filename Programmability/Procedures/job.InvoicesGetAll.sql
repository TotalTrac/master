SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[InvoicesGetAll]

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

END
GO