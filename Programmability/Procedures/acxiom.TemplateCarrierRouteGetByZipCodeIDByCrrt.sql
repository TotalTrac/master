SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [acxiom].[TemplateCarrierRouteGetByZipCodeIDByCrrt]
	@ID				int
	, @CarrierRoute	char(4)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		CRRT_ID		
		, CRRT_CRRT
		, CRRT_ZIPCODEID
	FROM
		[acxiom].[TemplateCarrierRoutes]
	WHERE
		CRRT_ZIPCODEID = @ID
		AND CRRT_CRRT = @CarrierRoute
	ORDER BY
		CRRT_ID;
END
GO