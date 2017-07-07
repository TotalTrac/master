SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[ScreenshotUpdate]
	@ID					int	
	, @FullSizeImage	varbinary(MAX)
	, @ThumbnailImage	varbinary(MAX)
	, @VersionID		int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	UPDATE [email].[Screenshots]
	SET 
		FullSize		= @FullSizeImage
		, ThumbNail	= @ThumbnailImage
		, VersionId	= @VersionID
	OUTPUT
		inserted.Id AS ID, NULL AS [VERSION]
	WHERE
		Id = @ID;
	
END
GO