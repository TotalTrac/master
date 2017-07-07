﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [dbo].[PersonalizationItemsGetAll]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[PersonalizationItemsGetAll]
-- Date Generated: Thursday, January 14, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[InsertionPersonalizationItemsGetAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
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
  StartTime,
  EndTime,
	[TargetId],
	[Rowversion]
FROM
	job.[InsertionPersonalizationItem]

--endregion
GO