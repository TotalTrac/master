SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ComminglerClientLocationDeleteById] 
	@ID int
AS
BEGIN
	
	DELETE 
		[dbo].[ComminglerClientLocations] 
	WHERE 
		COMMINGLERLOCATION_ID = @ID;

	IF @@ROWCOUNT > 0
		RETURN 0
	ELSE
		RETURN 1;
END
GO