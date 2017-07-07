SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[ScreenshotGetByVersionID]
	@ID	int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT
		Id		
		, FullSize
		, ThumbNail
		, VersionId
	FROM
		[email].[Screenshots]
	WHERE
		VersionId = @ID
	ORDER BY
		Id;
END
GO