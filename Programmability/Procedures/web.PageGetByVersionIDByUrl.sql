﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[PageGetByVersionIDByUrl]
	@ID		int
	, @Url	nvarchar(200)
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
		P.PAGE_VERSIONID = @ID  
		AND P.PAGE_URL = @Url;
END
GO