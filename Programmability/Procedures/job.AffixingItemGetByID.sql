﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[AffixingItemGetByID] 
	@ID int
AS
BEGIN

	SET NOCOUNT ON;
    
	SELECT 
		ID
		, [DESCRIPTION]
		, AFFIXINGLOCATIONTYPEID
		, INSERTITEMID
		, INVENTORYITEMID
		, SIZE
		, StampTypeId
    , StartTime
    , EndTime
		, TABBEDEDGES
		, TABS
		, TABTYPEID
		, TYPEID
		, UP
		, XBASELINE
		, XOFFSET
		, YBASELINE
		, YOFFSET
		, [ROWVERSION]
	FROM 
		job.[AffixingItems]
	WHERE 
		ID = @ID;
END
GO