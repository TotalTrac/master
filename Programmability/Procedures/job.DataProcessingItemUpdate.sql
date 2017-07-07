﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [job].[DataProcessingItemUpdate]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[DataProcessingItemUpdate]
-- Date Generated: Monday, February 29, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[DataProcessingItemUpdate]
@Version				timestamp,
	@Id int,
	@Analysistype int,
	@Dataservicetype int,
	@Description varchar(max),
	@Kitid int,
  @MatchTypeId INT = NULL,
	@Mergepurgetype int,
	@Ncoadate date,
	@Ncoatype int,
  @ProductionTargetId INT = NULL,
	@Returnfiles bit,
	@Returnfiledescription varchar(max),
  @StartTime DATETIME = NULL,
  @EndTime DATETIME = NULL,
	@Suppressiontype int
    
AS

SET NOCOUNT ON

UPDATE [job].[DataProcessingItem] SET
	[AnalysisType] = @Analysistype,
	[DataServiceType] = @Dataservicetype,
	[Description] = @Description,
	[KitId] = @Kitid,
  [MatchTypeId] = @MatchTypeId,
	[MergePurgeType] = @Mergepurgetype,
	[NcoaDate] = @Ncoadate,
	[NcoaType] = @Ncoatype,
  [ProductionTargetId] = @ProductionTargetId,
	[ReturnFiles] = @Returnfiles,
	[ReturnFileDescription] = @Returnfiledescription,
  StartTime = @StartTime,
  EndTime = @EndTime,
	[SuppressionType] = @Suppressiontype
    OUTPUT inserted.Id AS [ID], inserted.[RowVersion] as [VERSION]
WHERE
	[Id] = @Id
AND [RowVersion] = @Version	

--endregion

GO