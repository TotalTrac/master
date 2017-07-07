﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [acxiom].[OrderCarrierRouteItemsGetByCarrierRouteID]
	@ID						int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		i.CRRT_ID
		, i.CRRT_AVAILABLE
		, i.CRRT_CARRIERROUTEID
		, i.CRRT_COUNTRESULTID
		, i.CRRT_REQUESTED
		, i.CRRT_SELECTED
		, i.CRRT_TYPE		
		, i.CRRT_ROWVERSION
	FROM
		[acxiom].[OrderCarrierRouteItems] AS i		
	WHERE
		i.CRRT_CARRIERROUTEID = @ID
	ORDER BY
		i.CRRT_ID;
END
GO