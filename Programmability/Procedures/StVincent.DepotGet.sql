﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [StVincent].[DepotGet]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT 
		DEPOT_ID
		, DEPOT_NAME
	FROM
		StVincent.[Depots]
	ORDER BY
		DEPOT_ID;
END
GO