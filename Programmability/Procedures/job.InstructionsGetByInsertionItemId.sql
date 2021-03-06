﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[InstructionsGetByInsertionItemId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[InstructionsGetByInsertionItemId]
-- Date Generated: Monday, January 18, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[InstructionsGetByInsertionItemId]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[InsertionItemId],
	[Instructions],
	[Type]
FROM
	[job].[Instructions]
WHERE
	[InsertionItemId] = @Id

--endregion

GO