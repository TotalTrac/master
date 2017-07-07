SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[QuoteGetByID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		ID
		, CLIENTID
		, CREATED
		, CREATEDBYID
		, Name
    , Note
    , [State]
		, UPDATED
		, [ROWVERSION]
	FROM
		[job].[Quotes]
	WHERE
		ID = @ID;
END
GO