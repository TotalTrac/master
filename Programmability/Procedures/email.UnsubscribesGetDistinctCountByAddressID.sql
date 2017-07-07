SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[UnsubscribesGetDistinctCountByAddressID] 
	@ID	int
AS
BEGIN
	SELECT 
		COUNT(DISTINCT(AddressId)) 
	FROM 
		[email].[Unsubscribes]
	WHERE 
		AddressId = @ID;
END
GO