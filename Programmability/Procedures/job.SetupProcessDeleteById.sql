﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[SetupProcessDeleteById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[SetupProcessDeleteById]
-- Date Generated: Friday, September 9, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[SetupProcessDeleteById]
	@Id int
AS

SET NOCOUNT ON

DELETE FROM [job].[SetupProcesses]
WHERE
	[Id] = @Id

--endregion

GO