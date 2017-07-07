SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [StVincent].[TemplateCarrierRouteGetByID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		CRRT_ID		
		, CRRT_CRRT
		, CRRT_ZIPCODEID
	FROM
		[StVincent].[TemplateCarrierRoutes]
	WHERE
		CRRT_ID = @ID
	ORDER BY
		CRRT_ID;
END
GO