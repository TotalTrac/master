SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[LinkCreate] 
	@Index		int
	, @PageID	int
	, @Text		nvarchar(200) = NULL
	, @Title	nvarchar(100) = NULL
	, @Url		nvarchar(500)
AS
BEGIN
	
    INSERT [web].[Links]
    (
		LINK_INDEX
		, LINK_PAGEID
		, LINK_TEXT
		, LINK_TITLE
		, LINK_URL
    )
    OUTPUT
		inserted.LINK_ID AS ID, inserted.LINK_ROWVERSION AS [VERSION]
    VALUES
    (
		@Index,
		@PageID,
		@Text,
		@Title,
		@Url
    );    
END
GO