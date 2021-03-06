﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region job.[CuttingItemsGetByItemId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: job.[CuttingItemsGetByItemId]
-- Date Generated: Monday, January 18, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[CuttingItemsGetByItemId]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[FinalCount],
	[FinalHeight],
	[FinalWidth],
	[LocationType],
	[ItemId],
  StartTime,
  EndTime,
	[Rowversion]
FROM
	job.[CuttingItems]
WHERE
	[ItemId] = @Id

--endregion
GO