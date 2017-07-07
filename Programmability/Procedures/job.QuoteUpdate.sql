SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[QuoteUpdate]
	@ID				int
	, @ClientID		int
	, @Created		datetime
	, @CreatedById	int
	, @Name			nvarchar(100)
  , @Note     VARCHAR(MAX)
  , @State    INT
  , @Updated		datetime
	, @Version		TIMESTAMP
  
AS
BEGIN
	SET NOCOUNT ON;
	
	UPDATE [job].[Quotes]
	SET
		CLIENTID		= @ClientID
		, CREATED		= @Created
		, CREATEDBYID	= @CreatedById
		, NAME		= @Name
    , Note    = @Note
    , [State] = 1
		, UPDATED		= @Updated	
	OUTPUT inserted.ID AS [ID], inserted.[ROWVERSION] AS [VERSION]
	WHERE
		ID = @ID
		AND [ROWVERSION] = @Version;
END
GO