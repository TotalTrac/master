SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[SendsGetDistinctCountByAddressID] 
	@ID	int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT 
		COUNT(DISTINCT(AddressId)) 
	FROM 
		[email].[Sends]
	WHERE 
		AddressId = @ID;
END
GO