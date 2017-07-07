SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[QuotesGetByClientID]
	@ID		int
	, @From	datetime = NULL
	, @To	datetime = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		i.ID
		, i.CLIENTID
		, i.CREATED
		, i.CREATEDBYID
		, i.Name
    , i.Note
    , i.[State]
		, i.UPDATED
		, i.[ROWVERSION]
	FROM
		[job].[Quotes] AS i		
	WHERE
		i.CLIENTID = @ID
		AND (@From IS NULL OR CREATED >= @From)
		AND (@To IS NULL OR CREATED <= @To);
END
GO