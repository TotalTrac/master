SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[AffixingItemsGetByJobID] 
	@ID int
AS
BEGIN

	SET NOCOUNT ON;
    
	SELECT  
		i.ID
		, i.AFFIXINGLOCATIONTYPEID
		, i.[DESCRIPTION]
		, i.INSERTITEMID
		, i.INVENTORYITEMID
		, i.SIZE
		, i.StampTypeId
    , i.StartTime
    , i.EndTime
		, i.TABBEDEDGES
		, i.TABS
		, i.TABTYPEID
		, i.TYPEID
		, i.UP
		, i.XBASELINE
		, i.XOFFSET
		, i.YBASELINE
		, i.YOFFSET
		, i.[ROWVERSION]
	FROM 
		job.[AffixingItems] as i
		INNER JOIN job.InsertionItems as k
			ON i.INSERTITEMID = k.ID
		INNER JOIN job.Kits as kit
			ON k.KITID = kit.ID
	WHERE 
		kit.JobId = @ID
	ORDER BY
		i.ID;	
END
GO