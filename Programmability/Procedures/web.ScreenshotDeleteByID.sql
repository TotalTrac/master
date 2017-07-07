﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[ScreenshotDeleteByID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;
	
	DELETE 
		[web].[Screenshots]
	WHERE 
		SCREENSHOT_ID = @ID;
	
	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;
END
GO