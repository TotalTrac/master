﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[PageGetByID]
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;
    
	SELECT 
		PAGE_ID 		
		, PAGE_LINKSREGISTERED
		, PAGE_NAME
		, PAGE_REQUESTTIMEOUT
		, PAGE_TYPE
		, PAGE_URL
		, PAGE_VERSIONID
		, PAGE_ROWVERSION 
	FROM 
		[web].[Pages] 
	WHERE 
		PAGE_ID = @ID;
END
GO