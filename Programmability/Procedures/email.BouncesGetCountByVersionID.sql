SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[BouncesGetCountByVersionID] 
	@ID int
AS
BEGIN
	
    SELECT 
		COUNT(b.[Id]) 
	FROM 
		[email].[Bounces] AS b
		INNER JOIN [email].[Sends] AS s
			ON b.[SendId] = s.[Id]
		INNER JOIN [email].[Addresses] AS a
			ON s.[AddressId] = a.[Id]
		INNER JOIN [email].[Versions] AS v
			ON a.[VersionId] = v.[Id]
	WHERE
		v.[Id] = @ID;
END
GO