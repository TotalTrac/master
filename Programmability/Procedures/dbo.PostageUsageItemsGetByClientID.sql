﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[PostageUsageItemsGetByClientID]
	@ID	int
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT 
		ui.POSTAGEUSAGEITEM_ID
		, ui.POSTAGEUSAGEITEM_DATETIME	
		, ui.POSTAGEUSAGEITEM_PACKAGEID
		, ui.POSTAGEUSAGEITEM_QUANTITY
		, ui.POSTAGEUSAGEITEM_RATE
		, ui.POSTAGEUSAGEITEM_ROWVERSION
	FROM 
		[dbo].[PostageUsageItems] AS ui
		INNER JOIN [dbo].[Packages] AS p
			ON ui.POSTAGEUSAGEITEM_PACKAGEID = p.PACKAGE_ID
		INNER JOIN [dbo].[Jobs] AS j
			ON p.PACKAGE_JOBID = j.JOB_ID			
	WHERE 
		j.JOB_CLIENTID = @ID
	ORDER BY
		ui.POSTAGEUSAGEITEM_ID;
		
END
GO