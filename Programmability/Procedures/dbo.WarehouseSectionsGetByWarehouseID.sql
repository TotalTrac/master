﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[WarehouseSectionsGetByWarehouseID]
	@ID	int
AS	
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		SECTION_ID,
		SECTION_NAME,
		SECTION_WAREHOUSEID,
		SECTION_ROWVERSION 
	FROM 
		WarehouseSections
	WHERE
		SECTION_WAREHOUSEID = @ID;	
END
GO