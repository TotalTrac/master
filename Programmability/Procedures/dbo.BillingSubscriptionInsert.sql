﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [dbo].[BillingSubscriptionInsert]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[BillingSubscriptionInsert]
-- Date Generated: Monday, April 17, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[BillingSubscriptionInsert]
	@Clientid int,
	@Created datetime,
	@Createdbyid int,
	@Lastupdated datetime

AS

SET NOCOUNT ON

INSERT INTO [dbo].[BillingSubscriptions] (
	[ClientId],
	[Created],
	[CreatedById],
	[LastUpdated]
) 
OUTPUT		
		inserted.Id AS ID, inserted.Rowversion AS [VERSION]
VALUES (
	@Clientid,
	@Created,
	@Createdbyid,
	@Lastupdated
)

--endregion

GO