﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [job].[SignoffItemsGetByKitId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[SignoffItemsGetByKitId]
-- Date Generated: Tuesday, February 23, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[SignoffItemsGetByJobId]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	so.[Id],
  so.Instructions,
	[Copies],
	[Random],
	[KitId],
	[Quantity],
  so.[SoDueDate],
	so.[RowVersion]
FROM
	[job].[SignoffItems] AS so
  INNER JOIN job.Kits k ON k.Id = KitId
WHERE
	k.JobId = @Id

--endregion
GO