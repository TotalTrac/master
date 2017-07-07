SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[AddressHasBeenScheduled]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;
    
	IF EXISTS (
		SELECT TOP 1
			Id
		FROM 
			[email].[Sends]			
		WHERE
			AddressId = @ID			
	)			
		RETURN 1;
	ELSE
		RETURN 0;
END
GO