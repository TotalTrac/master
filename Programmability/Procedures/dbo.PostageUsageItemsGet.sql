﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[PostageUsageItemsGet]
	
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT 
		POSTAGEUSAGEITEM_ID
		, POSTAGEUSAGEITEM_DATETIME		
		, POSTAGEUSAGEITEM_PACKAGEID
		, POSTAGEUSAGEITEM_QUANTITY
		, POSTAGEUSAGEITEM_RATE
		, POSTAGEUSAGEITEM_ROWVERSION
	FROM 
		[dbo].[PostageUsageItems]  
	ORDER BY 
		POSTAGEUSAGEITEM_ID;	
END
GO