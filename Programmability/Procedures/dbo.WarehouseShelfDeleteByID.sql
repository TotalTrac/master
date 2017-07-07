SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[WarehouseShelfDeleteByID]
	@ID	int
AS
BEGIN	
	
	SET NOCOUNT ON;
	
	DELETE 
		WarehouseShelves
	WHERE
		SHELF_ID = @ID;
		
	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;
END
GO