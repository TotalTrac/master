SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[WarehouseShelfCreate]
	@BayID			int,	
	@VerticalPos	int
AS
BEGIN

	SET NOCOUNT ON;
	
	INSERT [dbo].[WarehouseShelves]
	(
		SHELF_BAYID,		
		SHELF_VERTICALPOS
	)
	OUTPUT
		inserted.SHELF_ID AS ID, inserted.SHELF_ROWVERSION AS [VERSION]
	VALUES
	(
		@BayID,		
		@VerticalPos
	);
END
GO