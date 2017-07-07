﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [messaging].[InstantMessagesGetByRecipientUserId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [messaging].[InstantMessagesGetByRecipientUserId]
-- Date Generated: Monday, June 5, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [messaging].[InstantMessagesGetBySenderUserIdAndRecipientUserIdPaged]
	@SenderId INT,
  @RecipientId INT,
  @PageNumber INT = 1,
  @PageSize   INT = 10
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

  ;WITH pg AS
  (
    SELECT Id
      FROM messaging.InstantMessages im
      WHERE
	      ([RecipientUserId] = @RecipientId AND SenderUserId = @SenderId) OR ([RecipientUserId] = @SenderId AND SenderUserId = @RecipientId)
      ORDER BY Id
      OFFSET @PageSize * (@PageNumber - 1) ROWS
      FETCH NEXT @PageSize ROWS ONLY
  )
  SELECT 	
  im.[Id],
	im.[Created],
	im.[CreatedById],
  im.IsRead,
	im.[Message],
	im.[RecipientUserId],
	im.[SenderUserId],
	im.[RowVersion]
  FROM messaging.InstantMessages AS im
  WHERE EXISTS (SELECT 1 FROM pg WHERE pg.Id = im.Id)
  ORDER BY im.Created OPTION (RECOMPILE);

--endregion
GO