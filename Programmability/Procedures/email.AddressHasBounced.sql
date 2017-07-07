SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[AddressHasBounced]
	@Address		nvarchar(320)
	, @VersionID	int	
AS
BEGIN
	SET NOCOUNT ON;
    
	DECLARE @ClientID int;
	
	SELECT 
		@CLientID = j.[JOB_CLIENTID]
	FROM 
		[email].[Versions] AS v
		INNER JOIN [job].[Jobs] AS j
			ON v.[JobId] = j.[JOB_ID]
	WHERE
		v.[Id] = @VersionID;
			

	IF EXISTS (
		SELECT TOP 1
			b.[Id] 
		FROM
			[job].[Jobs] AS j
			INNER JOIN [dbo].[Campaigns] AS c
				ON c.[JobId] = j.[JOB_ID]
			INNER JOIN [dbo].[CampaignUsers] AS u
				ON c.[Id] = u.[CampaignId]
			INNER JOIN [email].[Addresses] AS a
				ON u.[Id] = a.[TargetId]
			INNER JOIN [email].[Sends] AS s
				ON a.[Id] = s.[AddressId]
			INNER JOIN [email].[Bounces] AS b
				ON s.[Id] = b.[SendId]
		WHERE
			u.[EmailAddress]		= @Address
			AND j.[JOB_CLIENTID]	= @ClientID
			AND b.[Type]			= 1
	)			
		RETURN 1;
	ELSE
		RETURN 0;
END
GO