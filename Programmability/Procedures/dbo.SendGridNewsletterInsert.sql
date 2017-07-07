﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO


--region [dbo].[SendGridNewsletterInsert]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[SendGridNewsletterInsert]
-- Date Generated: Monday, September 21, 2015
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[SendGridNewsletterInsert]
	@Newsletteruserlistid int,
	@Newslettersendid int

AS

SET NOCOUNT ON

INSERT INTO [dbo].[SendGridNewsletters] (
	[NewsletterUserListId],
	[NewsletterSendId]
) 
OUTPUT		
		inserted.Id AS ID
VALUES (
	@Newsletteruserlistid,
	@Newslettersendid
)

--endregion
GO