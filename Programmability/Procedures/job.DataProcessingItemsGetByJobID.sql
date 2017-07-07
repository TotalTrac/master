SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[DataProcessingItemsGetByJobID] 
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;

SELECT
	dpi.[Id],
	[AnalysisType],
	[DataServiceType],
	[Description],
	[KitId],
  [MatchTypeId],
	[MergePurgeType],
	[NcoaDate],
	[NcoaType],
  [ProductionTargetId],
	[ReturnFiles],
	[ReturnFileDescription],
	[SuppressionType],
  dpi.StartTime,
  dpi.EndTime,
	dpi.[RowVersion]
FROM
	[job].[DataProcessingItem] AS dpi
  INNER JOIN job.Kits k ON k.ID = dpi.KitId
  
WHERE
	k.JobID = @Id
END
GO