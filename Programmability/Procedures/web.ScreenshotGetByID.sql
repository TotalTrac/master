﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[ScreenshotGetByID]
	@ID	int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT
		SCREENSHOT_ID
		, SCREENSHOT_FULLSIZE
		, SCREENSHOT_THUMBNAIL
		, SCREENSHOT_PAGEID
	FROM
		[web].[Screenshots]
	WHERE
		SCREENSHOT_ID = @ID;	
		
END
GO