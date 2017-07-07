SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryItemImageCreate] 
	@ContentType		nvarchar(50) = NULL
	, @Data				varbinary(MAX)
	, @FileExtension	nvarchar(255) = NULL
	, @Index			int
	, @ItemID			int
	, @IsThumbnail		bit
	, @LastUpdated		datetime	
AS
BEGIN
	SET NOCOUNT ON;

    INSERT [dbo].[InventoryItemImages]
	(
		INVENTORYITEMIMAGE_CONTENTTYPE
		, INVENTORYITEMIMAGE_DATA
		, INVENTORYITEMIMAGE_FILEEXTENSION
		, INVENTORYITEMIMAGE_INDEX
		, INVENTORYITEMIMAGE_INVENTORYITEMID
		, INVENTORYITEMIMAGE_ISTHUMBNAIL
		, INVENTORYITEMIMAGE_LASTUPDATED
	)
	OUTPUT
		inserted.INVENTORYITEMIMAGE_ID AS ID, NULL AS [VERSION]
	VALUES
	(
		@ContentType
		, @Data
		, @FileExtension
		, @Index
		, @ItemID
		, @IsThumbnail
		, @LastUpdated
	);	
END
GO