﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [messaging].[PrivateMessagesGetByAttachmentListId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [messaging].[PrivateMessagesGetByAttachmentListId]
-- Date Generated: Wednesday, June 7, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [messaging].[PrivateMessagesGetByAttachmentListId]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[AttachmentListId],
	[Created],
	[CreatedById],
	[IsRead],
	[IsStarredRecipient],
	[IsStarredSender],
	[IsTrashRecipient],
	[IsTrashSender],
	[Message],
	[Modified],
	[ParentId],
	[RecipientListId],
	[SenderUserId],
	[SentDate],
	[Subject],
	[TrashedDateRecipient],
	[TrashedDateSender],
	[RowVersion]
FROM
	[messaging].[PrivateMessages]
WHERE
	[AttachmentListId] = @Id

--endregion

GO