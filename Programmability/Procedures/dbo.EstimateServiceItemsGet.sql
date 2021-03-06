﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[EstimateServiceItemsGet]
	
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		ESTIMATESERVICE_ID
		, ESTIMATESERVICE_DESCRIPTION
		, ESTIMATESERVICE_ESTIMATEID
		, ESTIMATESERVICE_EXTENDEDPRICE
		, ESTIMATESERVICE_QUANTITY
		, ESTIMATESERVICE_SERVICENAME
		, ESTIMATESERVICE_SERVICETYPEID
		, ESTIMATESERVICE_UNITPRICE
		, ESTIMATESERVICE_ROWVERSION
	FROM
		[dbo].[EstimateServiceItems]
	ORDER BY
		ESTIMATESERVICE_ID;
END
GO