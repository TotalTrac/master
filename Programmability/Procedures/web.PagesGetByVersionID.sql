﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[PagesGetByVersionID]
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;
    
	SELECT
		p.PAGE_ID		
		, p.PAGE_LINKSREGISTERED
		, p.PAGE_NAME
		, p.PAGE_REQUESTTIMEOUT
		, p.PAGE_TYPE
		, p.PAGE_URL
		, p.PAGE_VERSIONID
		, p.PAGE_ROWVERSION
	FROM 
		[web].[Pages] AS p
	WHERE 
		p.PAGE_VERSIONID = @ID
	ORDER BY 
		p.PAGE_ID;
END
GO