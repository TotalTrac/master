﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CustomPagesGetByUserID]
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;
    	
	SELECT 
		p.CUSTOMPAGE_ID
		, p.CUSTOMPAGE_CLIENTID
		, p.CUSTOMPAGE_DESCRIPTION
		, p.CUSTOMPAGE_TITLE
		, p.CUSTOMPAGE_URL
		, p.CUSTOMPAGE_ROWVERSION
	FROM 
		[dbo].[CustomPages] AS p
		INNER JOIN [dbo].[Relationships] AS r
			ON p.CUSTOMPAGE_CLIENTID = r.RELATIONSHIP_CLIENTID
				AND r.RELATIONSHIP_USERID = @ID;
END
GO