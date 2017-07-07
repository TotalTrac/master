﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [job].[AffixingPersonalizationItemsGetAll]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[AffixingPersonalizationItemsGetAll]
-- Date Generated: Monday, February 22, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[AffixingPersonalizationItemsGetAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
  DataType,
	[Description],
	[FeedId],
	[Indicia],
	[AffixingItemId],
	[LaserTypeId],
	[LayoutId],
	[ModeId],
	[OrientationId],
	[RunDirectionId],
  StartTime,
  EndTime,
	[TargetId],
	[RowVersion]
FROM
	[job].[AffixingPersonalizationItem]

--endregion

GO