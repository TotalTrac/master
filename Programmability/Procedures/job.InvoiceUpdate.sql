SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[InvoiceUpdate]
	@ID				int
	, @Created		datetime
	, @CreatedById	int
	, @JobID		INT
  , @Note     VARCHAR(MAX)
	, @Updated		datetime
	, @Version		timestamp
AS
BEGIN
	SET NOCOUNT ON;
	
	UPDATE [job].[Invoices]
	SET		
		CREATED			= @Created
		, CREATEDBYID	= @CreatedById
		, JOBID			= @JobID
    , Note      = @Note
    , [State]   = 1
		, UPDATED		= @Updated
	
	OUTPUT inserted.ID AS [ID], inserted.[ROWVERSION] AS [VERSION]
	WHERE
		ID = @ID
		AND [ROWVERSION] = @Version;
END
GO