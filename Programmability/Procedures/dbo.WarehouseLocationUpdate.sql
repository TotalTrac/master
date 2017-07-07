SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[WarehouseLocationUpdate]
	@ID					int
	, @Description		nvarchar(50)
	, @HorizontalPos	int
	, @ShelfID			int	
	, @version			timestamp
AS
BEGIN

	SET NOCOUNT ON;
	
	UPDATE [dbo].[WarehouseLocations]
	SET
		LOCATION_DESCRIPTION		= @Description
		, LOCATION_HORIZONTALPOS	= @HorizontalPos
		, LOCATION_SHELFID			= @ShelfID		
	OUTPUT
		inserted.LOCATION_ID AS ID, inserted.LOCATION_ROWVERSION AS [VERSION]
	WHERE
		(LOCATION_ID = @ID) AND
		(LOCATION_ROWVERSION = @Version);
END
GO