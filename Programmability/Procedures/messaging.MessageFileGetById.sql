﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [messaging].[MessageFileGetById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [messaging].[MessageFileGetById]
-- Date Generated: Thursday, June 1, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [messaging].[MessageFileGetById]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[ContentTypeId],
	[Compressed],
	[Data],
	[Description],
	[Name],
	[Size],
	[TypeId],
	[Uploaded],
	[RowVersion]
FROM
	[messaging].[MessageFiles]
WHERE
	[Id] = @Id

--endregion

GO