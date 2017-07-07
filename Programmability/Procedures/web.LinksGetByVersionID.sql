SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[LinksGetByVersionID]
	@ID			int
AS
BEGIN
	
    SET NOCOUNT ON;
    
    SELECT 
		l.LINK_ID
		, l.LINK_INDEX
		, l.LINK_PAGEID
		, l.LINK_TEXT
		, l.LINK_TITLE
		, l.LINK_URL
		, l.LINK_ROWVERSION
	FROM
		[web].[Links] AS l
		INNER JOIN [web].[Pages] AS p
			ON p.PAGE_ID = l.LINK_PAGEID		
	WHERE
		p.PAGE_VERSIONID = @ID;
END
GO