﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[SignoffItemDeleteById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[SignoffItemDeleteById]
-- Date Generated: Tuesday, February 23, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[SignoffItemDeleteById]
	@Id int
AS

SET NOCOUNT ON

DELETE FROM [job].[SignoffItems]
WHERE
	[Id] = @Id

--endregion

GO