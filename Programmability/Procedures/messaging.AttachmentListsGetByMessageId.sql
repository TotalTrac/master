﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [messaging].[AttachmentListGetById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [messaging].[AttachmentListGetById]
-- Date Generated: Thursday, June 1, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [messaging].[AttachmentListsGetByMessageId]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Created],
	[CreatedById],
	[MessageFileId],
	[MessageId],
	[RowVersion]
FROM
	[messaging].[AttachmentLists]
WHERE
	[MessageId] = @Id

--endregion
GO