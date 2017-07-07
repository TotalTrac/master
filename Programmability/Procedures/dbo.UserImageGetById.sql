﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [dbo].[UserImageGetById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[UserImageGetById]
-- Date Generated: Wednesday, July 5, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[UserImageGetById]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[ClassName],
	[ContentTypeId],
	[Compressed],
	[Created],
	[CreatedById],
	[Data],
	[Description],
	[Name],
	[Size],
	[TypeId],
	[Uploaded],
	[RowVersion]
FROM
	[dbo].[UserImages]
WHERE
	[Id] = @Id

--endregion

GO