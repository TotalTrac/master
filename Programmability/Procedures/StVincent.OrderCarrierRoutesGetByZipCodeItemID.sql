SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [StVincent].[OrderCarrierRoutesGetByZipCodeItemID]
	@ID						int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		CRRT_ID		
		, CRRT_CRRT
		, CRRT_ZIPCODEID
	FROM
		StVincent.[OrderCarrierRoutes]		
	WHERE
		CRRT_ZIPCODEID = @ID
	ORDER BY
		CRRT_ID;
END
GO