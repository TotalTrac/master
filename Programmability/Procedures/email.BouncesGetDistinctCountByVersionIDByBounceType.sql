SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [email].[BouncesGetDistinctCountByVersionIDByBounceType] 
	@ID			int,
	@BounceType	int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT 
		COUNT(DISTINCT(b.[Id])) 
	FROM 
		[email].[Bounces] AS b
		INNER JOIN [email].[Sends] AS s
			ON b.[SendId] = s.[Id]
		INNER JOIN [email].[Addresses] AS a
			ON s.[AddressId] = a.[Id]
	WHERE
		(b.[Type] & @BounceType > 0) AND
		(a.[VersionId] = @ID);
		
	
END
GO