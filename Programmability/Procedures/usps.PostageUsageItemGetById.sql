﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [usps].[PostageUsageItemGetById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [usps].[PostageUsageItemGetById]
-- Date Generated: Thursday, July 21, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [usps].[PostageUsageItemGetById]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[AccountId],
	[Actual],
	[Billed],
	[Created],
	[CreatedById],
	[Date],
	[JobId],
	[Notes],
	[RowVersion]
FROM
	[usps].[PostageUsageItems]
WHERE
	[Id] = @Id

--endregion

GO