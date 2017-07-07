﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AreaGetByID]
	@ID int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		AREA_ID
		, AREA_CODE
		, AREA_NAME
	FROM
		[dbo].[Areas]
	WHERE
		AREA_ID = @ID;
END
GO