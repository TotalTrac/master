﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [purpleheart].[TemplateZipCodeGetByDepotID]
	@ID				int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT 
		ph.ZIPCODE_ID			
		, z.ZIPCODE_CREATED
		, z.ZIPCODE_CREATEDBYID		
		, ph.ZIPCODE_DEPOTID	
		, z.ZIPCODE_NAME
		, ph.ZIPCODE_PUBLISHED
		, z.ZIPCODE_ZIPCODE
		, z.ZIPCODE_ROWVERSION
	FROM
		[purpleheart].[TemplateZipCodes] AS ph
		INNER JOIN [acxiom].[TemplateZipCodes] AS z
			ON ph.ZIPCODE_ITEMID = z.ZIPCODE_ID		
	WHERE
		ph.ZIPCODE_DEPOTID = @ID;
END
GO