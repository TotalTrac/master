﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [purpleheart].[TemplateZipCodesGet]	
AS
BEGIN
	SET NOCOUNT ON;

    SELECT 
		ZIPCODE_ID
		, ZIPCODE_DEPOTID	
		, ZIPCODE_ITEMID
		, ZIPCODE_PUBLISHED
		, ZIPCODE_ROWVERSION
	FROM
		[purpleheart].[TemplateZipCodes]		
	ORDER BY
		ZIPCODE_ID;
END
GO