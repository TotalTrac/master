﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[SeedItemDeleteById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[SeedItemDeleteById]
-- Date Generated: Monday, January 11, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[SeedItemDeleteById]
	@Id int
AS

SET NOCOUNT ON

DELETE FROM [job].[SeedItems]
WHERE
	[Id] = @Id

--endregion

GO