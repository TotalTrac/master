﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ProjectsGet]
	
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		PROJECT_ID
		, PROJECT_CLIENTID
		, PROJECT_PARENTID
		, PROJECT_NAME
		, PROJECT_ROWVERSION 
	FROM 
		[dbo].[Projects]
	ORDER BY
		PROJECT_ID;
END
GO