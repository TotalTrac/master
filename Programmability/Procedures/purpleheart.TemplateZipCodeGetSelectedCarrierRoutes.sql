SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [purpleheart].[TemplateZipCodeGetSelectedCarrierRoutes]
	@ZipCode	char(5)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		z.ZIPCODE_NAME						AS [NAME]
		, z.ZIPCODE_ZIPCODE + c.CRRT_CRRT	AS [ZIPCODECRRT]		
	FROM 
		[acxiom].[TemplateCarrierRoutes] AS c
		INNER JOIN [acxiom].[TemplateCarrierRouteItems] AS i
			ON c.CRRT_ID = i.CRRT_CARRIERROUTEID
		INNER JOIN [acxiom].[TemplateZipCodes] AS z
			ON c.CRRT_ZIPCODEID = z.ZIPCODE_ID
		INNER JOIN [purpleheart].[OrderZipCodes] AS ph
			ON z.ZIPCODE_ID = ph.ZIPCODE_ITEMID
	WHERE
		i.CRRT_SELECTED = 1
		AND z.ZIPCODE_ZIPCODE = @ZipCode
	GROUP BY
		z.ZIPCODE_NAME
		, z.ZIPCODE_ZIPCODE + c.CRRT_CRRT	
END
GO