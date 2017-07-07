SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[QuoteCreate]
	@ClientID		int
	, @Created		datetime
	, @CreatedById	int
	, @Name			nvarchar(100)
  , @Note     VARCHAR(MAX)
	, @Updated		datetime
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT [job].[Quotes]
	(
		CLIENTID
		, CREATED
		, CREATEDBYID
		, NAME
    , Note
    , [State]
		, UPDATED
	)
	OUTPUT inserted.ID AS [ID], inserted.[ROWVERSION] AS [VERSION]
	VALUES
	(
		@ClientID
		, @Created
		, @CreatedById
		, @Name
    , @Note
    , 0
		, @Updated
	);
END
GO