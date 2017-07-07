﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [StVincent].[DepotGetByID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT 
		DEPOT_ID
		, DEPOT_NAME
	FROM
		StVincent.[Depots]
	WHERE
		DEPOT_ID = @ID
END
GO