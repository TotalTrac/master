﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [dbo].[BillingCategoriesGetByItemIdPaged]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[BillingCategoriesGetByItemIdPaged]
-- Date Generated: Monday, June 19, 2017
------------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE [dbo].[BillingCategoriesGetByItemIdPaged]
	@Id int
,
    @PageNumber INT = 1,
    @PageSize   INT = 10
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED


;WITH pg AS
  (
    SELECT Id
      FROM [dbo].[BillingCategories] main
      WHERE 	[ItemId] = @Id

      ORDER BY Id
      OFFSET @PageSize * (@PageNumber - 1) ROWS
      FETCH NEXT @PageSize ROWS ONLY
  )
  SELECT 	
	[sub].[Id],
	[sub].[CategoryId],
	[sub].[ItemId],
	[sub].[Name],
	[sub].[Rowversion]
  FROM [dbo].[BillingCategories] sub
  WHERE EXISTS (SELECT 1 FROM pg WHERE pg.Id = sub.Id)
  ORDER BY sub.Id OPTION (RECOMPILE);

--endregion

GO