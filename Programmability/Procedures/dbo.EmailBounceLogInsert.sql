﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [dbo].[EmailBounceLogInsert]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[EmailBounceLogInsert]
-- Date Generated: Monday, November 2, 2015
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[EmailBounceLogInsert]
	@Messageid varchar(500),
	@Xmailgunsid varchar(100),
	@Attachmentcount int,
	@Bodyplaintext varchar(4000),
	@Code varchar(100),
	@Domain varchar(4000),
	@Error varchar(500),
	@Event varchar(50),
	@Messageheaders varchar(4000),
	@Sendid int,	
	@Recipient varchar(1000),
	@Signature varchar(1000),
	@Timestamp varchar(50),
	@Token varchar(50),
	@Notification varchar(500),
	@Campaignid varchar(500),
	@Tag varchar(500),
	@Mailinglist varchar(500),
	@Customdata varchar(4000)

AS

SET NOCOUNT ON

INSERT INTO [dbo].[mailgun_BounceLog] (
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
) 
OUTPUT		
		inserted.Id AS ID, NULL AS [VERSION]
VALUES (
	@Messageid,
	@Xmailgunsid,
	@Attachmentcount,
	@Bodyplaintext,
	@Code,
	@Domain,
	@Error,
	@Event,
	@Messageheaders,
	@Sendid,	
	@Recipient,
	@Signature,
	@Timestamp,
	@Token,
	@Notification,
	@Campaignid,
	@Tag,
	@Mailinglist,
	@Customdata
)

--endregion
GO