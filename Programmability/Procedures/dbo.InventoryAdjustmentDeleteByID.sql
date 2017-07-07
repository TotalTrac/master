SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryAdjustmentDeleteByID]
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	DELETE 
		[dbo].[InventoryAdjustments]
	WHERE
		ADJUSTMENT_ID = @ID;

	IF @@ROWCOUNT > 0 
		RETURN 0;
	ELSE
		RETURN 1;
END
GO