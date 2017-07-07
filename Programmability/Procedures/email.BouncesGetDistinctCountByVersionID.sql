SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[BouncesGetDistinctCountByVersionID] 
	@ID int
AS
BEGIN
	
    SELECT 
		COUNT(DISTINCT(b.[Id])) 
	FROM 
		[email].[Bounces] AS b
		INNER JOIN [email].[Sends] AS s
			ON b.[SendId] = s.[Id]
		INNER JOIN [email].[Addresses] AS a
			ON s.[AddressId] = a.[Id]
	WHERE
		a.[VersionId] = @ID;
END
GO