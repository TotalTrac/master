﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [job].[AffixingPersonalizationItemsGetByFeedId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[AffixingPersonalizationItemsGetByFeedId]
-- Date Generated: Monday, February 22, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[AffixingPersonalizationItemsGetByFeedId]
	@Id int
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
WHERE
	[FeedId] = @Id

--endregion

GO