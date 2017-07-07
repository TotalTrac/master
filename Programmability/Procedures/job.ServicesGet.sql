﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[ServicesGet] 
	
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		s.SERVICE_ID
		, s.[SERVICE_NAME]
		, s.SERVICE_PRICEMINIMUM 
		, s.SERVICE_RUNRATE
		, s.SERVICE_THIRDPARTY
		, s.SERVICE_TYPEID
    , s.SERVICE_UNIT
		, s.SERVICE_UNITPRICE
		, s.SERVICE_ROWVERSION
	FROM 
		job.[Services] AS s
	ORDER BY 
		SERVICE_ID;
		
END
GO