﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [StVincent].[ZipCodesGetAll]
	
AS
BEGIN
	SET NOCOUNT ON;
	
SELECT 
	CAST(RECORD_ZIP AS int) AS ZIPCODE_ID
	,COUNT(*) AS ZIPCODE_SFDU
	,0 AS ZIPCODE_MFDU
	,0 AS ZIPCODE_BUSINESS
	,0 AS ZIPCODE_BOXES
	,0 AS CRRT_TRLR
	,map.ZIPCODE_CITY as ZIPCODE_CITY
	,acx.ZIPCODE_AVERAGEAGE AS ZIPCODE_AVERAGEAGE
	,acx.ZIPCODE_STATE AS ZIPCODE_STATE
	,acx.ZIPCODE_INCOME AS ZIPCODE_INCOME
	,acx.ZIPCODE_MKTMED AS ZIPCODE_MKTMED
	,acx.ZIPCODE_PERCENTCHILD AS ZIPCODE_PERCENTCHILD
	,map.ZIPCODE_LATITUDE as ZIPCODE_LATITUDE
	,map.ZIPCODE_LONGITUDE as ZIPCODE_LONGITUDE
	,NULL AS ZIPCODE_WKB
	,map.ZIPCODE_WKT
  FROM [StVincent].Leads as Leads
  INNER JOIN maponics.ZipCodes map ON Leads.RECORD_ZIP=map.ZIPCODE_ID
  INNER JOIN acxiom.ZipCodes acx on acx.zipcode_id = RECORD_ZIP
  GROUP BY RECORD_ZIP
  	,map.ZIPcode_LATITUDE
	,map.ZIPCODE_LONGITUDE
	,map.ZIPCODE_WKT
	,map.ZIPCODE_CITY
	,acx.ZIPCODE_AVERAGEAGE
	,acx.ZIPCODE_INCOME
	,acx.ZIPCODE_MKTMED
	,acx.ZIPCODE_PERCENTCHILD
	,acx.ZIPCODE_STATE

END
GO