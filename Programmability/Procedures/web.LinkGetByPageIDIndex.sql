﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[LinkGetByPageIDIndex]
	@ID		int,
	@Index	int
AS
BEGIN
	
    SET NOCOUNT ON;
    
    SELECT 
		LINK_ID
		, LINK_INDEX
		, LINK_PAGEID
		, LINK_TEXT
		, LINK_TITLE
		, LINK_URL
		, LINK_ROWVERSION
	FROM
		[web].[Links]
	WHERE
		(LINK_PAGEID = @ID) AND
		(LINK_INDEX = @Index);
END
GO