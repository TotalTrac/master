﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [dbo].[BillingChargeOverLogInsert]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[BillingChargeOverLogInsert]
-- Date Generated: Tuesday, February 7, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[BillingChargeOverLogInsert]
	@Contextstr varchar(50),
	@Contextid int,
	@Created datetime,
	@Createdbyid int,
	@Eventstr varchar(50),
	@Securitytoken varchar(50),
	@Package varchar(max),
	@Baseobj varchar(max),
	@Billingpackage varchar(max),
	@Bulk varchar(max),
	@Invoice varchar(max),
	@Item varchar(max),
	@Lineitem varchar(max),
	@Transaction varchar(max),
	@Customer varchar(max),
	@User varchar(max)

AS

SET NOCOUNT ON

INSERT INTO [dbo].[Billing_ChargeOverLog] (
	[ContextStr],
	[ContextId],
	[Created],
	[CreatedById],
	[EventStr],
	[SecurityToken],
	[Package],
	[BaseObj],
	[BillingPackage],
	[Bulk],
	[Invoice],
	[Item],
	[LineItem],
	[Transaction],
	[Customer],
	[User]
) 
OUTPUT		
		inserted.Id AS ID, NULL AS [Version]
VALUES (
	@Contextstr,
	@Contextid,
	@Created,
	@Createdbyid,
	@Eventstr,
	@Securitytoken,
	@Package,
	@Baseobj,
	@Billingpackage,
	@Bulk,
	@Invoice,
	@Item,
	@Lineitem,
	@Transaction,
	@Customer,
	@User
)

--endregion

GO