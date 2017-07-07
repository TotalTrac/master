SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[CuttingItemUpdate]
@Version				timestamp,
	@Id int,
	@Finalcount int,
	@Finalheight decimal(8, 4),
	@Finalwidth decimal(8, 4),
	@Locationtype int,
  @StartTime DATETIME = NULL,
  @EndTime DATETIME = NULL,
	@Itemid int
    
AS

SET NOCOUNT ON

UPDATE [job].[CuttingItems] SET
	[FinalCount] = @Finalcount,
	[FinalHeight] = @Finalheight,
	[FinalWidth] = @Finalwidth,
	[LocationType] = @Locationtype,
  StartTime = @StartTime,
     EndTime = @EndTime,
	[ItemId] = @Itemid
    OUTPUT inserted.Id AS [ID], inserted.[RowVersion] as [VERSION]
WHERE
	[Id] = @Id
AND [RowVersion] = @Version	

--endregion
GO