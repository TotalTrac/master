﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [usps].[PostageUsageItemInsert]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [usps].[PostageUsageItemInsert]
-- Date Generated: Thursday, July 21, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [usps].[PostageUsageItemInsert]
	@Accountid int,
	@Actual decimal(11, 2),
	@Billed decimal(11, 2),
	@Created datetime,
	@Createdbyid int,
	@Date date,
	@Jobid int,
	@Notes nvarchar(1000)

AS

SET NOCOUNT ON

INSERT INTO [usps].[PostageUsageItems] (
	[AccountId],
	[Actual],
	[Billed],
	[Created],
	[CreatedById],
	[Date],
	[JobId],
	[Notes]
) 
OUTPUT		
		inserted.Id AS ID, inserted.Rowversion AS [VERSION]
VALUES (
	@Accountid,
	@Actual,
	@Billed,
	@Created,
	@Createdbyid,
	@Date,
	@Jobid,
	@Notes
)

--endregion

GO