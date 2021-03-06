﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[CountryGetByCode]
	@Code	varchar(3)
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
	WHERE
		@Code =
			CASE WHEN LEN(@Code) = 2 THEN COUNTRY_CODE2
				WHEN LEN(@Code) = 3 THEN COUNTRY_CODE3
			END
END
GO