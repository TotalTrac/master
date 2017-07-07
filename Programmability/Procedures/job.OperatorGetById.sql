﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[OperatorGetById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[OperatorGetById]
-- Date Generated: Thursday, September 1, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[OperatorGetById]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[OperatorName],
	[OperatorTypeId],
	[RowVersion]
FROM
	[job].[Operators]
WHERE
	[Id] = @Id

--endregion

GO