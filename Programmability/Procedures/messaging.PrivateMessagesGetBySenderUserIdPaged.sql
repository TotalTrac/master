﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [messaging].[PrivateMessagesGetBySenderUserIdPaged]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [messaging].[PrivateMessagesGetBySenderUserIdPaged]
-- Date Generated: Wednesday, June 7, 2017
------------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE [messaging].[PrivateMessagesGetBySenderUserIdPaged]
	@Id int
,
    @PageNumber INT = 1,
    @PageSize   INT = 10
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

;WITH pg AS (
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
  WHERE [SenderUserId] = @Id
  ORDER BY sub.Id DESC
  OFFSET @PageSize * (@PageNumber - 1) ROWS
      FETCH NEXT @PageSize ROWS ONLY
)

SELECT pg.* FROM pg ORDER BY pg.Id DESC

SELECT COUNT(sub.Id) AS TotalRows FROM [messaging].[PrivateMessages] sub
  WHERE [SenderUserId] = @Id
--endregion

GO