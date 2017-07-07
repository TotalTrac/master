﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [messaging].[InstantMessagesGetBySenderUserIdPaged]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [messaging].[InstantMessagesGetBySenderUserIdPaged]
-- Date Generated: Tuesday, June 6, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [messaging].[InstantMessagesGetBySenderUserIdPaged]
	@Id INT,
    @PageNumber INT = 1,
    @PageSize   INT = 10
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED


;WITH pg AS
  (
    SELECT Id
      FROM [messaging].[InstantMessages] main
      WHERE 	[SenderUserId] = @Id

      ORDER BY Id
      OFFSET @PageSize * (@PageNumber - 1) ROWS
      FETCH NEXT @PageSize ROWS ONLY
  )
  SELECT 	
	[sub].[Id],
	[sub].[Created],
	[sub].[CreatedById],
	[sub].[IsRead],
	[sub].[Message],
	[sub].[RecipientUserId],
	[sub].[SenderUserId],
	[sub].[RowVersion]
  FROM [messaging].[InstantMessages] sub
  WHERE EXISTS (SELECT 1 FROM pg WHERE pg.Id = sub.Id)
  ORDER BY sub.Id OPTION (RECOMPILE);

--endregion

GO