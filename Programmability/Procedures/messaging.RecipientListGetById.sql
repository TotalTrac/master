﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [messaging].[RecipientListGetById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [messaging].[RecipientListGetById]
-- Date Generated: Thursday, June 1, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [messaging].[RecipientListGetById]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[CreatedById],
	[MessageId],
	[RecipientUserId],
	[Created],
	[RowVersion]
FROM
	[messaging].[RecipientLists]
WHERE
	[Id] = @Id

--endregion

GO