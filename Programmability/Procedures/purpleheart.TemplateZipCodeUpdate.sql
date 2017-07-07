SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [purpleheart].[TemplateZipCodeUpdate]
	@ID				int
	, @DepotID		int
	, @ItemID		int	
	, @Published	bit
	, @Version		timestamp
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE [purpleheart].[TemplateZipCodes]
	SET	
		ZIPCODE_DEPOTID	= @DepotID
		, ZIPCODE_ITEMID	= @ItemID
		, ZIPCODE_PUBLISHED = @Published
	OUTPUT 
		inserted.ZIPCODE_ID AS [ID], inserted.ZIPCODE_ROWVERSION AS [VERSION]
	WHERE
		ZIPCODE_ID = @ID;;
END
GO