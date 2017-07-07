﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[FontItemGetByID] 
	@ID int
AS
BEGIN

	SET NOCOUNT ON;

    SELECT
		FONT_ID
		, FONT_NAME
		, FONT_ROWVERSION
	FROM
		[dbo].[Fonts]
    WHERE 
		FONT_ID = @ID;
END
GO