SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[BouncesGetCountByAddressID] 
	@ID int
AS
BEGIN
	
    SELECT 
		COUNT(b.Id) 
	FROM 
		[email].[Bounces] AS b
		INNER JOIN [email].[Sends] AS s
			ON b.[SendId] = s.[Id]
	WHERE
		s.[AddressId] = @ID;
END
GO