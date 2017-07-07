SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [acxiom].[TemplateCarrierRoutesGetByZipCodeID]
	@ID						int
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
	ORDER BY
		CRRT_ID;
END
GO