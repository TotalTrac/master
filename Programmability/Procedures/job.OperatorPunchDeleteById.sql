﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[OperatorPunchDeleteById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[OperatorPunchDeleteById]
-- Date Generated: Thursday, September 1, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[OperatorPunchDeleteById]
	@Id int
AS

SET NOCOUNT ON

DELETE FROM [job].[OperatorPunches]
WHERE
	[Id] = @Id

--endregion

GO