﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [dbo].[EmailBounceLogsGetAll]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[EmailBounceLogsGetAll]
-- Date Generated: Monday, November 2, 2015
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[EmailBounceLogsGetAll]
AS
BEGIN

	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ COMMITTED

	SELECT
		[Id],
		[MessageId],
		[XMailGunSid],
		[AttachmentCount],
		[BodyPlainText],
		[Code],
		[Domain],
		[Error],
		[Event],
		[MessageHeaders],
		[SendId],	
		[Recipient],
		[Signature],
		[TimeStamp],
		[Token],
		[Notification],
		[CampaignId],
		[Tag],
		[MailingList],
		[CustomData]
	FROM
		[dbo].[mailgun_BounceLog]

END
GO