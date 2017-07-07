SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [purpleheart].[OrderZipCodesGetByDepotIDByDate]
	@ID		int
	, @Date	date
AS
BEGIN
	SET NOCOUNT ON;

    SELECT 
		ph.ZIPCODE_ID
		, ph.ZIPCODE_DATE		
		, ph.ZIPCODE_DEPOTID
		, ph.ZIPCODE_ITEMID		
		, ph.ZIPCODE_ROWVERSION
	FROM
		[purpleheart].[OrderZipCodes] AS ph		
	WHERE
		ph.ZIPCODE_DEPOTID = @ID
		AND ph.ZIPCODE_DATE = @Date;
END
GO