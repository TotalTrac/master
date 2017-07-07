SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[BouncesGetDistinctCountByVersionIDByDomain]
	@ID		int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT		
		RIGHT(u.[EmailAddress], CHARINDEX('@', REVERSE(u.[EmailAddress]))-1) AS [Domain Name], 
		COUNT(DISTINCT u.[EmailAddress]) AS [Number of Subscribers]	
	FROM 
		[email].[Bounces] AS b
		INNER JOIN [email].[Sends] AS s
			ON b.[SendId] = s.[Id]
		INNER JOIN [email].[Addresses] AS a
			ON s.[AddressId] = a.[Id]
		INNER JOIN [dbo].[CampaignUsers] AS u
			ON a.[TargetId] = u.[Id]
	WHERE
		a.[VersionId] = @ID
		AND (CHARINDEX('@',u.[EmailAddress],0) > 0)		
	GROUP BY 
		RIGHT(u.[EmailAddress], CHARINDEX('@', REVERSE(u.[EmailAddress]))-1)
	ORDER BY [Number of Subscribers] DESC, [Domain Name]
END
GO