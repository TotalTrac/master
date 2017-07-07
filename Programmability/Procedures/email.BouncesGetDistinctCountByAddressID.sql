SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[BouncesGetDistinctCountByAddressID] 
	@ID	int
AS
BEGIN
	SELECT 
		COUNT(DISTINCT(b.[Id])) 
	FROM 
		[email].[Bounces] AS b
		INNER JOIN [email].[Sends] AS s
			ON b.[SendId] = s.[Id]
	WHERE 
		s.[AddressId] = @ID;
END
GO