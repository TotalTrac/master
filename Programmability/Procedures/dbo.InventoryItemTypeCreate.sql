SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[InventoryItemTypeCreate] 
	@Name			nvarchar(50)	
	, @IsContainer	bit
	, @IsSelfMailer	bit
AS
BEGIN

	SET NOCOUNT ON;
	
	INSERT [dbo].[InventoryItemTypes]
	(	
		INVENTORYITEMTYPE_NAME		
		, INVENTORYITEMTYPE_ISCONTAINER
		, INVENTORYITEMTYPE_ISSELFMAILER
	) 
	OUTPUT
		inserted.INVENTORYITEMTYPE_ID AS ID, NULL AS [VERSION]
	VALUES 
	(
		@Name		
		, @IsContainer
		, @IsSelfMailer
	);
END
GO