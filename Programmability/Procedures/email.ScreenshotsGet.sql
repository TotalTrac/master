SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[ScreenshotsGet]
	
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
	ORDER BY
		Id;		
END
GO