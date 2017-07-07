SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[ScreenshotUpdate]
	@ID					int
	, @PageID			int
	, @FullSizeImage	varbinary(MAX)
	, @ThumbnailImage	varbinary(MAX)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	UPDATE [web].[Screenshots]
	SET
		SCREENSHOT_FULLSIZE		= @FullSizeImage
		, SCREENSHOT_THUMBNAIL	= @ThumbnailImage
		, SCREENSHOT_PAGEID	= @PageID
	OUTPUT
		inserted.SCREENSHOT_ID AS ID, NULL AS [VERSION]
	WHERE
		SCREENSHOT_ID = @ID;
	
END
GO