SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[InvoiceCreate]
	@Created		datetime
	, @CreatedById	int
	, @JobID		INT
  , @Note     VARCHAR(MAX)
	, @Updated		datetime
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT [job].[Invoices]
	(		
		CREATED
		, CREATEDBYID
		, JOBID
    , Note
    , [State]
		, UPDATED
	)
	OUTPUT inserted.ID AS [ID], inserted.[ROWVERSION] AS [VERSION]
	VALUES
	(		
		@Created
		, @CreatedById
		, @JobID
    , @Note
    , 0
		, @Updated
	);
END
GO