﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [job].[DataProcessingItemsGetBySuppresionType]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[DataProcessingItemsGetBySuppresionType]
-- Date Generated: Thursday, January 7, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[DataProcessingItemsGetBySuppresionType]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[AnalysisType],
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
FROM
	[job].[DataProcessingItem]
WHERE
	SuppressionType = @Id

--endregion

GO