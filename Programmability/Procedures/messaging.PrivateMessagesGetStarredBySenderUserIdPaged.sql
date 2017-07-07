﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [messaging].[PrivateMessagesGetByRecipientListId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [messaging].[PrivateMessagesGetByRecipientListId]
-- Date Generated: Wednesday, June 7, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [messaging].[PrivateMessagesGetStarredBySenderUserIdPaged]
	@Id int,
    @PageNumber INT = 1,
    @PageSize   INT = 10
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

  SELECT 	
	[sub].[Id],
	[sub].[AttachmentListId],
	[sub].[Created],
	[sub].[CreatedById],
	[sub].[IsRead],
	[sub].[IsStarredRecipient],
	[sub].[IsStarredSender],
	[sub].[IsTrashRecipient],
	[sub].[IsTrashSender],
	[sub].[Message],
	[sub].[Modified],
	[sub].[ParentId],
	[sub].[RecipientListId],
	[sub].[SenderUserId],
	[sub].[SentDate],
	[sub].[Subject],
	[sub].[TrashedDateRecipient],
	[sub].[TrashedDateSender],
	[sub].[RowVersion]
  FROM [messaging].[PrivateMessages] sub
 WHERE 	sub.SenderUserId = @Id AND (sub.IsStarredSender = 1) AND (sub.IsTrashSender IS NULL OR sub.IsTrashSender = 0)

      ORDER BY Id DESC
      OFFSET @PageSize * (@PageNumber - 1) ROWS
      FETCH NEXT @PageSize ROWS ONLY;

SELECT COUNT(pm.Id) AS TotalRows FROM messaging.PrivateMessages pm
WHERE 	pm.SenderUserId = @Id AND (pm.IsStarredSender = 1) AND (pm.IsTrashSender IS NULL OR pm.IsTrashSender = 0)
--endregion
GO