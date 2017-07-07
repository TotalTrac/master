SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[ForwardsGetCountByVersionID] 
	@ID int
AS
BEGIN
	
    SELECT 
		COUNT(f.Id) 
	FROM 
		[email].[Forwards] as f
		INNER JOIN [email].[Versions] AS v
			ON f.VersionId = v.Id
	WHERE
		v.Id = @ID;
END
GO