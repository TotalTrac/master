SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[BouncesGetByVersionID] 
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		b.[Id]
		, b.[Data]
		, b.[DateTime]		
		, b.[SendId]
		, b.[Type]
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