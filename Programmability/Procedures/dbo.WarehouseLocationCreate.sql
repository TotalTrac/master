SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[WarehouseLocationCreate]
	@Description		nvarchar(50)
	, @HorizontalPos	int
	, @ShelfID			int
AS
BEGIN

	SET NOCOUNT ON;
	
	INSERT [dbo].[WarehouseLocations]
	(
		LOCATION_DESCRIPTION
		, LOCATION_HORIZONTALPOS
		, LOCATION_SHELFID		
	)
	OUTPUT		
		inserted.LOCATION_ID AS ID, inserted.LOCATION_ROWVERSION AS [VERSION]
	VALUES
	(
		@Description
		, @HorizontalPos
		, @ShelfID		
	);
END
GO