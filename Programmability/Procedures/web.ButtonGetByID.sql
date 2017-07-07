﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[ButtonGetByID]
	@ID	int
AS
BEGIN
	
    SET NOCOUNT ON;
    
    SELECT 
		BUTTON_ID
		, BUTTON_NAME
		, BUTTON_PAGEID
		, BUTTON_TITLE
		, BUTTON_ROWVERSION
	FROM
		[web].[Buttons]
	WHERE
		BUTTON_ID = @ID;
END
GO