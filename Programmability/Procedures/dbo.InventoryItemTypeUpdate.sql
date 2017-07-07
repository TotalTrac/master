SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[InventoryItemTypeUpdate] 
	@ID				int
	, @Name			nvarchar(50)	
	, @IsContainer	bit
	, @IsSelfMailer bit
	
AS
BEGIN

	SET NOCOUNT ON;
	
	UPDATE [dbo].[InventoryItemTypes]
	SET	
		INVENTORYITEMTYPE_NAME				= @Name
		, INVENTORYITEMTYPE_ISCONTAINER		= @IsContainer	
		, INVENTORYITEMTYPE_ISSELFMAILER	= @IsSelfMailer
	OUTPUT
		inserted.INVENTORYITEMTYPE_ID AS ID, NULL AS [VERSION];
END
GO