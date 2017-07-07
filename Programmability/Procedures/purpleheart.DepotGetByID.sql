﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [purpleheart].[DepotGetByID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT 
		DEPOT_ID
		, DEPOT_NAME
	FROM
		[purpleheart].[Depots]
	WHERE
		DEPOT_ID = @ID
END
GO