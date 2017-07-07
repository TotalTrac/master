SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [purpleheart].[OrderZipCodeCreate]
	@Date		date
	, @DepotID	int
	, @ItemID	int	
AS
BEGIN
	SET NOCOUNT ON;

    INSERT [purpleheart].[OrderZipCodes]
	(
		ZIPCODE_DATE
		, ZIPCODE_DEPOTID
		, ZIPCODE_ITEMID		
	)
	OUTPUT inserted.ZIPCODE_ID AS [ID], inserted.ZIPCODE_ROWVERSION AS [VERSION]
	VALUES
	(
		@Date
		, @DepotID
		, @ItemID		
	);	
END
GO