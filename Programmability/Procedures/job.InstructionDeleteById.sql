﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[InstructionDeleteById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[InstructionDeleteById]
-- Date Generated: Monday, January 18, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[InstructionDeleteById]
	@Id int
AS

SET NOCOUNT ON

DELETE FROM [job].[Instructions]
WHERE
	[Id] = @Id

--endregion

GO