﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ComminglersGet]
	
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		COMMINGLER_ID
		, COMMINGLER_ADDRESS1
		, COMMINGLER_ADDRESS2		
		, COMMINGLER_CITY
		, COMMINGLER_CONTACT
		, COMMINGLER_EMAIL		
		, COMMINGLER_FAX
		, COMMINGLER_INTERNAL
		, COMMINGLER_LEGALNAME
		, COMMINGLER_NAME
		, COMMINGLER_PARENTID
		, COMMINGLER_PHONE
		, COMMINGLER_POSTALCODE
		, COMMINGLER_PUBLIC
		, COMMINGLER_REGION
		, COMMINGLER_SHORTNAME		
		, COMMINGLER_URL
		, COMMINGLER_ROWVERSION
	FROM 
		[dbo].[Comminglers]
	ORDER BY 
		COMMINGLER_ID;
END
GO