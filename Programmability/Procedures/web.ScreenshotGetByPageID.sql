﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[ScreenshotGetByPageID]
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
		SCREENSHOT_PAGEID = @ID
	ORDER BY
		SCREENSHOT_ID;
END
GO