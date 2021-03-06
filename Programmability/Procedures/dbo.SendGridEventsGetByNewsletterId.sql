﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO


--region [dbo].[SendGridEventsGetByNewsletterId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[SendGridEventsGetByNewsletterId]
-- Date Generated: Monday, September 21, 2015
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[SendGridEventsGetByNewsletterId]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Category],
	[Email],
	[EventId],
	[EventName],
	[GroupId],
	[Ip],
	[MessageId],
	[NewsletterId],
	[Reason],
	[Response],
	[SendAt],
	[SmtpId],
	[Status],
	[SystemId],
	[TimeStamp],
	[Type],
	[Url],
	[UserAgent],
	[Created]
FROM
	[dbo].[SendGridEvents]
WHERE
	[NewsletterId] = @Id

--endregion
GO