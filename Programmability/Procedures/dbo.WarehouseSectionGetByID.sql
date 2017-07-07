﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[WarehouseSectionGetByID]
	@ID				int
AS
BEGIN	
	SET NOCOUNT ON;
	
	SELECT
		SECTION_ID
		, SECTION_NAME
		, SECTION_WAREHOUSEID
		, SECTION_ROWVERSION
	FROM 
		WarehouseSections
	WHERE
		SECTION_ID = @ID;
END
GO