﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AreaGetByCode]
	@Code char(2)
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
		AREA_CODE = @Code;
END
GO