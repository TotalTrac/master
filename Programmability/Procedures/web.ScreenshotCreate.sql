SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[ScreenshotCreate]
	@PageID	int
	, @FullSizeImage	varbinary(MAX)
	, @ThumbnailImage	varbinary(MAX)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	INSERT [web].[Screenshots]
	(
		SCREENSHOT_FULLSIZE
		, SCREENSHOT_THUMBNAIL
		, SCREENSHOT_PAGEID
	)
	OUTPUT
		inserted.SCREENSHOT_ID AS ID, NULL AS [VERSION]
	VALUES
	(
		@FullSizeImage
		, @ThumbnailImage
		, @PageID
	);	
END
GO