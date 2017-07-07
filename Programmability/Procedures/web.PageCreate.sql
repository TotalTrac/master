SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[PageCreate]	
	@LinksRegistered	datetime = NULL
	, @Name				nvarchar(50)
	, @RequestTimeout	int
	, @Type				int
	, @Url				nvarchar(200)
	, @VersionID		int
AS
BEGIN
	
	INSERT [web].[Pages]
	(	
		PAGE_LINKSREGISTERED
		, PAGE_NAME
		, PAGE_REQUESTTIMEOUT
		, PAGE_TYPE
		, PAGE_URL
		, PAGE_VERSIONID
	)
	OUTPUT
		inserted.PAGE_ID AS ID, inserted.PAGE_ROWVERSION AS [VERSION]
	VALUES
	(			
		@LinksRegistered
		, @Name
		, @RequestTimeout
		, @Type
		, @Url
		, @VersionID
	);	
END
GO