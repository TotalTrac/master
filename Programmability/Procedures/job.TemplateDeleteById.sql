﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[TemplateDeleteById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[TemplateDeleteById]
-- Date Generated: Tuesday, March 15, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[TemplateDeleteById]
	@Id int
AS

SET NOCOUNT ON

DELETE FROM [job].[Templates]
WHERE
	[Id] = @Id

--endregion

GO