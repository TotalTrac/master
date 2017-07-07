SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[AddressDeleteByID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;
	
	DELETE 
		[email].[Addresses]
	WHERE
		[email].[Addresses].[Id] = @ID;
END
GO