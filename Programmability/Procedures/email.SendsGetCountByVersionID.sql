SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[SendsGetCountByVersionID] 
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;
	
    SELECT 
		COUNT(s.Id) 
	FROM 
		[email].[Sends] AS s
		INNER JOIN email.Addresses a
			ON s.AddressId = a.Id
		INNER JOIN [dbo].[CampaignUsers] AS c
			ON a.TargetId = c.Id
		INNER JOIN [email].[Versions] AS v
			ON a.VersionId = v.Id
	WHERE
		(c.IsSignoff = 0) AND
		(v.Id = @ID);
END
GO