﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[FoldingItemCutGetById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[FoldingItemCutGetById]
-- Date Generated: Monday, February 22, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[FoldingItemCutGetById]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Baseline],
	[CutType],
	[FoldingItemId],
	[Measurement],
	[RowVersion]
FROM
	[job].[FoldingItemCuts]
WHERE
	[Id] = @Id

--endregion

GO