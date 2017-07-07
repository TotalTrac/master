SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [purpleheart].[TemplateZipCodeCreate]
	@DepotID		int
	, @ItemID		int	
	, @Published	bit
AS
BEGIN
	SET NOCOUNT ON;

    INSERT [purpleheart].[TemplateZipCodes]
	(		
		ZIPCODE_DEPOTID
		, ZIPCODE_ITEMID
		, ZIPCODE_PUBLISHED
	)
	OUTPUT inserted.ZIPCODE_ID AS [ID], inserted.ZIPCODE_ROWVERSION AS [VERSION]
	VALUES
	(
		@DepotID
		, @ItemID
		, @Published
	);	
END
GO