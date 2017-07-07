SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[ButtonsGetByVersionID]
	@ID			int
AS
BEGIN
	
    SET NOCOUNT ON;
    
    SELECT 
		l.BUTTON_ID				
		, l.BUTTON_NAME
		, l.BUTTON_PAGEID
		, l.BUTTON_TITLE		
		, l.BUTTON_ROWVERSION
	FROM
		[web].[Buttons] AS l
		INNER JOIN [web].[Pages] AS p
			ON p.PAGE_ID = l.BUTTON_PAGEID		
	WHERE
		p.PAGE_VERSIONID = @ID
END
GO