SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [StVincent].[TemplateCarrierRoutesGetByZipCodeID]
	@ID						int
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
		CRRT_ZIPCODEID = @ID
	ORDER BY
		CRRT_ID;
END
GO