﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region job.[CuttingItemGetById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: job.[CuttingItemGetById]
-- Date Generated: Monday, January 18, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[CuttingItemGetById]
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
	[Id] = @Id

--endregion
GO