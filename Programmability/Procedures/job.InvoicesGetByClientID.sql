SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[InvoicesGetByClientID]
	@ID		int
	, @From	datetime = NULL
	, @To	datetime = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		i.ID
		, i.CREATED
		, i.CREATEDBYID
		, i.JOBID
    , i.Note
    , i.[State]
		, i.UPDATED
		, i.[ROWVERSION]
	FROM
		[job].[Invoices] AS i
		INNER JOIN [job].[Jobs] AS j
			ON i.JOBID = j.JOB_ID
	WHERE
		j.JOB_CLIENTID = @ID
		AND (@From IS NULL OR CREATED >= @From)
		AND (@To IS NULL OR CREATED <= @To);
END
GO