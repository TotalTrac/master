SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[UnsubscribesGetCountByAddressID] 
	@ID int
AS
BEGIN
	
    SELECT 
		COUNT(Id) 
	FROM 
		[email].[Unsubscribes]
	WHERE
		AddressId = @ID;
END
GO