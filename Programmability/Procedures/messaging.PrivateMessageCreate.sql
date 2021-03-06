﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [messaging].[PrivateMessageCreate]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [messaging].[PrivateMessageCreate]
-- Date Generated: Wednesday, June 7, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [messaging].[PrivateMessageCreate]
	@Attachmentlistid int,
	@Created datetime,
	@Createdbyid int,
	@Isread bit,
	@Isstarredrecipient bit,
	@Isstarredsender bit,
	@Istrashrecipient bit,
	@Istrashsender bit,
	@Message nvarchar(max),
	@Modified datetime,
	@Parentid int,
	@Recipientlistid int,
	@Senderuserid int,
	@Sentdate datetime,
	@Subject nvarchar(1000),
	@Trasheddaterecipient datetime,
	@Trasheddatesender datetime

AS

SET NOCOUNT ON

INSERT INTO [messaging].[PrivateMessages] (
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
	[TrashedDateSender]
) 
OUTPUT		
		inserted.Id AS ID, inserted.Rowversion AS [VERSION]
VALUES (
	@Attachmentlistid,
	@Created,
	@Createdbyid,
	@Isread,
	@Isstarredrecipient,
	@Isstarredsender,
	@Istrashrecipient,
	@Istrashsender,
	@Message,
	@Modified,
	@Parentid,
	@Recipientlistid,
	@Senderuserid,
	@Sentdate,
	@Subject,
	@Trasheddaterecipient,
	@Trasheddatesender
)

--endregion

GO