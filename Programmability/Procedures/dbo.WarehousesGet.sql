﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[WarehousesGet]
	
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		WAREHOUSE_ID
		, WAREHOUSE_CLIENTLOCATIONID
		, WAREHOUSE_NAME
		, WAREHOUSE_ROWVERSION
	FROM 
		dbo.Warehouses;
END
GO