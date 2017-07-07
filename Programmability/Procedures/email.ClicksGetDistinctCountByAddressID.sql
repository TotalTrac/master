SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[ClicksGetDistinctCountByAddressID] 
	@ID int
AS
BEGIN
	
    SELECT 
		COUNT(DISTINCT AddressId) 
	FROM 
		[email].[Clicks]
	WHERE
		AddressId = @ID;
END
GO