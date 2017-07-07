SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[ClicksGetDistinctCountByVersionID] 
	@ID		int
	, @From	datetime = NULL
	, @To	datetime = NULL
AS
BEGIN
	
    SELECT 
		COUNT(DISTINCT(c.AddressId)) 
	FROM 
		[email].[Clicks] c
		INNER JOIN [email].[Addresses] as a
			ON AddressId = a.Id
		INNER JOIN [dbo].[CampaignUsers] cu
			ON a.TargetId = cu.Id			
		INNER JOIN [email].[Versions] as v
			ON VersionId = @ID
		WHERE 
			cu.IsSignoff = 0
			AND (@From IS NULL OR @From >= c.[DateTime])
			AND (@To IS NULL OR @To <= c.[DateTime]);
END
GO