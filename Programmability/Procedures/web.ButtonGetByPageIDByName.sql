SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[ButtonGetByPageIDByName]
	@PageID		int
	, @Name		nvarchar(200)
AS
BEGIN
	
    SET NOCOUNT ON;
    
    SELECT 
		BUTTON_ID
		, BUTTON_NAME
		, BUTTON_PAGEID
		, BUTTON_TITLE
		, BUTTON_ROWVERSION
	FROM
		[web].[Buttons]
	WHERE
		(BUTTON_PAGEID = @PageID)
		AND (BUTTON_NAME = @Name);
END
GO