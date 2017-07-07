SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[InvoicesGetByJobID]
	@ID		int
	, @From	datetime = NULL
	, @To	datetime = NULL
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
		JOBID = @ID
		AND (@From IS NULL OR CREATED >= @From)
		AND (@To IS NULL OR CREATED <= @To);
END
GO