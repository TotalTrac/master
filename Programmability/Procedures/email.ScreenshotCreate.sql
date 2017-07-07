SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[ScreenshotCreate]	
	@FullSizeImage		varbinary(MAX)
	, @ThumbnailImage	varbinary(MAX)
	, @VersionID		int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	INSERT [email].[Screenshots]
	(
		FullSize
		, ThumbNail
		, VersionId
	)
	OUTPUT
		inserted.Id AS ID, NULL AS [VERSION]
	VALUES
	(
		@FullSizeImage
		, @ThumbnailImage
		, @VersionID
	);	
END
GO