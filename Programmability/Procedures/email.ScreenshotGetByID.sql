SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[ScreenshotGetByID]
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
		Id = @ID;	
		
END
GO