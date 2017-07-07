﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[CampaignsGetAutoComplete]
	@ID				int
	, @Substring	nvarchar(255)
AS
BEGIN
			
	SET NOCOUNT ON;

    WITH CTE (CLIENT_ID)
	AS
	(
		(SELECT c.CLIENT_ID
		FROM [dbo].[Clients] AS c
			INNER JOIN [dbo].[Relationships] AS r
				ON c.CLIENT_ID = r.RELATIONSHIP_CLIENTID
		WHERE 
			c.CLIENT_PARENTID IS NULL
			AND r.RELATIONSHIP_USERID = @ID

			UNION
		
		SELECT 
			c.CLIENT_ID
		FROM [dbo].[Clients] AS c
			INNER JOIN [dbo].[Users] AS u
				ON c.CLIENT_ID = u.USER_CLIENT_ID
		WHERE 
			u.USER_USERID = @ID
		)
			
		UNION ALL

		SELECT 
			c.CLIENT_ID
		FROM [dbo].[Clients] AS c
			INNER JOIN [dbo].[Relationships] AS r
				ON c.CLIENT_ID = r.RELATIONSHIP_CLIENTID
			INNER JOIN CTE
				ON CTE.CLIENT_ID = c.CLIENT_PARENTID
		WHERE 
			c.CLIENT_PARENTID IS NOT NULL
			AND r.RELATIONSHIP_USERID = @ID
	)	
	SELECT
		CAMPAIGN_ID
		, CAMPAIGN_BEGIN
		, CAMPAIGN_CAMPAIGNID
		, CAMPAIGN_CLIENTID
		, CAMPAIGN_CREATED
		, CAMPAIGN_CUSTOMREPORTURL
		, CAMPAIGN_END
		, CAMPAIGN_KEY
		, CAMPAIGN_NAME
		, CAMPAIGN_TRACKANONYMOUSEVENTS
		, CAMPAIGN_ROWVERSION
	FROM 
		[web].[Campaigns]
		INNER JOIN CTE
			ON CTE.CLIENT_ID = CAMPAIGN_CLIENTID
	WHERE
		CAMPAIGN_NAME LIKE '%' + @Substring + '%'		
END
GO