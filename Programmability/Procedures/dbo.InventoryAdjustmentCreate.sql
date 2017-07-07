SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[InventoryAdjustmentCreate] 	
	@Adjustment		int
	, @Created		datetime
	, @CreatedByID	int	
	, @Description	nvarchar(100)
	, @ItemID		int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	INSERT [dbo].[InventoryAdjustments]
	(		
		ADJUSTMENT_ADJUSTMENT
		, ADJUSTMENT_CREATED
		, ADJUSTMENT_CREATEDBYID
		, ADJUSTMENT_DESCRIPTION
		, ADJUSTMENT_INVENTORYITEMID
	)
	OUTPUT
		inserted.ADJUSTMENT_ID AS ID, NULL AS [VERSION]
	VALUES
	(		
		@Adjustment
		, @Created
		, @CreatedByID
		, @Description
		, @ItemID
	);    
END
GO