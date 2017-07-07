SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[WarehouseShelfUpdate]
	@ID				int,
	@BayID			int,	
	@VerticalPos	int,
	@Version		timestamp
AS
BEGIN

	SET NOCOUNT ON;
	
	UPDATE 
		[dbo].[WarehouseShelves]
	SET
		SHELF_BAYID = @BayID,		
		SHELF_VERTICALPOS = @VerticalPos
	OUTPUT
		inserted.SHELF_ID AS ID, inserted.SHELF_ROWVERSION AS [VERSION]
	WHERE
		(SHELF_ID = @ID) AND
		(SHELF_ROWVERSION = @Version);
END
GO