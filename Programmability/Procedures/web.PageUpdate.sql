SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[PageUpdate]
	@ID					int		
	, @LinksRegistered	datetime = NULL	
	, @Name				nvarchar(50)
	, @RequestTimeout	int
	, @Type				int
	, @Url				nvarchar(500)
	, @VersionID		int
	, @Version			timestamp
AS
BEGIN
	
	UPDATE [web].[Pages]
	SET			
		PAGE_LINKSREGISTERED	= @LinksRegistered
		, PAGE_NAME				= @Name
		, PAGE_REQUESTTIMEOUT	= @RequestTimeout
		, PAGE_TYPE				= @Type
		, PAGE_URL				= @Url
		, PAGE_VERSIONID		= @VersionID		
	OUTPUT
		inserted.PAGE_ID AS ID, inserted.PAGE_ROWVERSION AS [VERSION]				
	WHERE
		(PAGE_ID = @ID) 
		AND (PAGE_ROWVERSION = @Version);
	
END
GO