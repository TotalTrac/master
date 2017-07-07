﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [dbo].[PersonalizationItemsGetByKitId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[PersonalizationItemsGetAll]
-- Date Generated: Thursday, January 14, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[InsertionPersonalizationItemsGetByKitId]
@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	ipi.[Id],
  DataType,
	[Description],
	[FeedId],
	[Indicia],
	[InsertItemId],
	[LaserTypeId],
	[LayoutId],
	[ModeId],
	[OrientationId],
  [RunDirectionId],
  ipi.StartTime,
  ipi.EndTime,
	[TargetId],
	ipi.[Rowversion]
FROM
	job.[InsertionPersonalizationItem] AS ipi
  INNER JOIN job.InsertionItems ii ON ii.Id = InsertItemId

WHERE
	ii.KitId = @Id

--endregion
GO