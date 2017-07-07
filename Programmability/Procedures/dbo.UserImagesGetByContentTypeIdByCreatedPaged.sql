﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [dbo].[UserImagesGetByContentTypeIdByCreatedPaged]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[UserImagesGetByContentTypeIdByCreatedPaged]
-- Date Generated: Wednesday, July 5, 2017
------------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE [dbo].[UserImagesGetByContentTypeIdByCreatedPaged]
	@Id int
,
    @From DATETIME,
    @To DATETIME,
    @PageNumber INT = 1,
    @PageSize   INT = 10
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED


;WITH pg AS
  (
    SELECT Id
      FROM [dbo].[UserImages] main
      WHERE 	[ContentTypeId] = @Id
 AND Created BETWEEN @From AND @To
      ORDER BY Id
      OFFSET @PageSize * (@PageNumber - 1) ROWS
      FETCH NEXT @PageSize ROWS ONLY
  )
  SELECT 	
	[sub].[Id],
	[sub].[ClassName],
	[sub].[ContentTypeId],
	[sub].[Compressed],
	[sub].[Created],
	[sub].[CreatedById],
	[sub].[Data],
	[sub].[Description],
	[sub].[Name],
	[sub].[Size],
	[sub].[TypeId],
	[sub].[Uploaded],
	[sub].[RowVersion]
  FROM [dbo].[UserImages] sub
  WHERE EXISTS (SELECT 1 FROM pg WHERE pg.Id = sub.Id)
  ORDER BY sub.Id OPTION (RECOMPILE);

--endregion

GO