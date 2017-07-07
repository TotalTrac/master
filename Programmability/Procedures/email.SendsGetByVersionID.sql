SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[SendsGetByVersionID] 
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		s.Id 
		, s.AddressId		
		, s.[Send]
		, s.[Sent]		
		, s.[Status]
		, s.[RowVersion]
	FROM 
		[email].[Sends] AS s 
		INNER JOIN [email].[Addresses] AS a 
			ON s.AddressId = a.Id
		INNER JOIN [dbo].[CampaignUsers] AS c
			ON a.TargetId = c.Id
	WHERE
		a.VersionId = @ID AND c.IsSignoff = 0
	ORDER BY 
		s.Id;
END
GO