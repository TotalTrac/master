﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [dbo].[EmailSpamLogGetById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[EmailSpamLogGetById]
-- Date Generated: Monday, November 2, 2015
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[EmailSpamLogGetById]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[MessageId],
	[Event],
	[Recipient],
	[Domain],
	[MessageHeaders],
	[CampaignId],
	[CampaignName],
	[Tag],
	[MailingList],
	[SendId],
	
	[TimeStamp],
	[Token],
	[Signature]
FROM
	[dbo].[mailgun_SpamLog]
WHERE
	[Id] = @Id

--endregion
GO