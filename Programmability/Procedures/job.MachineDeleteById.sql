﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[MachineDeleteById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[MachineDeleteById]
-- Date Generated: Thursday, September 1, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[MachineDeleteById]
	@Id int
AS

SET NOCOUNT ON

DELETE FROM [job].[Machines]
WHERE
	[Id] = @Id

--endregion

GO