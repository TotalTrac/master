﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[WarehouseDeleteByID]
	@ID		int
AS
BEGIN
	SET NOCOUNT ON;

	DELETE Warehouses WHERE WAREHOUSE_ID = @ID;
	
	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;
END
GO