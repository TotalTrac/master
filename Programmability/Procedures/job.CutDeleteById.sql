﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[CutDeleteById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[CutDeleteById]
-- Date Generated: Tuesday, March 15, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[CutDeleteById]
	@Id int
AS

SET NOCOUNT ON

DELETE FROM [job].[Cuts]
WHERE
	[Id] = @Id

--endregion

GO