﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [job].[TemplatesGetAll]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[TemplatesGetAll]
-- Date Generated: Tuesday, March 15, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[TemplatesGetAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[ClientId],
	[Created],
	[CreatedById],
	[Json],
	[Name],
	[TemplateTypeId],
  [RowVersion]
FROM
	[job].[Templates]

--endregion

GO