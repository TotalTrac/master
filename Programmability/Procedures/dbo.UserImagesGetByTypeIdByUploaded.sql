﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [dbo].[UserImagesGetByTypeIdByUploaded]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[UserImagesGetByTypeIdByUploaded]
-- Date Generated: Wednesday, July 5, 2017
------------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE [dbo].[UserImagesGetByTypeIdByUploaded]
    @To DATETIME,
    @From DATETIME,
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
    Uploaded  BETWEEN @From AND @To AND 	[TypeId] = @Id


--endregion

GO