SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[SendGetByID]
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
		Id = @ID;
END
GO