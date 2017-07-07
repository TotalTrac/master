SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[WarehouseUpdate]
	@ID					int
	, @ClientLocationID	int
	, @Name				nvarchar(50)
	, @Version			timestamp
AS
BEGIN

	SET NOCOUNT ON;
	
	UPDATE 
		[dbo].[Warehouses]
	SET
		WAREHOUSE_CLIENTLOCATIONID = @ClientLocationID
		, WAREHOUSE_NAME = @Name
	OUTPUT
		inserted.WAREHOUSE_ID AS ID, inserted.WAREHOUSE_ROWVERSION AS [VERSION]
	WHERE
		(WAREHOUSE_ID = @ID) AND
		(WAREHOUSE_ROWVERSION = @Version);
END
GO