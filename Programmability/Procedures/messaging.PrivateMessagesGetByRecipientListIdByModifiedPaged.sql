﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [messaging].[PrivateMessagesGetByRecipientListIdByModifiedPaged]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [messaging].[PrivateMessagesGetByRecipientListIdByModifiedPaged]
-- Date Generated: Wednesday, June 7, 2017
------------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE [messaging].[PrivateMessagesGetByRecipientListIdByModifiedPaged]
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
      FROM [messaging].[PrivateMessages] main
      WHERE 	[RecipientListId] = @Id
 AND Modified BETWEEN @From AND @To
      ORDER BY Id
      OFFSET @PageSize * (@PageNumber - 1) ROWS
      FETCH NEXT @PageSize ROWS ONLY
  )
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
  WHERE EXISTS (SELECT 1 FROM pg WHERE pg.Id = sub.Id)
  ORDER BY sub.Id OPTION (RECOMPILE);

--endregion

GO