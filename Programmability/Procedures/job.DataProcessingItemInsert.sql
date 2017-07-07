﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [job].[DataProcessingItemInsert]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[DataProcessingItemInsert]
-- Date Generated: Monday, February 29, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[DataProcessingItemInsert]
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
  @StartTime DATETIME = NULL,
  @EndTime DATETIME = NULL,
	@Returnfiledescription varchar(max),
	@Suppressiontype int

AS

SET NOCOUNT ON

INSERT INTO [job].[DataProcessingItem] (
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
  StartTime,
  EndTime,
	[SuppressionType]
) 
OUTPUT		
		inserted.Id AS ID, inserted.Rowversion AS [VERSION]
VALUES (
	@Analysistype,
	@Dataservicetype,
	@Description,
	@Kitid,
  @MatchTypeId,
	@Mergepurgetype,
	@Ncoadate,
	@Ncoatype,
  @ProductionTargetId,
	@Returnfiles,
	@Returnfiledescription,
  @StartTime,
  @EndTime,
	@Suppressiontype
)

--endregion

GO