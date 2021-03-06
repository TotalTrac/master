﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [messaging].[RecipientListUpdate]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [messaging].[RecipientListUpdate]
-- Date Generated: Thursday, June 1, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [messaging].[RecipientListUpdate]
@Version				timestamp,
	@Id int,
	@Createdbyid int,
	@Messageid int,
	@Recipientuserid int,
	@Created datetime
    
AS

SET NOCOUNT ON

UPDATE [messaging].[RecipientLists] SET
	[CreatedById] = @Createdbyid,
	[MessageId] = @Messageid,
	[RecipientUserId] = @Recipientuserid,
	[Created] = @Created
    OUTPUT inserted.Id AS [ID], inserted.[RowVersion] as [VERSION]
WHERE
	[Id] = @Id
AND [RowVersion] = @Version	

--endregion

GO