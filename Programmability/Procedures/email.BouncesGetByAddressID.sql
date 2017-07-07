SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[BouncesGetByAddressID]
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
	WHERE 
		s.[AddressId] = @ID;
END
GO