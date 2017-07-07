SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[SendsGetCountByAddressID] 
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;
	
    SELECT 
		COUNT(Id) 
	FROM 
		[email].[Sends]
	WHERE
		AddressId = @ID;
END
GO