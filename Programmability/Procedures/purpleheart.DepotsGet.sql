﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [purpleheart].[DepotsGet]
	
AS
BEGIN
	SET NOCOUNT ON;

    SELECT 
		DEPOT_ID
		, DEPOT_NAME
	FROM
		[purpleheart].[Depots]
	ORDER BY
		DEPOT_ID;
END
GO