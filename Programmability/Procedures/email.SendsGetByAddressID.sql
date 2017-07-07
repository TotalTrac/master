SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[SendsGetByAddressID]
	@ID	int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT 
		Id
		, AddressId		
		, [Send]
		, [Sent]
		, [Status]
		, [RowVersion] 
	FROM 
		[email].[Sends]
	WHERE
		AddressId = @ID
	ORDER BY 
		Id;
END
GO