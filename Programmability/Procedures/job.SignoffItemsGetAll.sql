﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [job].[SignoffItemsGetAll]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[SignoffItemsGetAll]
-- Date Generated: Tuesday, February 23, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[SignoffItemsGetAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Copies],
  Instructions,
	[Random],
	[KitId],
	[Quantity],
  [SoDueDate],
	[RowVersion]
FROM
	[job].[SignoffItems]

--endregion

GO