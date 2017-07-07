SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ComminglerDeleteById] 
	@ID int
AS
BEGIN
	
	DELETE 
		[dbo].[Comminglers] 
	WHERE 
		COMMINGLER_ID = @ID;

	IF @@ROWCOUNT > 0
		RETURN 0
	ELSE
		RETURN 1;
END
GO