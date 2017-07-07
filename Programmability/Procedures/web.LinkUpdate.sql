SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[LinkUpdate]
	@ID			int 
	, @Index	int
	, @PageID	int
	, @Text		nvarchar(200) = NULL
	, @Title	nvarchar(100) = NULL
	, @Url		nvarchar(500)
	, @Version	timestamp
AS
BEGIN
	
    UPDATE 
		[web].[Links]
    SET
		LINK_INDEX		= @Index
		, LINK_PAGEID	= @PageID
		, LINK_TEXT		= @Text
		, LINK_TITLE		= @Title
		, LINK_URL		= @Url
	OUTPUT
		inserted.LINK_ID AS ID, inserted.LINK_ROWVERSION AS [VERSION]
    WHERE
		(LINK_ID	= @ID)
		AND (LINK_ROWVERSION = @Version);    
    
END
GO