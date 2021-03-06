﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [messaging].[InstantMessageUpdate]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [messaging].[InstantMessageUpdate]
-- Date Generated: Tuesday, June 6, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [messaging].[InstantMessageUpdate]
@Version				timestamp,
	@Id int,
	@Created datetime,
	@Createdbyid int,
	@Isread bit,
	@Message nvarchar(max),
	@Recipientuserid int,
	@Senderuserid int
    
AS

SET NOCOUNT ON

UPDATE [messaging].[InstantMessages] SET
	[Created] = @Created,
	[CreatedById] = @Createdbyid,
	[IsRead] = @Isread,
	[Message] = @Message,
	[RecipientUserId] = @Recipientuserid,
	[SenderUserId] = @Senderuserid
    OUTPUT inserted.Id AS [ID], inserted.[RowVersion] as [VERSION]
WHERE
	[Id] = @Id
AND [RowVersion] = @Version	

--endregion

GO