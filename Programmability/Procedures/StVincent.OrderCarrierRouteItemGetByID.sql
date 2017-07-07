﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [StVincent].[OrderCarrierRouteItemGetByID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		CRRT_ID
		, CRRT_AVAILABLE
		, CRRT_CARRIERROUTEID
		, CRRT_COUNTRESULTID
		, CRRT_REQUESTED
		, CRRT_SELECTED
		, CRRT_TYPE		
		, CRRT_ROWVERSION
	FROM
		StVincent.[OrderCarrierRouteItems]
	WHERE
		CRRT_ID = @ID
	ORDER BY
		CRRT_ID;
END
GO