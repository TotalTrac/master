SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[WarehouseBayDeleteByID]
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;

	DELETE 
		dbo.WarehouseBays
	WHERE
		(BAY_ID = @ID);
	
	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;
END
GO