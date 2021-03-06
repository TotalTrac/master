﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [messaging].[InstantMessageCreate]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [messaging].[InstantMessageCreate]
-- Date Generated: Tuesday, June 6, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [messaging].[InstantMessageCreate]
	@Created datetime,
	@Createdbyid int,
	@Isread bit,
	@Message nvarchar(max),
	@Recipientuserid int,
	@Senderuserid int

AS

SET NOCOUNT ON

INSERT INTO [messaging].[InstantMessages] (
	[Created],
	[CreatedById],
	[IsRead],
	[Message],
	[RecipientUserId],
	[SenderUserId]
) 
OUTPUT		
		inserted.Id AS ID, inserted.Rowversion AS [VERSION]
VALUES (
	@Created,
	@Createdbyid,
	@Isread,
	@Message,
	@Recipientuserid,
	@Senderuserid
)

--endregion

GO