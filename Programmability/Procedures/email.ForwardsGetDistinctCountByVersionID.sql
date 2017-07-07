SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[ForwardsGetDistinctCountByVersionID] 
	@ID int
AS
BEGIN
	
    SELECT 
		COUNT(DISTINCT(f.ForwarderId)) 
	FROM 
		[email].[Forwards] AS f 
		INNER JOIN [email].[Versions] AS v
			ON f.VersionId = v.Id
	WHERE
		v.Id = @ID;
END
GO