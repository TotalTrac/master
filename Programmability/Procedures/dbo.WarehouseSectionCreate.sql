SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[WarehouseSectionCreate]
	@Name			nvarchar(50),
	@WarehouseID	int
AS
BEGIN

	SET NOCOUNT ON;
	
	INSERT [dbo].[WarehouseSections]
	(
		SECTION_NAME,
		SECTION_WAREHOUSEID
	)
	OUTPUT
		inserted.SECTION_ID AS ID, inserted.SECTION_ROWVERSION AS [VERSION]
	VALUES
	(
		@Name,
		@WarehouseID
	);
END
GO