﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[FoldingItemCutDeleteById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[FoldingItemCutDeleteById]
-- Date Generated: Monday, February 22, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[FoldingItemCutDeleteById]
	@Id int
AS

SET NOCOUNT ON

DELETE FROM [job].[FoldingItemCuts]
WHERE
	[Id] = @Id

--endregion

GO