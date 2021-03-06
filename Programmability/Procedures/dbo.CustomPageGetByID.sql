﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CustomPageGetByID]
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;
    
	SELECT 
		c.CUSTOMPAGE_ID
		, c.CUSTOMPAGE_CLIENTID
		, c.CUSTOMPAGE_DESCRIPTION
		, c.CUSTOMPAGE_TITLE
		, c.CUSTOMPAGE_URL
		, c.CUSTOMPAGE_ROWVERSION
	FROM 
		[dbo].[CustomPages] AS c
	WHERE
		c.CUSTOMPAGE_ID = @ID
	ORDER BY 
		c.CUSTOMPAGE_ID;
END
GO