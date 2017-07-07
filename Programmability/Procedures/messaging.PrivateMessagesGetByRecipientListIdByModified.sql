﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [messaging].[PrivateMessagesGetByRecipientListIdByModified]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [messaging].[PrivateMessagesGetByRecipientListIdByModified]
-- Date Generated: Wednesday, June 7, 2017
------------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE [messaging].[PrivateMessagesGetByRecipientListIdByModified]
    @To DATETIME,
    @From DATETIME,
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
    Modified  BETWEEN @From AND @To AND 	[RecipientListId] = @Id


--endregion

GO