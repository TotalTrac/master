SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[WarehouseSectionUpdate]
	@ID				int,
	@Name			nvarchar(50),
	@WarehouseID	int,
	@Version		timestamp
AS
BEGIN

	SET NOCOUNT ON;
	
	UPDATE [dbo].[WarehouseSections]
	SET
		SECTION_NAME = @Name,
		SECTION_WAREHOUSEID = @WarehouseID
	OUTPUT
		inserted.SECTION_ID AS ID, inserted.SECTION_ROWVERSION AS [VERSION]
	WHERE
		(SECTION_ID = @ID) AND
		(SECTION_ROWVERSION = @Version);
END
GO