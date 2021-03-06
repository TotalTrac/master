﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [dbo].[EmailClickLogsGetAll]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[EmailClickLogsGetAll]
-- Date Generated: Monday, November 2, 2015
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[EmailClickLogsGetAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Event],
	[Recipient],
	[Domain],
	[Ip],
	[Country],
	[Region],
	[City],
	[UserAgent],
	[DeviceType],
	[ClientType],
	[ClientName],
	[ClientOs],
	[CampaignId],
	[CampaignName],
	[Tag],
	[Url],
	[MailingList],
	[SendId],	
	[Timestamp],
	[Token],
	[Signature],
	[BodyPlainText]
FROM
	[dbo].[mailgun_ClickLog]

--endregion
GO