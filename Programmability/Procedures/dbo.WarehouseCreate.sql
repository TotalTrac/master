SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[WarehouseCreate]
	@ClientLocationID	int
	, @Name				nvarchar(50)
AS
BEGIN

	SET NOCOUNT ON;
	
	INSERT [dbo].[Warehouses]
	(
		WAREHOUSE_CLIENTLOCATIONID
		, WAREHOUSE_NAME
	)
	OUTPUT		
		inserted.WAREHOUSE_ID AS ID, inserted.WAREHOUSE_ROWVERSION AS [VERSION]
	VALUES
	(
		@ClientLocationID
		, @Name
	);
END
GO