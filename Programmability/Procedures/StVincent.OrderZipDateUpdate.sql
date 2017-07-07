SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [StVincent].[OrderZipDateUpdate]
	@ID			int
	, @Date		date
	, @DepotID	int
	, @ItemID	int	
	, @Version	timestamp
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE StVincent.[OrderZipDate]
	SET		
		ZIPCODE_DATE		= @Date
		, ZIPCODE_DEPOTID	= @DepotID
		, ZIPCODE_ITEMID	= @ItemID		
	OUTPUT 
		inserted.ZIPCODE_ID AS [ID], inserted.ZIPCODE_ROWVERSION AS [VERSION]
	WHERE
		ZIPCODE_ID = @ID
		AND ZIPCODE_ROWVERSION = @Version;
END
GO