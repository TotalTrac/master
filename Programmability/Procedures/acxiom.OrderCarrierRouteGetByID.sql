SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [acxiom].[OrderCarrierRouteGetByID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		CRRT_ID		
		, CRRT_CRRT
		, CRRT_ZIPCODEID
	FROM
		[acxiom].[OrderCarrierRoutes]
	WHERE
		CRRT_ID = @ID
	ORDER BY
		CRRT_ID;
END
GO