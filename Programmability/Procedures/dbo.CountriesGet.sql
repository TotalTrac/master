﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[CountriesGet] 
	
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		COUNTRY_ID
		, COUNTRY_CODE2
		, COUNTRY_CODE3
		, COUNTRY_NAME
	FROM 
		[dbo].[Countries]
	ORDER BY 
		COUNTRY_NAME;
END
GO